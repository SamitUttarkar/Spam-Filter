#spam filter-----
load("~/Desktop/Data_Sets/email.Rdata") # make sure you are in the correct directory
attach(email)
dim(email)
head(email)

#fit glm
model1 = glm(spam ~  to_multiple, data = email, family = binomial)
summary(model1)
exp(coef(model1))

#fit complex model
model2 = glm(spam ~ ., data = email, family = binomial)
summary(model2)

#plot glm
set.seed(1)
jitter = rnorm(nrow(email), sd = 0.01)
plot(model2$fitted.values, spam + jitter, xlim = 0:1, ylim = c(-0.5, 1.5), axes = FALSE, xlab = "Predicted probability", ylab = "", col = adjustcolor("blue", 0.2), pch = 16)
axis(1)
axis(2, at = c(0, 1), labels = c("0 (not spam)", "1 (spam)"))
plot(factor(spam, labels = c("not spam", "spam")), model2$fitted.values)


