# R tutorial
library(SDSFoundations)
world <- WorldBankData

# subest data only from the Great Britian
gbr <- world[world$Country.Code=='GBR',]
# subset data only from 2000s
gbr2000 <- gbr[gbr$year >= 2000 & gbr$year <= 2009,]

# start time varoable at zero, when using logistic model
time <- gbr2000$year - 2000
# create a vector that contains motor vehicles for each of those years
mv <- gbr2000$motor.vehicles
# scatter plot to check
plot(time,mv)

# Exponential model
expFit(time,mv)
# Logistic model
logisticFit(time,mv)
# Linear Model
linFit(time,mv)

# Plot the model fits of all three above together
tripleFit(time,mv)

# Predict the dependent variable at a specific independent variable
# Predict mv counts at year 2012
expFitPred(time,mv,12)
logisticFitPred(time,mv,12)

# Pre-Lab: Worldwide Trends in Internet Usage
# Primary Research Question
#What model best describes the first decade of internet usage (1990-1999) 
#in the United States? Which model is a better long-term fit?


# Breakdown Your Analysis
# Let's break this analysis into its required steps:
# 1. Create a subset of the dataset that contains only the information for the United States.
us <- world[world$Country.Code == "USA",]
# 2. Create a subset of the US data that contains only the years 1990 to 1999. 
us_select <- us[us$year >= 1990,]
us_select$internet.mil <- us_select$internet.users / 1000000
us_select$time <- us_select$year - 1990
us_select_10 <- us_select[us_select$time < 10,]
# 3. Use a function to fit both an exponential and a logistic model to the data.
expFit(us_select_10$time,us_select_10$internet.mil)
logisticFit(us_select_10$time,us_select_10$internet.mil)
# 4. Using each model, predict the number of internet users in 2006. 
expFitPred(us_select_10$time,us_select_10$internet.mil,16)
logisticFitPred(us_select_10$time,us_select_10$internet.mil,16)
# 5. Compare the size of the residuals for 2006 to determine which model appears to have better long-term fit.
# logistic model has a smaller r2 value.

# 3) What was the actual number of internet users (in millions) in the United States in 2006? (Round to 1 decimal place)
us[us$year==2006,]

# Lab 6: Worldwide Trends in Internet Usage
# 1) When choosing between two models with very similar R2 values, what additional statistic should you examine to help you select the best-fitting model?
# the residuals

# Primary Research Question
# Denmark is a high-income country in Europe of about 5.5 million people. What is the 
#best-fitting model for growth of internet usage in Denmark since 1990?

# Analysis
# Let's break this question down into the different descriptive statistics that you will need to construct your answer.  Be sure that your R output includes all of the following components. 
# 1. Create a variable that represents proportion of the population using the internet (internet users divided by population).
world$proportion <- world$internet.users/world$population
# 2. Create a subset of the data that only contains data from 1990 onward.
world1990 <- world[world$year >= 1990,]
# 3. Create a new variable that is "years since 1990". 
world1990$yearssince1990 <- world1990$year - 1990
# 4. Create two new data frame for the country of interest.
world1990Denmark <- world1990[world1990$Country=='Denmark',]
# 5. Determine the best-fitting model (exponential or logistic) for internet usage in each country from 1990 onward.
expFit(world1990Denmark$yearssince1990,world1990Denmark$proportion)
logisticFit(world1990Denmark$yearssince1990,world1990Denmark$proportion)
expFitPred(world1990Denmark$yearssince1990,world1990Denmark$proportion,16.1)
logisticFitPred(world1990Denmark$yearssince1990,world1990Denmark$proportion,12.8)

# Question 1
# How has mobile phone usage in Brazil changed since 1995?
# 1. Create a subset of the world bank data that contains records from Brazil 1995 and later.
brazil1995 <- world[world$Country=='Brazil' & world$year >= 1995,]
# 2. Change the year variable to be "years since 1995" and update the units of the "mobile.users" variable to millions of users. 
brazil1995$time <- brazil1995$year - 1995
# 3. Use this data to answer the following questions.

#1a. Use RStudio to find the number of mobile users in Brazil (in millions) in 2000. (Round to 2 decimal places.)
brazil1995$mobile.users.mil <- brazil1995$mobile.users/1000000
brazil1995[brazil1995$time == 5,]

# 1c. Generate a scatterplot and fit a linear, exponential and logistic model to the data. Which model best describes the increase in mobile users in Brazil since 1995?
tripleFit(brazil1995$time,brazil1995$mobile.users.mil)
# 1d. What proportion of the variation in mobile users is explained by years since 1995 in the best-fitting model? (Round to 3 decimal places.)
logisticFit(brazil1995$time,brazil1995$mobile.users.mil)
0.998
# 1e. Using the best-fitting model, predict the number of mobile users (in millions) in Brazil in 2025. (Round to a whole number.)
logisticFitPred(brazil1995$time,brazil1995$mobile.users.mil,30)

