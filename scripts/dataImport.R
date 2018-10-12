library(readr)
trainX = read_csv("~/Documents/OneDrive/Acadêmico/ESPM/Semestre V/Tel 03.3009 - Machine Learning e Analytics/Trabalhos/taarifaProblem/data/trainX.csv")
trainX$id = NULL

trainY = read_csv("~/Documents/OneDrive/Acadêmico/ESPM/Semestre V/Tel 03.3009 - Machine Learning e Analytics/Trabalhos/taarifaProblem/data/trainY.csv")
trainY$id = NULL

dataset = cbind(trainX, trainY)

rm(trainX)
rm(trainY)
