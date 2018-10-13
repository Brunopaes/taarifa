myFormula = train$status_group ~ .

library(e1071)
nBayes = naiveBayes(myFormula, train)

predVal(nBayes, train)
predVal(nBayes, test)
