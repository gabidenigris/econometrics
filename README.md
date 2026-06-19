# Econometrics

A structured collection of lecture notes and reproducible code covering the three core branches of applied econometrics: **Cross Section**, **Time Series**, and **Panel Data**.

Each module pairs the theory (identification, assumptions, estimators) with hands-on implementations in R and Python, so the same concept can be read, derived, and run end to end.


---

## Repository structure

```
econometrics/
├── README.md
├── cross-section/
│   ├── README.md
│   ├── aula1.R
│   ├── aula2.R
│   └── aula3.R
├── time-series/
│   ├── README.md
│   ├── aula1.R
│   ├── aula2.R
│   └── aula3.R
└── panel-data/
    ├── README.md
    ├── aula1.R
    ├── aula2.R
    └── aula3.R
```

---

## Modules

### 1. Cross Section

> Microeconometric methods applied to data observed at a single point in time.

**Project:** [link here](#)

Topics covered:
- Ordinary Least Squares (OLS) and the Gauss-Markov assumptions
- Heteroskedasticity, robust standard errors, and clustering
- Instrumental variables (IV) and Two-Stage Least Squares (2SLS)
- Binary and limited dependent variables (Logit, Probit, Tobit)
- Causal inference: matching, propensity scores, and selection

---

### 2. Time Series

> Modeling and forecasting data observed sequentially over time.

**Project:** [link here](https://github.com/gabidenigris/econometrics/tree/main/time-series#readme)

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

**Project:** [link here](#)

Topics covered:
- Pooled OLS, Fixed Effects, and Random Effects
- The Hausman test for model selection
- First differences and within estimators
- Dynamic panels and the Arellano-Bond GMM estimator
- Difference-in-Differences (DiD), including staggered adoption (Callaway and Sant'Anna)

---

## Tools and languages

| Purpose | R | Python |
|---|---|---|
| Core estimation | `fixest`, `plm`, `sandwich`, `lmtest` | `statsmodels`, `linearmodels` |
| Time series | `forecast`, `urca`, `vars`, `rugarch` | `statsmodels.tsa`, `arch` |
| Causal / panel | `did`, `AER`, `gmm` | `linearmodels.panel`, `differences` |
| Reporting | `modelsummary`, `ggplot2` | `pandas`, `matplotlib` |


---

## Author

**Gabriela De Nigris**


[Website](https://gabidenigris.github.io/) · [LinkedIn](https://www.linkedin.com/in/gabrieladenigris)
