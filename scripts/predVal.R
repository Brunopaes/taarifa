# ------------------------------------------------------ Testing and Validation Function
# randomForest and RWeka classifiers
predVal = function(model, test) {
  predict = predict(model, test)
  
  real = test$y
  
  print(sum(predict == test$y)/nrow(test))
  confusionMatrix(table(predict, real))
}

# knn classifier
validation = function(model, test) {
  predict = model
  real = test$y
  
  print(sum(predict == test$y)/nrow(test))
  confusionMatrix(table(predict, real))
}
