dataset$date_recorded = NULL
dataset$gps_height = NULL
dataset$longitude = NULL
dataset$latitude = NULL
dataset$num_private = NULL
dataset$subvillage = NULL
dataset$district_code = NULL
dataset$lga = NULL
dataset$ward = NULL
dataset$payment = NULL
dataset$payment_type = NULL
dataset$quality_group = NULL
dataset$quantity_group = NULL
dataset$waterpoint_type_group = NULL
dataset$recorded_by = NULL
dataset$region_code = NULL

dataset = na.omit(dataset)

dataset$construction_year[0,] = NULL
