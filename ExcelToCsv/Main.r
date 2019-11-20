source("Function.r")
projectDirectory <- getwd()
# options(encoding = "UTF-8")
# Pop up box might hide in background

# Choose excel file
tmpExcel <- selectFile()

# Change name of excel end to csv XLSX
excelName <- replaceSuffix(tmpExcel)

##excelName <- basename(tmpExcel) %>% str_replace(., ".xls", ".csv");
excelFile <- readExcel(tmpExcel)

# endDest <- paste("D:/DESA/InternationaleSkoler", "/csv files", sep = "")
# setwd(endDest)

# choose if first row should be column names
userInput <- firstRowColumn()

# Set working directory
setwd(choose.dir(default = "D:/", caption = "Select folder"))
# Write to a csv file
writeToCSV(userInput)

setwd(projectDirectory)
rm(list = ls())