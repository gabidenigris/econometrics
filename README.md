# Econometrics

A structured collection of lecture notes and reproducible code covering the three core branches of applied econometrics: **Cross Section**, **Time Series**, and **Panel Data**.

Each module pairs the theory (identification, assumptions, estimators) with hands-on implementations in R and Python, so the same concept can be read, derived, and run end to end.


---

## Repository structure

```
econometrics/
├── README.md
├── cross-section/
│   ├── aula1.R
│   ├── aula2.R
│   └── aula3.R
├── time-series/
│   ├── aula1.R
│   ├── aula2.R
│   └── aula3.R
└── panel-data/
    ├── aula1.R
    ├── aula2.R
    └── aula3.R
```

---

## Modules

### 1. Cross Section

> Microeconometric methods applied to data observed at a single point in time.

**Project:** [link here](https://github.com/gabidenigris/econometrics/tree/main/cross-section) <img src="https://media.giphy.com/media/v1.Y2lkPTc5MGI3NjExbnh1NmF5NjI5dG1oeWFveGhibGYwbTh5NXVwd3d5aHlzNXN2amZxeSZlcD12MV9naWZzX3NlYXJjaCZjdD1n/17mNCcKU1mJlrbXodo/giphy.gif" width="16"/><br>

Topics covered:
- Ordinary Least Squares (OLS) and the Gauss-Markov assumptions
- Heteroskedasticity, robust standard errors, and clustering
- Instrumental variables (IV) and Two-Stage Least Squares (2SLS)
- Binary and limited dependent variables (Logit, Probit, Tobit)
- Causal inference: matching, propensity scores, and selection

---

### 2. Time Series

> Modeling and forecasting data observed sequentially over time.

**Project:** [link here](https://github.com/gabidenigris/econometrics/tree/main/time-series#readme) ✅

Topics covered:
- Stationarity, unit roots, and the ADF and KPSS tests
- Autocorrelation, ACF, and PACF
- ARIMA and seasonal SARIMA models
- Cointegration and Error Correction Models (VECM)
- Vector Autoregressions (VAR) and impulse response functions
- Volatility modeling with ARCH and GARCH

---

### 3. Panel Data

> Estimators that exploit both the cross-sectional and the time dimension.

**Project:** [link here](https://github.com/gabidenigris/econometrics/tree/main/panel-data) <img src="https://media.giphy.com/media/v1.Y2lkPTc5MGI3NjExbnh1NmF5NjI5dG1oeWFveGhibGYwbTh5NXVwd3d5aHlzNXN2amZxeSZlcD12MV9naWZzX3NlYXJjaCZjdD1n/17mNCcKU1mJlrbXodo/giphy.gif" width="16"/><br>

Topics covered:
- Pooled OLS, Fixed Effects, and Random Effects
- The Hausman test for model selection
- First differences and within estimators
- Dynamic panels and the Arellano-Bond GMM estimator
- Difference-in-Differences (DiD), including staggered adoption (Callaway and Sant'Anna)

---


## Author

**Gabriela De Nigris**


[Website](https://gabidenigris.github.io/) · [LinkedIn](https://www.linkedin.com/in/gabrieladenigris)
