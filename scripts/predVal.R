# ------------------------------------------------------ Testing and Validation Function
# randomForest
predVal = function(model, test) {
  predict = predict(model, test)
  real = test$status_group
  
  print(sum(predict == real)/nrow(test))
  confusionMatrix(table(predict, real))
}

# randomForest - Grid Search
predVal = function(model, test) {
  predict = model
  real = test$status_group
  
  print(sum(predict == real)/nrow(test))
  confusionMatrix(table(predict, real))
}

