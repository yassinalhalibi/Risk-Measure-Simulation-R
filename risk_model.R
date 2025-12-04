# Load necessary library
if(!require(ineq)) install.packages("ineq")
library(ineq)

# ---------------------------------------------------------
# PARAMETERS
# ---------------------------------------------------------
alpha_values_LN <- c(95, 97, 99) # Confidence levels (Lognormal)
alpha_values_Pa <- c(95, 96, 97, 98, 99) # Confidence levels (Pareto)
mu <- 2
sig <- 0.5
shape <- 3
n_simulations <- 100000

# ---------------------------------------------------------
# SIMULATION FUNCTIONS
# ---------------------------------------------------------

# Function to calculate Value at Risk (VaR)
ValueatRisk <- function(loss, alpha) {
  var <- quantile(loss, alpha / 100, names = FALSE)
  return(var)
}

# Function to calculate Expected Shortfall (ES)
ES <- function(loss, alpha) {
  tail_list <- loss[loss >= ValueatRisk(loss, alpha)]
  return(mean(tail_list, na.rm = TRUE))
}

# Function to calculate Gini Coefficient
GiniCalc <- function(loss) {
  return(ineq(loss, type="Gini"))
}

# ---------------------------------------------------------
# MAIN SIMULATION LOOP (LOGNORMAL)
# ---------------------------------------------------------
print("Starting Lognormal Simulation...")
lossLN <- numeric(n_simulations)

for (i in 1:n_simulations){
  etaLN <- rpois(1, lambda=50) # Frequency (Poisson)
  if(etaLN > 0){
    XiLN <- rlnorm(etaLN, meanlog=mu, sdlog=sig) # Severity (Lognormal)
    lossLN[i] <- sum(XiLN)
  } else {
    lossLN[i] <- 0
  }
}

# ---------------------------------------------------------
# RESULTS CALCULATION
# ---------------------------------------------------------
print("Calculating Risk Measures...")

# Preallocate vectors
VaR_Results <- numeric(length(alpha_values_LN))
ES_Results <- numeric(length(alpha_values_LN))
Tail_Gini_Results <- numeric(length(alpha_values_LN))

for (i in seq_along(alpha_values_LN)) {
  alpha <- alpha_values_LN[i]
  
  # Standard Measures
  VaR_Results[i] <- ValueatRisk(lossLN, alpha)
  ES_Results[i] <- ES(lossLN, alpha)
  
  # Tail-Gini: Calculate inequality ONLY for losses >= VaR
  extreme_losses <- lossLN[lossLN >= VaR_Results[i]]
  Tail_Gini_Results[i] <- GiniCalc(extreme_losses)
}

# Display Results
results_df <- data.frame(
  Alpha = alpha_values_LN,
  VaR = VaR_Results,
  ES = ES_Results,
  Tail_Gini = Tail_Gini_Results
)

print(results_df)

# Plotting the results
plot(alpha_values_LN, VaR_Results, type = "l", col = "red", 
     ylim = c(0, max(ES_Results)), 
     xlab = "Confidence Level (%)", ylab = "Loss Amount",
     main = "Risk Measures: VaR vs ES")
lines(alpha_values_LN, ES_Results, col = "blue")
legend("topleft", legend=c("VaR", "Expected Shortfall"), col=c("red", "blue"), lty=1)
