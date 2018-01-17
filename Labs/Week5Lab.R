library(SDSFoundations)
WR<-WorldRecords
mens800 <- WR[WR$Event=='Mens 800m',]
# Find the linear fit of model that the record as a function of year.
linFit(mens800$Year,mens800$Record)

#PreLAb
#Track and Field World Records
#1a. How many different types of events (e.g. "Mens 100m," "Womens shotput," etc.) are represented in the dataset?
table(WR$Event)

# Primary Research Question
# How has the men's shotput world record changed over time?  What about the women's world record?

# 1. Create a subset of the dataset that contains only the World Record cases for men's shotput.
menshot <- WR[WR$Event=='Mens Shotput',]
# 2. Create a subset that contains only the World Record cases for women's shotput. 
womenshot <- WR[WR$Event=='Womens Shotput',]
# 3. Create a scatterplot of year and record shotput distance: one for men and one for women.  
plot(menshot$Year,menshot$Record, main='Mens Shotput World Records',xlab='Year',ylab='World Record Distance (m)',pch=16)
plot(womenshot$Year,womenshot$Record,main='Womens Shotput World Records',xlab='Year',ylab='World Record Distance (m)',pch=16)
# 4. Confirm from these plots that a linear model is appropriate.  
# 5. Run a linear model for each event and then interpret the results.
linFit(menshot$Year,menshot$Record)
linFit(womenshot$Year,womenshot$Record)

#5) Suppose we wanted to subset our dataset for only world records that were from 1990 and later. What caused the error below? (You may want to examine the dataset in R for help.)
recent <- WR[WR$Year >= 1990,]

# problem
# 1a. How many records are in the menshot data frame?
39
# 1b. How many records in the womenshot data frame?
41

#Lab
# Primary Research Question
# How have the world record times for the men's and the women's mile event changed over the years?
# 1. Create a subset of the data that contains World Record cases for the men's Mile event.
mensmile <- WR[WR$Event=='Mens Mile',]
# 2. Create a subset of the data that contains World Record cases for the women's Mile event. 
womensmile <- WR[WR$Event=='Womens Mile',]
# 3. Create a scatterplot for each relationship of Mile time and year: one for men and one for women.  
plot(mensmile$Year,mensmile$Record, main='Mens Mile World Records',xlab='Year',ylab='World Record Time (s)',pch=16)
plot(womensmile$Year,womensmile$Record, main='Womens Mile World Records',xlab='Year',ylab='World Record Time (s)',pch=16)
# 4. Confirm from these plots that a linear model is appropriate.  
# 5. Run a linear model for each event and then interpret the results. Be sure to calculate R-squared values for each model.
linFit(mensmile$Year,mensmile$Record)
linFit(womensmile$Year,womensmile$Record)

# 2. On average, how many seconds do men trim off the world record time in the Mile each year? (Round to three decimal places)
# 3. On average, how many seconds do women trim off the world record time in the Mile each year? (Round to three decimal places)
# slope of the line of best fit

# 4. How many years would you predict it would take for the men's mile record to decrease by one full second? Use the model equation to help you answer the question.
1/0.393
# 5. How many years would you predict it would take for the women's mile record to decrease by one full second? Use the model equation to help you answer the question.
1/0.973

# 6. What proportion of variance in the men's World Record times in the Mile can be explained by year? (Round to three decimal places)
0.977
# 7. What proportion of the variance in women's World Record times in the Mile can be explained by year? (Round to three decimal places)
0.896

# Problem Set
# Question 1
# We want to find the best-fitting linear model for men's pole vault world records since 1970.
# 1.  Create a new data frame that contains the world record cases in the men's pole vault event in years 1970 and later. 
menspolevault <- WR[WR$Event=='Mens Polevault',]
menspolevault1970 <- menspolevault[menspolevault$Year >= 1970,]
# 2. Use this data frame to answer the following questions.
# 1a. What is the standing world record height (in meters) for men's pole vault? (Round to 2 decimal places.)
max(menspolevault1970$Record)
# 1b. In what year did the pole vault record first exceed 6 meters? (Look at the data to find the year.)
1986
# 1c. Create a scatterplot showing the men's pole vault records since 1970 as a function of year. Fit a linear model to the data.
plot(menspolevault1970$Year, menspolevault1970$Record, main='Mens Pole Vault World Records',xlab='Year',ylab='World Record Distance (m)',pch=16)
linFit(menspolevault1970$Year, menspolevault1970$Record)
# Report the coefficient estimates for the linear model that describes the change in the men's pole vault world record since 1970.
# 1d. What is the intercept? (Round to 3 decimal places.)
-51.854
# 1e. What is the slope? (Round to 3 decimal places.)
0.029
# 1f. Which of the following best describes how the men's pole vault world record has changed since 1970?
#The record has increased by an average of 0.03 meters per year since 1970.

# Question 3
# We have bivariate data on a group of college students: the total amount (in dollars) spent on textbooks throughout their college career, and their GPA. The following linear regression model was used to predict GPA from number of dollars (in hundreds) spent:
#   Predicted GPA = 2.84 + .04*Dollars
# 3a. What is the predicted GPA of a student who spent a total of $970 on textbooks in college? (Round to 2 decimal places.)
2.84+0.04*970/100
# 3b. If a student spent $0 on textbooks in college and graduated with a GPA of 3.71, what is her residual? (Round to 2 decimal places.)
3.71-2.84
# 3c. If a student spent $1,450 on textbooks and graduated with a GPA of 2.91, what is his residual? (Please indicate whether the residual is positive or negative in your response, and round to 2 decimal places.)
2.91 - (2.84+0.04*1450/100)
# 3d. A freshman learned of this study and calculated that she would need to spend $2,900 on textbooks to earn a 4.0 GPA. (You can confirm this calculation using the equation above). She decided to buy all of her textbooks new (rather than second-hand and cheaper) to help boost her GPA. Is she using the model in a statistically-sound way?
