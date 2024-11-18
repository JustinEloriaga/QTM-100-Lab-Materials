##################################
# LAB 11
##################################

# Loading the Dataset
summary(mariokart)
str(mariokart)

# Taking out the outlying price
mkClean <- subset(mariokart, mariokart$total_pr < 100)
hist(mkClean$total_pr)

# CORRELATION

plot(mkClean$n_bids, mkClean$total_pr)
cor(mkClean$n_bids, mkClean$total_pr)
cor.test(mkClean$n_bids, mkClean$total_pr)
# Not statistically significant

# REGRESSION
m1 <- lm(mkClean$total_pr ~ mkClean$n_bids)
summary(m1)

# Add the regression line
abline(m1)
# Print the coefficients
confint(m1)

# Display the regular residuals
m1$residuals
resid(m1)

# Display the standardized residuals
rstandard(m1)

# Display the fitted/predicted values of y
predict(m1)

# Inspect the distribution of the standardized residuals
hist(rstandard(m1))
qqnorm(rstandard(m1))
qqline(rstandard(m1))
summary(rstandard(m1))
sd(rstandard(m1))

# Show the SRF and PRF relationship with the first row
mkClean[1,]
predict(m1)[1]
resid(m1)[1]
46.60819 + 4.941811

# Inspect Model Assumptions
plot(predict(m1),rstandard(m1),xlab = "Fitted Values", ylab = "Standardized Residuals")
abline(h= 0, lty = 2)