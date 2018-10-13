# Physical conditions attributes:
## counting the zeros in dataset$amount_tsh
sum(dataset$amount_tsh == 0)                            # [1] 41639
sum(dataset$amount_tsh == 0)/nrow(dataset)              # [2] 0.7009933

sum(is.na(dataset$amount_tsh))                          # [1] 0

## Conclusion: This attribute is inconsistent! And should be removed
dataset$amount_tsh = NULL

## Comparing the quantity and quantity_group attributes:
length(unique(dataset$quantity))                        # [1] 5
length(unique(dataset$quantity_group))                  # [2] 5

sum(is.na(dataset$quantity))                            # [1] 0
sum(is.na(dataset$quantity_group))                      # [2] 0

## Conclusion: Simplify the model
dataset$quantity_group = NULL

## Comparing the water_quality and quality_group attributes:
length(unique(dataset$water_quality))                   # [1] 8
length(unique(dataset$quality_group))                   # [2] 6

sum(is.na(dataset$water_quality))                       # [1] 0
sum(is.na(dataset$quality_group))                       # [2] 0

## Conclusion: Simplify the model
dataset$water_quality = NULL

# Geographic Attributes
## Does the gps height really influences the model?
## The summing of 0 in gps_height attribute
sum(dataset$gps_height == 0)                            # [1] 20438
sum(dataset$gps_height == 0)/nrow(dataset)              # [2] 0.3440741

sum(is.na(dataset$gps_height))                          # [1] 0

## Conclusion: Even though it has significance for the model, the attribute has many inconsistencies. 
## Would be 34% of the dataset be at sea level?
dataset$gps_height = NULL

## Does the lat/long really influences the model?
## The summing of different registers in these attributes
lat = as.factor(paste(dataset$latitude))
long = as.factor(paste(dataset$longitude))
length(unique(lat))                                     # [1] 57517
length(unique(long))                                    # [2] 57516
rm(lat)
rm(long)

## Conclusion: These attributes, although 'interesting', due to their low generalization, 
## make the model very complex.
dataset$longitude = NULL
dataset$latitude = NULL

## Comparing basin, district_code, region, region_code, lga, ward and subvillage attributes:
length(unique(dataset$basin))                           # [1] 9
length(unique(dataset$district_code))                   # [2] 20
length(unique(dataset$region))                          # [3] 21
length(unique(dataset$region_code))                     # [4] 27
length(unique(dataset$lga))                             # [5] 125
length(unique(dataset$ward))                            # [6] 2092
length(unique(dataset$subvillage))                      # [7] 19288

sum(is.na(dataset$basin))                               # [1] 0
sum(is.na(dataset$district_code))                       # [2] 0
sum(is.na(dataset$region))                              # [3] 0
sum(is.na(dataset$region_code))                         # [4] 0
sum(is.na(dataset$lga))                                 # [5] 0
sum(is.na(dataset$ward))                                # [6] 0
sum(is.na(dataset$subvillage))                          # [7] 371

## Conclusion: although the meaning of all seven attributes is (basically) the same, the basin 
## attribute is, compared to the other six attributes, 'slightly' less complex (9 unique records).
## Therefore, the basin attribute, can better generalize the dataset.
dataset$district_code = NULL
dataset$region = NULL
dataset$region_code = NULL
dataset$lga = NULL
dataset$ward = NULL
dataset$subvillage = NULL

# Misc Attributes
## Does the recorded date impact the model?
dataset$date_recorded = NULL
## Does the recorded by impact the model?
dataset$recorded_by = NULL
## Removing the waterpoint name - does the name of the waterpoint influences in the status of the same?
dataset$wpt_name = NULL

## Comparing the scheme_management and scheme_name attributes:
length(unique(dataset$scheme_management))               # [1] 13
length(unique(dataset$scheme_name))                     # [2] 2697

sum(is.na(dataset$scheme_management))                   # [1] 3877
sum(is.na(dataset$scheme_name))                         # [2] 28166

## Conclusion: The scheme_name attribute, when compared to the scheme_management, 
## besides having many more missing values (NA Values), is somewhat more complex.
## Because of this, it is not very influential in the model and should be removed.
dataset$scheme_name = NULL

## Comparing the payment and payment_type attributes:
length(unique(dataset$payment))                         # [1] 7
length(unique(dataset$payment_type))                    # [2] 7

