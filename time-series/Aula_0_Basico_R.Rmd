---
title: 'Aula 0: Software R - básico'
author: "Silvio Costa"
date: "`r Sys.Date()`"
output:
  pdf_document: default
  html_notebook: default
  html_document:
format:
  html:
    fig-width: 8
    fig-height: 4
    code-fold: true
editor_options: 
  markdown: 
    wrap: 72
---

## 1. Criação de séries temporais

```{r}

set.seed(123)

# Sequência de datas: gerando 72 meses de dados
datas <- seq(as.Date("2020-01-01"), by="month", length.out=72)

# 72 valores gerados a partir de uma distribuição uniforme entre [0-100] (random uniform)
valores <- runif(72, min=0, max=100)

# Data frame
df <- data.frame(data=datas, valor=valores)

# Visualização do data frame
df

# Estatísticas de cada coluna do data frame
summary(df)

```
```{r}

# um data frame não é uma ts, precisa criar essa classe especial de dados!

# Série temporal (classe ts); 
serie_ts <- ts(valores, start=c(2020,1), frequency=12)

# visualizar a série temporal
plot(serie_ts, main = "Titulo do gráfico", xlab = "Eixo X de datas", ylab = "Eixo Y de valores", col = "blue")

summary(serie_ts)
```

## 2. Alteração de frequência

```{r}

# Agregar para anual
aggregate(serie_ts, FUN=mean)

# Usando o pacote zoo/xts para mudar frequência
library(zoo)

# serie_zoo mensal
serie_zoo <- zoo(valores, datas)

# serie trimestralizada pela média dos meses
serie_trimestral <- aggregate(serie_zoo, as.yearqtr, mean)

# Visualize as duas séries
par(mfrow=c(1,2))

plot(serie_zoo, xlab="Meses", ylab="Valores", main = "Série mensal", col="navy", lwd=1)  

plot(serie_trimestral, xlab="Trimestres", ylab="Valores", main = "Série trimestral, agregada pela média", col="red", lwd=1)


```

## 3. Seleção e filtragem por datas

```{r}

# formato dataframe pode ser útil para filtragem de datas e visualização (usando ggplot2, por exemplo)
# para usar as funções específicas de séries de tempo, é possível converter df em ts, xts, zoo

library(xts)
library(zoo)

df_2023 <- subset(df, format(data, "%Y") == "2023")
df_jan21 <- subset(df, format(data, "%Y-%m") >= "2021-01")
df_periodo <- subset(df, data >= as.Date("2024-06-01") & data <= Sys.Date())

par(mfrow=c(3,1))

plot(zoo(df_2023[,c("valor")], order.by=df_2023$data), main="Serie zoo filtrada", col="navy")

plot( ts(df_jan21[, c("valor")], start = c(2021, 1), frequency = 12) , main="Serie ts filtrada", col="red")

plot(xts(df_periodo[,c("valor")], order.by=df_periodo$data), main="Serie xts filtrada", col="darkgreen")
```




## 4. Múltiplas séries

```{r}

# crie uma nova sequencia de tempo
serie2 <- runif(72, 0, 50)

# crie um dataframe com serie 1 e serie 2 e mesmo vetor de datas
df_mult <- data.frame(data=datas, serie1=valores, serie2=serie2)

# converta a sequencia do dataframe em uma serie temporal zoo
serie_zoo2 <- zoo(df_mult[,-1], df_mult$data)

# visualize ambas as séries
plot(serie_zoo2)

```


## 5. Defasagens e diferenças

```{r}

# use ppp::fff para acessar diretamente uma função fff específica de um pacote ppp

df$lag1 <- dplyr::lag(df$valor, 1)

df$lag12 <- dplyr::lag(df$valor, 12)

df$diff1 <- c(NA, diff(df$valor, lag=1))

# Médias móveis
df$media_3m <- zoo::rollmean(df$valor, k=3, fill=NA)

# Soma acumulada
df$soma_acum <- cumsum(df$valor)


# visualize multiplas séries de tempo convertendo diretamente do dataframe
plot(zoo(df[,c("valor", "lag1", "lag12")], order.by=df$data), main="Serie zoo filtrada", col="navy")

par(mfrow=c(1,3))

plot(zoo(df[,c("diff1")], order.by=df$data), main="Serie zoo filtrada", col="blue")
plot(zoo(df[,c("media_3m")], order.by=df$data), main="Serie zoo filtrada", col="red")
plot(zoo(df[,c("soma_acum")], order.by=df$data), main="Serie zoo filtrada", col="darkgreen")

```

## 6. Reamostragem e agregação

```{r}

library(zoo)

# Média anual
serie_anual <-aggregate(serie_zoo, by = format(index(serie_zoo), "%Y"), mean)

par(mfrow=c(1,2))
plot(serie_zoo, main="série original mensal")
plot(serie_anual, main="série anualizada")

# o operador pipe do R cria uma sequência de operações, na qual o resultado de uma função é passada como argumento para a próxima chamada do pipe
# mutate: cria uma nova coluna chamada ano, que pega o ano de cada data na base de dados
# group_by: agrupa os dados da série por ano
# summarise: para cada grupo (cada ano), calcula a média da coluna valor

# Agrupar por ano
library(dplyr)
df %>% mutate(ano=format(data, "%Y")) %>% group_by(ano) %>% summarise(media=mean(valor))

```

## 7. Criando datas a partir de strings

```{r}

datas_str <- c("2021-01-01", "2021-01-02")
datas <- as.Date(datas_str)
df_str <- data.frame(data=datas, valor=c(10, 20))

```

## 8. Criando séries simuladas

```{r}

n <- 100
datas <- seq(as.Date("2020-01-01"), by="month", length.out=n)
tendencia <- seq(10, 50, length.out=n)
sazonal <- 10 * sin(2 * pi * (1:n) / 12)
ruido <- rnorm(n, 0, 3)

serie_sintetica <- tendencia + sazonal + ruido

serie_ts <- ts(serie_sintetica, start=c(2020,1), frequency=12)

```
