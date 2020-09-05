diamond <- function(max) {
  
  # Upper triangle
  space <- max - 1
  for (i in 0:(max - 1)) {
    for (j in 0:space) cat(" ")
    for (j in 0:i) cat("* ")
    cat("\n")
    space <- space - 1
  }
  
  # Lower triangle
  space = 1;
  for (i in (max - 1):1) {
    for (j in 0:space) cat(" ")
    for (j in 0:(i - 1)) cat("* ")
    cat("\n")
    space <- space + 1
  }
}
diamond(10)


space=8-1
for (i in 0:(8 - 1)) {
    for (j in 0:space) cat(cat(j+1),cat(LETTERS[i+1]),cat('-'),cat("Matrix "))
    #for (j in 0:space) cat(" ")
  cat("\n")
  #space <- space - 1
}
#==============read file======
library(xlsx)
data=read.xlsx("C:/Users/SANJAI/Desktop/Module_Exercise/Interview_ExcerciseFile/Matrix_file.xlsx", sheetIndex = 1, check.names=F) 
for (i in 1:nrow(data)){
  for(j in 1:(ncol(data)-1)) data[i,j+1]=paste(j,LETTERS[i],"-Matrix", sep = '')
}

#============Score_Description========
library(xlsx)
data=read.xlsx('C:/Users/SANJAI/Desktop/Module_Exercise/Interview_ExcerciseFile/Score_Description.xlsx', sheetIndex = 1, check.names=F)
data$Score=paste(data$Score*100, '%', sep = '')
data$ScoreDescription=paste(data$`Employee Name`,data$Score)



#=============Short Name=============
library(xlsx)
library(stringr)
library(dplyr)
data1=read.xlsx("C:/Users/SANJAI/Desktop/Module_Exercise/Interview_ExcerciseFile/Short_Name.xlsx", sheetIndex = 1, check.names=F)

data1$`Executive Name`=trimws(data1$`Executive Name`)
data1$`Short Name`=paste(paste(substring(data1$`Executive Name`,1,1),substring(stringr::word(data1$`Executive Name`,2),1,1), sep=""), stringr::word(data1$`Executive Name`,3))


#==================Extract DOB==============
library(stringr)
df1=read.xlsx("C:/Users/SANJAI/Desktop/Module_Exercise/Interview_ExcerciseFile/DOB.xlsx", sheetIndex = 1, check.names=F)
df1$DOB=str_extract(df1$`When is your date of birth?`, "[0-9/]{8,}")

#=======================Extract Name and Emp_id===================
library(stringr)
df2=read.xlsx("C:/Users/SANJAI/Desktop/Module_Exercise/Interview_ExcerciseFile/Extract_Emp_id_and_Name.xlsx",sheetIndex = 1, check.names=F)
df2$`Employee Details`=trimws(df2$`Employee Details`) 
# str="A C Prithviraj (A10718)"
# substring(str,1,regexpr("[(]",str)[[1]][1]-2)

for (i in 1:nrow(df2)){
  df2$Emp_Name[i]=substring(df2$`Employee Details`[i],1, regexpr("[(]", df2$`Employee Details`[i])[[1]][1]-2)
}

for (i in 1:nrow(df2)){
  df2$ID[i]=substring(df2$`Employee Details`[i],regexpr("[(]", df2$`Employee Details`[i])[[1]][1]+1, nchar(df2$`Employee Details`[i])-1)
}




