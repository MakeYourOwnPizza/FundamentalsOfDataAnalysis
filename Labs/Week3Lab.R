# R Tutorial Exercises
plot(bull$YearsPro,bull$BuckOuts,xlab='Years Pro',ylab='Buckouts',main='Plot of Years Pro vs Buckouts')

abline(lm(bull$BuckOuts~bull$YearsPro))

plot(bull$Events,bull$BuckOuts,xlab='No of Events',ylab='Buckouts',main='Plot of Events vs Buckouts')

abline(lm(bull$BuckOuts~bull$Events))

cor(bull$YearsPro,bull$BuckOuts)

cor(bull$Events,bull$BuckOuts)

myvars <- c('YearsPro','Events','BuckOuts')
cor(bull[,myvars])

#Pre-Lab Exercises
#Subset for riders that participated in at least one event in 2013
new_bull <- bull[bull$Events13  > 0 ,]

# Visualize and describe the first variable of interest
hist(new_bull$Rides13)
fivenum(new_bull$Rides13)
mean(new_bull$Rides13)
sd(new_bull$Rides13)

# Visualize and describe the second variable of interest
hist(new_bull$Top10_13)
fivenum(new_bull$Top10_13)
mean(new_bull$Top10_13)
sd(new_bull$Top10_13)

# Create a scatterplot
plot(new_bull$Rides13,new_bull$Top10_13)

# Add line of best fit
abline(lm(new_bull$Top10_13~new_bull$Rides13))

# Calculate the correlation coefficient
cor(new_bull$Rides13,new_bull$Top10_13)

# Create a correlation matrix 
vars <- c("Top10_13", "Rides13")
cor(new_bull[,vars])

#identify a specific record
which(new_bull$Top10_13==2 & new_bull$Rides13==22)

new_bull[4,]

#Lab Exercises
#In 2012, which variable had the strongest linear 
#relationship with Earnings:  Ride Percentage or Cup Points?

# 1. Create a dataset which contains riders that participated in at least one event in 2012. Call the dataset new_bull12.
new_bull12 <- bull[bull$Events12 > 0,]
# 2. Make a histogram to visualize the distribution of Earnings for 2012.
hist(new_bull12$Earnings12)
# 3. Generate the appropriate descriptive statistics for this distribution.
fivenum(new_bull12$Earnings12)
mean(new_bull12$Earnings12)
sd(new_bull12$Earnings12)
max(new_bull12$Earnings12)
# 4. Make a correlation matrix for Earnings12, RidePer12 and CupPoints12.
vars <- c("Earnings12", "RidePer12", "CupPoints12")
cor(new_bull12[,vars])
# 5. Plot a scatterplot for Earnings12 with each variable of interest.  Put Earnings12 on the y-axis.  Check for outliers.
plot(new_bull12$RidePer12,new_bull12$Earnings12)
plot(new_bull12$CupPoints12,new_bull12$Earnings12)
# 6. Determine which variable has the strongest linear relationship with Earnings12.

# identify specific case
which(new_bull12$Earnings12 == max(new_bull12$Earnings12))
new_bull12[4,]

#Subset the data, remove this data point from the dataset to assess what kind of impact
nooutlier <- new_bull12[new_bull12$Earnings12 < 1000000 ,] 

#rerun the correlation matrix and the scatterplots to see the difference
cor(nooutlier[,vars])

#Problem 1
# Subset the dataset for riders that had at least 1 ride in the 2014 season. Call this dataset new_bull.
new_bull <- bull[bull$Rides14 >= 1,]
# Create a new variable or vector for the average number of rides per event for each bull rider in the new_bull dataset:
RidesPerEvent14 <- new_bull$Rides14/new_bull$Events14
# Make a histogram of your "rides per event" variable and find the five-number summary for your "rides per event" variable.
hist(RidesPerEvent14)
fivenum(RidesPerEvent14)
# What is the minimum and maximum values? (Round to 2 decimal places.)
min(RidesPerEvent14)
max(RidesPerEvent14)
# Create a scatterplot of "rides per event" and yearly ranking (defined by the "Rank14" variable) and add a line of best fit.
plot(RidesPerEvent14,new_bull$Rank14)
abline(lm(new_bull$Rank14~RidesPerEvent14))
# What is the correlation coefficient for rides per event and yearly ranking?
cor(RidesPerEvent14,new_bull$Rank14)

#Problem 2

# What is the correlation coefficient based on the StudyExam data?
plot(Exam$MinutesSpentStudying,Exam$ExamGrade)
cor(Exam$MinutesSpentStudying,Exam$ExamGrade)
# Create a scatterplot of the data (exam grades and time spent studying).
# What is the value of the outlier (the student that got a high grade but didn't study very long)?

# When the outlier is removed, what is the new value of r? (Round to 3 decimal places.)
which(Exam$ExamGrade == 92 & Exam$MinutesSpentStudying == 30)
#outlier <- Exam[which(Exam$ExamGrade == 92 & Exam$MinutesSpentStudying == 30),]
newExam <- Exam[-c(7),]
cor(newExam$MinutesSpentStudying,newExam$ExamGrade)
