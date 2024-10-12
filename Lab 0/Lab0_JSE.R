#################################
#Author: Justin Eloriaga
#Document Name: Lab 0 Manual
#Date: 08/30/2024
##################################

##### THIS IS HOW YOUR R SCRIPTS SHOULD LOOK #####

#Trying some commands in R
2 + 2 #looking for the answer to the addition of 2 + 2

1:20 #looking for the numbers that fall from 1 to 20

# Store the List of Numbers into "x"
x <- c(2,3,5,7)

# View x
x

# Multiply Every Number in the "x" List by 5
x2 <- x*5

# View x2
x2

#Using our Objects in a Function
# Plot X by X2
plot(x=x,y=x2)

#Find Out All Options for Plot Function
?plot

###### Setting up Environment #####

# Import my dataset using the point & click method or the code we just talked about. 

#Import Dataset
yrbss2013 <- read.csv("/Users/justineloriaga/Documents/QTM 100/weekly_labs/Lab_Datasets/yrbss2013.csv", header = T)

#Setting Working Directory
setwd("/Users/justineloriaga/Documents/QTM 100/weekly_labs/Lab_Datasets/")

#Import Data into R without Entire File Path
yrbss2013 <- read.csv("yrbss2013.csv", header = T)

#Mean of YRBSS Variable 
mean(yrbss2013$age)

# Summary Statistics for Respondent Height
summary(yrbss2013$height_m)

#Basic Plot
plot(x = yrbss2013$height_m,y = yrbss2013$weight_kg)

#Custom Plot - Add Labels
plot(x = yrbss2013$height_m,
     y = yrbss2013$weight_kg,
     type = "p",
     xlab = "Height (m)",
     ylab = "Weight (kg)")
