
#Import data
data <- read_excel("/Users/preeti/Downloads/cohort.xlsx")
View(data)

#descriptive table of variables
install.packages("Hmisc")

describe(data)
summary(data)

#linear regression model: 
#effect of cardiac events (predictor) on cost of care (outcome)
#control for smoking status, age and gender
model <- lm(cost~cardiac+smoke+age+female, data=data)
summary(model)

#create regression figure
install.packages("coefplot")
install.packages("ggplot2")

# Scatter plot with regression line
ggplot(data, aes(x = age, y = cost)) +
  geom_point(aes(color = cardiac), alpha = 0.6) +  # Plot points with color indicating cardiac events
  geom_smooth(method = "lm", se = FALSE, color = "blue") +  # Add regression line
  labs(title = "Scatter Plot of Cost vs. Age with Regression Line",
       x = "Age",
       y = "Cost") +
  theme_minimal()
