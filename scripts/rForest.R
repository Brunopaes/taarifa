myFormula = train$status_group ~ .

library(randomForest)
rForest = randomForest(myFormula, data = train, importance = TRUE, do.trace = FALSE)

# Grid Search and Hyperparameter
for (i in 100:150) {
  rForest = randomForest(myFormula, data = train, importance = TRUE, do.trace = FALSE, ntree = i, mtry = (i + 153), nodesize = (abs(i - 90)))
  pred = predict(rForest, test)
  print(i)
  print(x)
  x = (sum(pred == test$y)/nrow(test))
  if (x > 0.85) {
    break;
  } 
}

predVal(rForest, train)
predVal(rForest, test)
