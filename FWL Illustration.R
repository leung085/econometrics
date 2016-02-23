# Illustration of Frisch Waugh Lovell Theorem in R
# Author: Weiwen Leung
data(swiss)
head(swiss)

# Want to examine partial effect of education on fertility, controlling for Catholicism

# y: Fertility
# x1: Percentage of Catholics
# x2: Education

# Regression 1: y on x1, x2
reg1 <- lm(swiss$Fertility ~ swiss$Education + swiss$Catholic)
resid1 <- residuals(reg1)

# Regression 2: y on M1x2
reg2a <- lm(swiss$Education ~ swiss$Catholic)
M1x2 <- residuals(reg2a)
reg2 <- lm(swiss$Fertility ~ M1x2 - 1)
resid2 <- residuals(reg2)

# Coefficients
reg1
reg2

# Regression 3: M1y on M1x2
reg3a <- lm(swiss$Education ~ swiss$Catholic)
M1x2 <- residuals(reg3a)
reg3b <- lm(swiss$Fertility ~ swiss$Catholic)
M1y <- residuals(reg3b)
reg3c <- lm(M1y ~ M1x2 - 1)
resid3 <- residuals(reg3c)

# Coefficients
reg3c

# Comparison of Residuals
cbind(resid1[1:10], resid2[1:10], resid3[1:10])

