# libraries
library(ggcorrplot)
library(InformationValue)
library(ROSE)
library(randomForest)
library(caret)

# dataset being loaded
data <- read.csv("winequality-red.csv")

# Formatting
data$quality <- ifelse(data$quality >= 7, 1, 0)
data$quality <- factor(data$quality, levels = c(0, 1))

# Par plots for barplot and boxplot
par(mfrow = c(1, 1))
barplot(table(data$quality),
        main = "Frequency plot of the variable: quality",
        xlab = "quality",
        ylab = "Frequency")

# Par plots for histograms and correlation matrix
par(mfrow = c(3, 4))
for (i in 1:(length(data) - 1)) {
  hist(x = data[[i]],
       main = paste("Histogram of the variable:", colnames(data[i])),
       xlab = colnames(data[i]))
}

ggcorrplot(round(cor(data[-12]), 2),
           type = "lower",
           lab = TRUE,
           title = "Correlation matrix of the red wine quality dataset")

# Missing value count
sum(is.na(data))

# Function to detect outliers
is_outlier <- function(x) {
  return(x < quantile(x, 0.25) - 1.5 * IQR(x) | x > quantile(x, 0.75) + 1.5 * IQR(x))
}

# Loop to identify and handle outliers
for (j in 1:(length(data) - 1)) {
  variable <- colnames(data[j])
  sum_outliers <- sum(is_outlier(data[[j]]))
  row <- data.frame(variable, sum_outliers)
  outlier <- rbind(outlier, row)
}

# Logistic Regression
lr <- glm(formula = quality ~ .,
          data = training_set,
          family = binomial)
prob_pred <- predict(lr, newdata = test_set, type = "response")
optCutOff <- optimalCutoff(test_set$quality, prob_pred)[1]
y_pred <- ifelse(prob_pred > optCutOff, 1, 0)
cm_lr <- table(test_set$quality, y_pred)
accuracy_lr <- sum(diag(cm_lr)) / sum(cm_lr)
accuracy_lr

# Random Forest
rf <- randomForest(x = training_set[-12],
                   y = training_set$quality,
                   ntree = 10,
                   type = "class")
y_pred_rf <- predict(rf, newdata = test_set[-12])
cm_rf <- table(test_set$quality, y_pred_rf)
accuracy_rf <- sum(diag(cm_rf)) / sum(cm_rf)
accuracy_rf

# Variable importance for Logistic Regression
varImp(lr)

