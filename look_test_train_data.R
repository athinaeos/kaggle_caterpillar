# Load the dataset

path <- "../input/"
train = read.csv(paste0(path,"train_set.csv"),header=TRUE,stringsAsFactors = T)
test = read.csv(paste0(path,"test_set.csv"),header=TRUE,stringsAsFactors = T)

###train = read.csv("train_set.csv")
###test = read.csv("test_set.csv")

## look at the basic data files
# str(train)
# str(test)

## add variable to test & train to allow combine into one data set  
train$id <- (nrow(test)+ row(train)) ## add id number to train data 
## start at number rows in test +1
test$cost <- (-1) ## test data has unknown price show as -1

## combine train and test to get summary of all parts and suppliers
allParts <- rbind(train, test)


## Summary of data files
str(allParts)
table(allParts$supplier, allParts$bracket_pricing)
table(allParts$supplier, allParts$cost == -1)

