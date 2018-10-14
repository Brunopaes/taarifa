## The summing of NA values
sum(is.na(dataset))                                     # [1] 7532

## The summing of 0 Values in dataset$costruction_year
sum(dataset$construction_year == 0)

## Removing those 0 values
dataset$construction_year[dataset$construction_year == 0] = NA
sum(is.na(dataset$construction_year))
dataset = na.omit(dataset)

## Checking the type o Y attribute
sapply(dataset, class)                                  # [1] 'character'

## Char to Factor
for (i in 1:3) {
  dataset[, i] = as.factor(paste(dataset[, i]))
}

for (i in 5:ncol(dataset)) {
  dataset[, i] = as.factor(paste(dataset[, i]))
}

rm(i)

## checking the unique attributes length
length(unique(dataset[, 1]))
length(unique(dataset[, 2]))
length(unique(dataset[, 3]))
length(unique(dataset[, 4]))
length(unique(dataset[, 5]))
length(unique(dataset[, 6]))
length(unique(dataset[, 7]))
length(unique(dataset[, 8]))
length(unique(dataset[, 9]))
length(unique(dataset[, 10]))
length(unique(dataset[, 11]))
length(unique(dataset[, 12]))
