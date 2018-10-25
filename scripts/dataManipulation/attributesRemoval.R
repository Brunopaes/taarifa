# Physical conditions attributes:
## counting the zeros in trainX$amount_tsh
sum(trainX$amount_tsh == 0)                            # [1] 41639
sum(trainX$amount_tsh == 0)/nrow(trainX)              # [2] 0.7009933

sum(is.na(trainX$amount_tsh))                          # [1] 0

## Conclusion: This attribute is inconsistent! And should be removed
trainX$amount_tsh = NULL

## Comparing the quantity and quantity_group attributes:
length(unique(trainX$quantity))                        # [1] 5
length(unique(trainX$quantity_group))                  # [2] 5

sum(is.na(trainX$quantity))                            # [1] 0
sum(is.na(trainX$quantity_group))                      # [2] 0

## Conclusion: Simplify the model
trainX$quantity_group = NULL

## Comparing the water_quality and quality_group attributes:
length(unique(trainX$water_quality))                   # [1] 8
length(unique(trainX$quality_group))                   # [2] 6

sum(is.na(trainX$water_quality))                       # [1] 0
sum(is.na(trainX$quality_group))                       # [2] 0

## Conclusion: Simplify the model
trainX$water_quality = NULL

# Geographic Attributes
## Does the gps height really influences the model?
## The summing of 0 in gps_height attribute
sum(trainX$gps_height == 0)                            # [1] 20438
sum(trainX$gps_height == 0)/nrow(trainX)              # [2] 0.3440741

sum(is.na(trainX$gps_height))                          # [1] 0

## Conclusion: Even though it has significance for the model, the attribute has many inconsistencies. 
## Would be 34% of the trainX be at sea level?
trainX$gps_height = NULL

## Does the lat/long really influences the model?
## The summing of different registers in these attributes
lat = as.factor(paste(trainX$latitude))
long = as.factor(paste(trainX$longitude))
length(unique(lat))                                     # [1] 57517
length(unique(long))                                    # [2] 57516
rm(lat)
rm(long)

## Conclusion: These attributes, although 'interesting', due to their low generalization, 
## make the model very complex.
trainX$longitude = NULL
trainX$latitude = NULL

## Comparing basin, district_code, region, region_code, lga, ward and subvillage attributes:
length(unique(trainX$basin))                           # [1] 9
length(unique(trainX$district_code))                   # [2] 20
length(unique(trainX$region))                          # [3] 21
length(unique(trainX$region_code))                     # [4] 27
length(unique(trainX$lga))                             # [5] 125
length(unique(trainX$ward))                            # [6] 2092
length(unique(trainX$subvillage))                      # [7] 19288

sum(is.na(trainX$basin))                               # [1] 0
sum(is.na(trainX$district_code))                       # [2] 0
sum(is.na(trainX$region))                              # [3] 0
sum(is.na(trainX$region_code))                         # [4] 0
sum(is.na(trainX$lga))                                 # [5] 0
sum(is.na(trainX$ward))                                # [6] 0
sum(is.na(trainX$subvillage))                          # [7] 371

## Conclusion: although the meaning of all seven attributes is (basically) the same, the basin 
## attribute is, compared to the other six attributes, 'slightly' less complex (9 unique records).
## Therefore, the basin attribute, can better generalize the trainX.
trainX$district_code = NULL
trainX$region = NULL
trainX$region_code = NULL
trainX$lga = NULL
trainX$ward = NULL
trainX$subvillage = NULL

# Misc Attributes
## Does the recorded date impact the model?
trainX$date_recorded = NULL
## Does the recorded by impact the model?
trainX$recorded_by = NULL
## Removing the waterpoint name - does the name of the waterpoint influences in the status of the same?
trainX$wpt_name = NULL

## Comparing the scheme_management and scheme_name attributes:
length(unique(trainX$scheme_management))               # [1] 13
length(unique(trainX$scheme_name))                     # [2] 2697

sum(is.na(trainX$scheme_management))                   # [1] 3877
sum(is.na(trainX$scheme_name))                         # [2] 28166

## Conclusion: The scheme_name attribute, when compared to the scheme_management, 
## besides having many more missing values (NA Values), is somewhat more complex.
## Because of this, it is not very influential in the model and should be removed.
trainX$scheme_name = NULL

## Comparing the payment and payment_type attributes:
length(unique(trainX$payment))                         # [1] 7
length(unique(trainX$payment_type))                    # [2] 7

