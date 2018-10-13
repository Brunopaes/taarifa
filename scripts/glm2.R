myFormula = train$status_group ~ .

# Generalized Linear Model
library(glm2)
glm = glm(myFormula, family = binomial(), data = train)

predVal(glm, train)
predVal(glm, test)
