set.seed(1234)
library(caret)
trainIndex = createDataPartition(dataset$status_group, p = .8, list = FALSE, times = 1)

train = dataset[trainIndex,]
test = dataset[-trainIndex,]

rm(trainIndex)
rm(dataset)
