# Comparative Risk Measure Analysis: VaR, ES, and Tail-Gini

## Project Overview
This project implements a Monte Carlo simulation engine in **R** to analyze the behavior of financial risk measures under heavy-tailed loss distributions. It was developed as part of my Master's Thesis in Financial Mathematics.

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
