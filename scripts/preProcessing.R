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
dataset$installer = as.factor(paste(dataset$installer))
dataset$basin = as.factor(paste(dataset$basin))
dataset$scheme_management = as.factor(paste(dataset$scheme_management))
dataset$extraction_type_class = as.factor(paste(dataset$extraction_type_class))
dataset$management_group = as.factor(paste(dataset$management_group))
dataset$payment_type = as.factor(paste(dataset$payment_type))
dataset$quality_group = as.factor(paste(dataset$quality_group))
dataset$quantity = as.factor(paste(dataset$quantity))
dataset$source_class = as.factor(paste(dataset$source_class))
dataset$waterpoint_type_group = as.factor(paste(dataset$waterpoint_type_group))
dataset$status_group = as.factor(paste(dataset$status_group))

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


# dataset[, 1] = NULL
# dataset[, 4] = NULL
