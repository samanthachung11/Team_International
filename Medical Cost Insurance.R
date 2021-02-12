##How does an individual's BMI predict their medical cost from their insurance providers? 

insurance_df <- read.csv("insurance.csv", stringsAsFactors = FALSE)

underweight_charges <- insurance_df$charges[insurance_df$bmi < 18.5]

mean_underweight_charge <- mean(underweight_charges)

healthyweight_charges <- insurance_df$charges[insurance_df$bmi >= 18.5 & insurance_df$bmi <= 25 ]

mean_healthy_charge <- mean(healthyweight_charges)

overweight_charges <- insurance_df$charges[insurance_df$bmi > 25]

mean_overweight_charge <- mean(overweight_charges)

combined_mean_charge <- data.frame(cbind(c("Underweight", "Healthy", "Overweight"), c(mean_underweight_charge, mean_healthy_charge, mean_overweight_charge)))
colnames(combined_mean_charge) <- c("BMI Category", "Mean Medical Cost")
## LIBRARY GGPLOT2

library(ggplot2)
barplot_charges <-ggplot(data=combined_mean_charge, aes(x= `BMI Category`, y= `Mean Medical Cost`, fill = `BMI Category`)) +
  geom_bar(stat="identity") 

#### Creating a scatterplot:

n_underweight <- length(underweight_charges)
n_healthy <- length(healthyweight_charges)
n_overweight <- length(overweight_charges)

col_n <- rep(c("red","orange","blue"),c(n_underweight,n_healthy,n_overweight))

#sort data by underweight bmi, healthy bmi and overweight bmi in order

underweight_bmi <- insurance_df$bmi[insurance_df$bmi < 18.5]
healthy_bmi <- insurance_df$bmi[insurance_df$bmi >= 18.5 & insurance_df$bmi <= 25]
overweight_bmi <- insurance_df$bmi[insurance_df$ bmi > 25]

BMI <- c(underweight_bmi, healthy_bmi, overweight_bmi)


##Looking at charges in order
CHARGES <- c(underweight_charges, healthyweight_charges, overweight_charges)

plot(CHARGES ~ BMI, pch = 2, cex = 0.5, col = col_n, main = "Plot of medical cost charges against BMI", xlab = "BMI", ylab= "Medical Cost")

legend("topleft", c("Underweight", "Healthy", "Overweight"), fill = c("red", "orange", "blue"), cex = 0.75)

correlation <- (cor.test(insurance_df$bmi, insurance_df$charges))[["estimate"]]


