# ------------------------------------------------------ Testing and Validation Function
# randomForest and RWeka classifiers
predVal = function(model, test) {
  predict = predict(model, test)
  real = test$status_group
  
  print(sum(predict == real)/nrow(test))
  confusionMatrix(table(predict, real))
}
