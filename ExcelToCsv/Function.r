#install.packages("readxl")
library(readxl)
#install.packages("stringr")
library(stringr)
#install.packages("svDialogs")
library(svDialogs)

usersDirectory <- getwd()
# Read excel
readExcel <- function(tmpExcel){ 
  tryCatch(
    {
      excelFile <- read_xlsx(tmpExcel) #Reads sheet 1 only.
    }, error = function(err){
      print (paste( tmpExcel, "cannot be read/opened/found. Probably not an xlsx file. error =", 
                    "Try to read as xls instead"))
      message(err)
      return(NA)
    }, warning = function(err) {
      message(err)
      return(NULL)
    }
  )
  return(read_xlsx(tmpExcel)) 
}


# Choose excel file
selectFile <- function() {
  setwd("D:/")
  file <- choose.files(default = "", caption = "Select files",
               multi = FALSE, filters = Filters,
               index = nrow(Filters))
  return(file)
}


# Replace xlsx to csv
replaceSuffix <- function(pathToString){
  newPath <- basename(pathToString) %>% str_replace(., ".xlsx", ".csv")
  if(endsWith(newPath, 'x')){
    print("************NOT A XLSX FILE******************")
  }
  else {
    return(newPath)
  }
  
  stop()
}

firstRowColumn <- function(){
  dlgInput("Is first row columnnames?", Sys.info()["Y/N"])$res
}

writeToCSV <- function(yesOrNo){
  if(userInput == 'Y' || userInput == 'y' || userInput == 'Yes' || userInput == 'yes'){
    write.csv2(excelFile, excelName, row.names = FALSE, na = '')# , fileEncoding = 'UTF-8')
  } else if (userInput == 'N' || userInput == 'n' || userInput == 'No' || userInput == 'no'){
    write.csv2(excelFile, excelName, row.names = FALSE, column.names = FALSE, na = '')#  ,fileEncoding = 'UTF-8')
  } else{
    write.csv2(excelFile, excelName, row.names = TRUE, na = '')#, fileEncoding = 'UTF-8')
  }
}
