## The summing of NA values
sum(is.na(dataset))                                     # [1] 7532

## The summing of 0 Values in dataset$costruction_year
sum(dataset$construction_year == 0)

## Removing those 0 values
testX$construction_year[testX$construction_year == 0] = NA
sum(is.na(testX$construction_year))
dataset = na.omit(dataset)

## Checking the type o Y attribute
sapply(dataset, class)                                  # [1] 'character'

## Char to Factor
for (i in 1:2) {
  dataset[, i] = as.factor(paste(dataset[, i]))
}

for (i in 5:ncol(dataset)) {
  dataset[, i] = as.factor(paste(dataset[, i]))
}

rm(i)

## checking the unique attributes length
unique(dataset[, 1])
unique(testX[, 1])

length(unique(dataset[, 2]))
length(unique(testX[, 2]))

length(unique(dataset[, 3]))
length(unique(testX[, 3]))

length(unique(dataset[, 4]))
length(unique(testX[, 4]))

length(unique(dataset[, 5]))
length(unique(testX[, 5]))

length(unique(dataset[, 6]))
length(unique(testX[, 6]))

length(unique(dataset[, 7]))
length(unique(testX[, 7]))

length(unique(dataset[, 8]))
length(unique(testX[, 8]))

length(unique(dataset[, 9]))
length(unique(testX[, 9]))

length(unique(dataset[, 10]))
length(unique(testX[, 10]))

length(unique(dataset[, 11]))
length(unique(testX[, 11]))

length(unique(dataset[, 12]))
length(unique(testX[, 12]))

length(unique(dataset[, 13]))
length(unique(testX[, 13]))

length(unique(dataset[, 14]))
length(unique(testX[, 14]))

length(unique(dataset[, 15]))
length(unique(testX[, 15]))

length(unique(dataset[, 16]))
length(unique(testX[, 16]))

length(unique(dataset[, 17]))
length(unique(testX[, 17]))

length(unique(dataset[, 18]))
length(unique(testX[, 18]))

length(unique(dataset[, 19]))
length(unique(testX[, 19]))

length(unique(dataset[, 20]))
length(unique(testX[, 20]))