sum(is.na(trainX$payment))                             # [1] 0
sum(is.na(trainX$payment_type))                        # [2] 0

## Conclusion: Simplify the model.
trainX$payment = NULL

## Comparing the waterpoint_type and waterpoint_type_group attributes:
length(unique(trainX$waterpoint_type))                 # [1] 7
length(unique(trainX$waterpoint_type_group))           # [2] 6

sum(is.na(trainX$waterpoint_type))                     # [1] 0
sum(is.na(trainX$waterpoint_type_group))               # [2] 0

## Conclusion: Simplify the model.
trainX$waterpoint_type = NULL

## Comparing the management and management_group attributes:
length(unique(trainX$management))                      # [1] 12
length(unique(trainX$management_group))                # [2] 5

sum(is.na(trainX$management))                          # [1] 0
sum(is.na(trainX$management_group))                    # [2] 0

## Conclusion: Simplify the model.
trainX$management = NULL

## Comparing the extraction_type, extraction_type_group and extraction_type_class:
length(unique(trainX$extraction_type))                 # [1] 18
length(unique(trainX$extraction_type_group))           # [2] 13
length(unique(trainX$extraction_type_class))           # [3] 7

sum(is.na(trainX$extraction_type))                     # [1] 0
sum(is.na(trainX$extraction_type_group))               # [2] 0
sum(is.na(trainX$extraction_type_class))               # [3] 0

## Conclusion: Simplify the model.
trainX$extraction_type = NULL
trainX$extraction_type_group = NULL

## Comparing the source, source_type and source_class:
length(unique(trainX$source))                          # [1] 10
length(unique(trainX$source_type))                     # [2] 7
length(unique(trainX$source_class))                    # [3] 3

sum(is.na(trainX$source))                              # [1] 0
sum(is.na(trainX$source_type))                         # [2] 0
sum(is.na(trainX$source_class))                        # [3] 0

## Conclusion: Simplify the model
trainX$source = NULL
trainX$source_type = NULL

## Public Meeting?
length(unique(trainX$public_meeting))                  # [1] 3
unique(trainX$public_meeting)                          # [2] 'True' NA 'False'
sum(is.na(trainX$public_meeting))                      # [3] 3334

## Conclusion: This attribute is somewhat hazy and, as a result, it must be removed from the model.
trainX$public_meeting = NULL

## Permit?
length(unique(trainX$permit))                          # [1] 3
unique(trainX$permit)                                  # [2] 'True' NA 'False'
sum(is.na(trainX$permit))                              # [3] 3056

## Conclusion: This attribute is somewhat hazy and, as a result, it must be removed from the model.
trainX$permit = NULL

## Num Private?
length(unique(trainX$num_private))                     # [1] 65
# unique(trainX$num_private)                           
sum(is.na(trainX$num_private))                         # [3] 0

## Conclusion: This attribute is somewhat hazy and, as a result, it must be removed from the model.
trainX$num_private = NULL

## Funder
length(unique(trainX$funder))                          # [1] 1898
sum(is.na(trainX$funder))                              # [3] 3635

## Conclusion: This attribute, because it has a very high range of values, does not generalize the trainX.
trainX$funder = NULL

## Population
sum(is.na(trainX$population))                          # [1] 0
sum(trainX$population == 0)                            # [2] 21381

## Conclusion: This attribute, among others, is quite important. 
## However, this attribute is somewhat inconsistent, since, in 21381 records, the surrounding population is 0. 
## Does it make any sense in building a water pump away from villages?
trainX$population = NULL

## Construction Year
sum(is.na(trainX$construction_year))                   # [1] 0
sum(trainX$construction_year == 0)                     # [2] 20709

## Conclusion: This attribute, among others, is one of the most important. So it should not be removed. 
## However, there are inconsistent values (20709 records equal to 0). 
## These records, or should be treated or removed from the trainX.

## Random Forests cannot handle with more than 53 categorical classes!
## 1st Approach: Remove the installer and the construction_year.
## 2nd Approach: If this decision directly impacts on the accuracy of the model, 
## dummy variables will be constructed.
length(unique(trainX$installer))                       # [1] 2146
length(unique(trainX$construction_year))               # [2] 1898

## Conclusion: Removing the attributes (installer and construction_year) intead of 
## creating some dummy variables (1st Approach).
trainX$installer = NULL
trainX$construction_year = NULL
