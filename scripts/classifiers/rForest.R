myFormula = train$status_group ~ .

library(randomForest)
rForest = randomForest(myFormula, data = train, importance = TRUE, do.trace = FALSE)

predVal(rForest, train)
predVal(rForest, test)


# Grid Search and Hyperparameter
tempTest = c()
tempTrain = c()

for (i in 1:700) {
  rForest = randomForest(myFormula, data = train, importance = TRUE, do.trace = FALSE, ntree = i, mtry = 5, nodesize = (abs(i - 90)))
  pred = predict(rForest, train)
  pred1 = predict(rForest, test)
  print(i)
  tempTrain[i] = (sum(pred == train$status_group)/nrow(train))
  tempTest[i] = (sum(pred1 == test$status_group)/nrow(test))
  print(tempTest[i])
  if (tempTest[i] >= 0.82) {
    break;
  } 
}

plot(tempTrain[1:250], main = 'Learning Curve - rForest (gSearch 1:250)', type = 'l', col = 'red', xlim = c(0, 240.5), ylim = c(0.74, 0.86), ylab = 'Accuracy')
lines(tempTest[1:250], type = 'l', col = 'blue')
legend("topright", inset = 0.15, title = "datasets", c("train","test"), fill = c("red","blue"), horiz = FALSE)

plot(tempTrain - tempTest, type = 'l', col = 'cyan', main = 'Train Test accuracy (gSearch 1:500)', xlim = c(0, 500))

rm(pred2)
rm(pred)
rm(i)

## Does removing the installer attributes and the year of construction was a good approach?
mean(tempTrain)                                        # [1] 0.7779577
mean(tempTest)                                         # [2] 0.7560155

max(tempTrain)                                         # [1] 0.859281
max(tempTest)                                          # [2] 0.7822662

predVal(pred2, train)
#                           real
# predict                   functional |  functional_needs_repair |  non_functional
# functional                     14828 |                     1460 |            4019
# functional needs repair           31 |                       36 |               4
# non functional                  1070 |                      350 |            6130   

predVal(pred, test)
#                           real
# predict                   functional  | functional_needs_repair |  non_functional
# functional                      3684  |                     360 |            1042
# functional needs repair            7  |                       6 |               2
# non functional                   291  |                      95 |            1494

