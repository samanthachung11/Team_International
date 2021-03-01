library(readr)
library(ggplot2)
library(wesanderson)
HCCUR2018_Age_Gender <- read_csv("HCCUR2018_Age_Gender.csv")
HCCUR2018_Age_Gender$Age[HCCUR2018_Age_Gender$Age == "8-Apr"] <- "4-8"
HCCUR2018_Age_Gender$Age[HCCUR2018_Age_Gender$Age == "13-Sep"] <- "9-13"
HCCUR2018_Age_Gender$Age <- factor(HCCUR2018_Age_Gender$Age,
                                   levels = c("0-3", "4-8", "9-13", "14-18",
                                              "19-25", "26-44", "45-54",
                                              "55-64", "All Ages"))

# Plot 1:
ggplot(HCCUR2018_Age_Gender[-which(HCCUR2018_Age_Gender$Gender == "All Genders" |
                                     HCCUR2018_Age_Gender$Age == "All Ages"),], 
       aes(x = Age, y = OOP_spending_per_member, fill = factor(Gender))) +
  geom_bar(stat = "summary", fun = "mean", position='dodge') +
  scale_y_continuous(label = scales::dollar) + 
  theme_minimal() + 
  scale_fill_manual(values = c("#E7B800", "#00AFBB")) + 
  geom_hline(data = HCCUR2018_Age_Gender, aes(yintercept = 24.13182),
             colour="#ad8a00", linetype = "dashed") + 
  geom_hline(data = HCCUR2018_Age_Gender, aes(yintercept = 20.29131),
             colour="#007780", linetype = "dashed") + 
  annotate(geom="text", label= "Average Female Spending: $24.1", x = 2, y = 24.1,
           vjust=-1, size = 3) + 
  annotate(geom="text", label= "Average Male Spending: $20.3", x = 3, y = 20.3,
           vjust=-1, size = 3) + 
  labs(title = "Out of Pocket Spending by Age and Gender", x = "Age",
       y = "Out of Pocket Spending", fill = "Gender",
       caption = "Data from the Health Care Cost Institute")

# Plot 2:
ggplot(HCCUR2018_Age_Gender[-which(HCCUR2018_Age_Gender$Gender == "All Genders" |
                                     HCCUR2018_Age_Gender$Age == "All Ages" |
                                     HCCUR2018_Age_Gender$HCCI_category == "Total"),], 
       aes(x = Gender, y = OOP_spending_per_member, fill = factor(HCCI_category))) +
  geom_bar(stat = "summary", fun = "mean") +
  scale_y_continuous(label = scales::dollar) + 
  theme_minimal() +
  scale_fill_manual(values = wes_palette("GrandBudapest1", n = 4))  +
  labs(title = "Out of Pocket Spending by Service Categories and Gender", x = "Gender",
       y = "Out of Pocket Spending",
       caption = "Data from the Health Care Cost Institute") +
  scale_fill_discrete(name = "Category",
                      labels = c("Inpatient", "Outpatient",
                                 "Professional Services", "Prescription Drugs"))