sum(is.na(dataset$payment))                             # [1] 0
sum(is.na(dataset$payment_type))                        # [2] 0

## Conclusion: Simplify the model.
dataset$payment = NULL

## Comparing the waterpoint_type and waterpoint_type_group attributes:
length(unique(dataset$waterpoint_type))                 # [1] 7
length(unique(dataset$waterpoint_type_group))           # [2] 6

sum(is.na(dataset$waterpoint_type))                     # [1] 0
sum(is.na(dataset$waterpoint_type_group))               # [2] 0

## Conclusion: Simplify the model.
dataset$waterpoint_type = NULL

## Comparing the management and management_group attributes:
length(unique(dataset$management))                      # [1] 12
length(unique(dataset$management_group))                # [2] 5

sum(is.na(dataset$management))                          # [1] 0
sum(is.na(dataset$management_group))                    # [2] 0

## Conclusion: Simplify the model.
dataset$management = NULL

## Comparing the extraction_type, extraction_type_group and extraction_type_class:
length(unique(dataset$extraction_type))                 # [1] 18
length(unique(dataset$extraction_type_group))           # [2] 13
length(unique(dataset$extraction_type_class))           # [3] 7

sum(is.na(dataset$extraction_type))                     # [1] 0
sum(is.na(dataset$extraction_type_group))               # [2] 0
sum(is.na(dataset$extraction_type_class))               # [3] 0

## Conclusion: Simplify the model.
dataset$extraction_type = NULL
dataset$extraction_type_group = NULL

## Comparing the source, source_type and source_class:
length(unique(dataset$source))                          # [1] 10
length(unique(dataset$source_type))                     # [2] 7
length(unique(dataset$source_class))                    # [3] 3

sum(is.na(dataset$source))                              # [1] 0
sum(is.na(dataset$source_type))                         # [2] 0
sum(is.na(dataset$source_class))                        # [3] 0

## Conclusion: Simplify the model
dataset$source = NULL
dataset$source_type = NULL

## Public Meeting?
length(unique(dataset$public_meeting))                  # [1] 3
unique(dataset$public_meeting)                          # [2] 'True' NA 'False'
sum(is.na(dataset$public_meeting))                      # [3] 3334

## Conclusion: This attribute is somewhat hazy and, as a result, it must be removed from the model.
dataset$public_meeting = NULL

## Permit?
length(unique(dataset$permit))                          # [1] 3
unique(dataset$permit)                                  # [2] 'True' NA 'False'
sum(is.na(dataset$permit))                              # [3] 3056

## Conclusion: This attribute is somewhat hazy and, as a result, it must be removed from the model.
dataset$permit = NULL

## Num Private?
length(unique(dataset$num_private))                     # [1] 65
# unique(dataset$num_private)                           
sum(is.na(dataset$num_private))                         # [3] 0

## Conclusion: This attribute is somewhat hazy and, as a result, it must be removed from the model.
dataset$num_private = NULL

## Funder
length(unique(dataset$funder))                          # [1] 1898
sum(is.na(dataset$funder))                              # [3] 3635

## Conclusion: This attribute, because it has a very high range of values, does not generalize the dataset.
dataset$funder = NULL

## Population
sum(is.na(dataset$population))                          # [1] 0
sum(dataset$population == 0)                            # [2] 21381

## Conclusion: This attribute, among others, is quite important. 
## However, this attribute is somewhat inconsistent, since, in 21381 records, the surrounding population is 0. 
## Does it make any sense in building a water pump away from villages?
dataset$population = NULL

## Construction Year
sum(is.na(dataset$construction_year))                   # [1] 0
sum(dataset$construction_year == 0)                     # [2] 20709

## Conclusion: This attribute, among others, is one of the most important. So it should not be removed. 
## However, there are inconsistent values (20709 records equal to 0). 
## These records, or should be treated or removed from the dataset.

## Random Forests cannot handle with more than 53 categorical classes!
## 1st Approach: Remove the installer and the construction_year.
## 2nd Approach: If this decision directly impacts on the accuracy of the model, 
## dummy variables will be constructed.
length(unique(dataset$installer))                       # [1] 2146
length(unique(dataset$construction_year))               # [2] 1898

## Conclusion: Removing the attributes (installer and construction_year) intead of 
## creating some dummy variables (1st Approach).
dataset$installer = NULL
dataset$construction_year = NULL