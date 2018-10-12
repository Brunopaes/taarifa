myFormula = train$y ~ .

library(RWeka)
j48 = J48(myFormula, data = train)

lmt = LMT(myFormula, data = train)

ds = DecisionStump(myFormula, data = train)

library(party)
ctree = ctree(myFormula, data = train)

library(randomForest)
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

library(class)
knn = knn(train[, -1], test[, -1], train$y, k = 1)

predVal(j48, train)
predVal(j48, test)

predVal(lmt, train)
predVal(lmt, test)

predVal(ds, train)
predVal(ds, test)

predVal(ctree, train)
predVal(ctree, test)

predVal(rForest, train)
predVal(rForest, test)

validation(knn, train)
validation(knn, test)
