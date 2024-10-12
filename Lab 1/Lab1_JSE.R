#################################################
# Lab Manual 1
# J.S. Eloriaga
#################################################

# Setting the working directory

setwd("/Users/justineloriaga/Documents/QTM 100/Lab 1")

# Naming the dataset 

arbuthnot <- read.csv("arbuthnot.csv", header = TRUE)

# We can look at the data by typing its name in the console

arbuthnot

# Using head and tail

head(arbuthnot)
tail(arbuthnot)

# View the dimensions of the data frame

dim(arbuthnot)

# Get a quick overview of the values in the dataset

summary(arbuthnot)

# Selecting a specific column

arbuthnot$boys
arbuthnot$girls

# Adding the first entry (which is year 1629)

5218 + 4683

# We can also calculate the proportion of the boys in 1629 

5218/ (5218 + 4683)

# We can compute for the proportion of boys for all years by assigning a new variable

arbuthnot$propBoys <- arbuthnot$boys /(arbuthnot$boys + arbuthnot$girls)

# View the new variable
arbuthnot

# Making comparisons 

arbuthnot$boys > arbuthnot$girls
sum(arbuthnot$boys > arbuthnot$girls)

# What is the proportion of male baptisms, and does it vary by year?

plot(x = arbuthnot$year, y = arbuthnot$propBoys)

# Connecting with lines

plot(x = arbuthnot$year, y = arbuthnot$propBoys, type = "l")
?plot
?par

# Changing colors
plot(x = arbuthnot$year, y = arbuthnot$propBoys, type = "l", col = 2)
plot(x = arbuthnot$year, y = arbuthnot$propBoys, type = "l", col = "plum")

# All available colors 
colors()

##########################################################################
# HOMEWORK 1
##########################################################################

# Loading the Dataset
present <- read.csv("present.csv", header = TRUE)

# Column names
present
# We have X, year, boys, and girls

# Dimensions of the data frame
dim(present)
# 63 rows and 4 columns 

# What years in the dataset?
summary(present)
# We have 1940 to 2002

# On propotions 
present$boys > present$girls
sum(present$boys > present$girls)
# Yes, true as well 

# Plot on the proportion of boys over time 
present$propBoys <- present$boys/(present$boys + present$girls)
plot(x = present$year, y = present$propBoys)
# Declining proportion 

# Add a title
plot(x = present$year, y = present$propBoys, main="")
title(main = "Propotion of Boys (1940 - 2002)")

# How many years did the proportion exceed 0.512? 
sum(present$propBoys > 0.512)
# 49 times 

# What year was the highest number of births 
present$tot_birth <- present$boys + present$girls
max(present$tot_birth)
# Year was 1961

