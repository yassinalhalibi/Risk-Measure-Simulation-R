# Quantitative Risk Modeling & Tail-Risk Assessment for Financial Portfolios

## Project Overview
This project implements a Monte Carlo simulation engine in **R** to analyze the behavior of financial risk measures under heavy-tailed loss distributions. It was developed as part of my Master's Thesis in Financial Mathematics.

## The Business Problem: Financial institutions and insurance companies must accurately predict potential extreme losses to establish adequate capital reserves and optimize product pricing. Traditional metrics like Value at Risk **(VaR)** often fail to capture extreme tail risks, leaving institutions vulnerable to catastrophic market events.

## The Solution: This project utilizes Monte Carlo simulations in R to evaluate and compare advanced risk measures. By modeling compound loss distributions (Poisson-lognormal and Pareto), the code calculates VaR, Expected Shortfall (ES), and the Gini Shortfall to provide a comprehensive assessment of extreme financial risks. This allows institutions to quantify the severity and inequality of losses beyond the VaR threshold. Furthermore, the model includes a sensitivity analysis of volatility (\sigma) and frequency (\lambda) parameters.

## Tech Stack & Methodologies: > * Language: R  
Core Method: Monte Carlo Simulation  
Risk Metrics: Value at Risk (VaR), Expected Shortfall (ES), Gini Shortfall (GS)  
Distributions Modeled: Poisson, Lognormal, Pareto  

## Key Features
* **Distributions:** Simulates aggregate losses using **Compound Poisson-Lognormal** and **Pareto** distributions to model insurance claims.
* **Risk Measures:** Calculates **Value at Risk (VaR)** and **Expected Shortfall (ES)** at 95%, 97%, and 99% confidence levels.
* **Tail-Gini Analysis:** Implements a novel application of the **Gini Coefficient** specifically for "Tail Losses" (losses $\ge$ VaR) to measure the inequality of extreme events.


## Findings
* **Volatility Sensitivity:** The simulation proves that as volatility ($\sigma$) increases, the inequality of losses (Gini) increases, necessitating higher capital reserves.
* **Tail Risk:** The model demonstrates that Tail-Gini provides unique insights into the structure of extreme losses that standard VaR misses.

## Technologies
* **Language:** R
* **Libraries:** `ineq` (Inequality measures)
