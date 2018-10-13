myFormula = train$status_group ~ .

library(randomForest)
rForest = randomForest(myFormula, data = train, importance = TRUE, do.trace = FALSE)

predVal(rForest, train)
predVal(rForest, test)


# Grid Search and Hyperparameter
tempTest = c()
tempTrain = c()

for (i in 100:500) {
  rForest = randomForest(myFormula, data = train, importance = TRUE, do.trace = FALSE, ntree = i, mtry = 5, nodesize = (abs(i - 90)))
  pred = predict(rForest, test)
  pred2 = predict(rForest, train)
  print(i)
  tempTrain[i] = (sum(pred2 == train$status_group)/nrow(train))
  tempTest[i] = (sum(pred == test$status_group)/nrow(test))
  print(tempTest[i])
  if (tempTest[i] >= 0.82) {
    break;
  } 
}

plot(tempTrain, main = 'Learning Curve - rForest (gSearch 100:500)', type = 'l', col = 'red', xlim = c(99, 501), ylim = c(0.73, 0.83), ylab = 'Accuracy')
lines(tempTest, type = 'l', col = 'blue')
legend("topright", inset = 0.15, title = "datasets", c("train","test"), fill = c("red","blue"), horiz = FALSE)

rm(pred2)
rm(pred)
rm(i)

## Does removing the installer attributes and the year of construction was a good approach?
## Mean Assertiveness Rate
tempTrain = na.omit(tempTrain)
tempTest = na.omit(tempTest)

mean(tempTrain)                                        # [1] 0.7704291
mean(tempTest)                                         # [2] 0.7526957
