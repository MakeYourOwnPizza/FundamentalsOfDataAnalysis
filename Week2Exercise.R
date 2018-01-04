# table() gives you a number of the categorical variable
gtab <- table(acl$Grammy)

# prop.table() calculates the proportion across each category
# This gives us the marginal distribution.
prop.table(gtab)

# with each gender, how many grammy winners there were
gtab2 <- table(acl$Grammy,acl$Gender)
gtab2

#see the proportion of overall observations
prop.table(gtab2)

# gives the row proportion distribtution
prop.table(gtab2,1)

# gives the column proportion distribution
prop.table(gtab2,2)

# make a bar chart across one variable
barplot(gtab)
barplot(gtab,main='ACL Grammy Winners',xlab='Grammy Winner',ylab='Counts')

# make a stacked or side by side bar plot, to visualize two categorical variables at the same time.
barplot(gtab2)
# gives you the legend, T means True
barplot(gtab2,legend=T)
barplot(gtab2,legend=T,main='Gender by Grammy Winners',xlab='Gender',ylab='Counts')
# beside option makes it to be a side by side bar chart.
barplot(gtab2,legend=T,beside=T,main='Gender by Grammy Winners',xlab='Gender',ylab='Counts')

# relative frequency stacked bar chart(aka. mosaic plot)
barplot(prop.table(gtab2,2),legend=T)

# PreLab
# Primary Research Question
# For artists age 30 or older, do female artists play different kinds 
#of music on Austin City Limits than male artists?
# 1. Create a subset of the data for artists age 30 or older.
older <- acl[acl$Age >= 30,]
# 2. Create a table to show the marginal distribution for each variable.  
genre <- table(older$Genre)
genre
gender <- table(older$Gender)
gender
# 3. Create a contingency table to show the conditional distribution for gender and genre.  
twoway <- table(older$Gender,older$Genre)
twoway
# 4. Make a bar chart to better visualize how many male and female artists played in each genre.
barplot(twoway, legend=T, beside=T, main='Genre by Artists age 30 or older',xlab='Genre',ylab='Counts')
# 5. Calculate P(A):  the probability of each type of music (genre) being played.
prop.table(genre)
# 6. Calculate P(A|B):  the probability of each genre, given the artist's gender.
prop.table(twoway,1)
# 7. Interpret what these probabilities tell us about the relationship between genre and gender. 

# Conduct the Analysis in R
# 1. Type or copy the script from the Prepare for the Analysis section into the Script window of R.
# 2. Select the portion of the code you wish to run, then press "ctrl+ enter." 
# 3. Output can be found in the Console window.
# 1a. How many male artists are in the 30+ year old 
#artist subset of the Austin City Limits dataset?
# 1b. How many female artists are in the 30+ year old 
#artist subset of the Austin City Limits dataset?
gender
# 2a. To determine the proportion of jazz performers 
#that were male, you would divide ________ by ________.
twoway
genre
# 2b. To determine the proportion of males that performed 
#jazz, you would divide ________ by ________. (Enter responses in the order listed in the quesiton.)
twoway
gender
# 3a. Which table should you look at to determine how many artists performed rock/folk/indie music: genre or gender?
genre
# 4a. Which of these lines of code provides the probability 
#that a randomly selected artist from the dataset performed rock/folk/indie music?
prop.table(genre)
# 5a. Which of these lines of code provides the probability 
#that a randomly selected female artist performed rock/folk/indie music?
prop.table(twoway,1)

# Lab
# PRoblem
# 2. One of the following questions will be answered in this lab 
#by comparing marginal and conditional probabilities. Select the 
#question that should be answered using this method:
# Among male artists, is there an association between winning a 
#Grammy award and the genre of music that you play?

# Primary Research Question
# Among male artists, is there an association between winning 
#a Grammy and the genre of music that he plays?

# Let's break this question down into the different descriptive statistics that you will 
#need to construct your answer.  Be sure that your R output includes all of the following components. 
# 1. Subset the data (males only).
male <- acl[acl$Gender=='M',]
# 2. Create a table to show the marginal distributions for Genre and Grammy.
genre <- table(male$Genre)
genre
grammy <- table(male$Grammy)
grammy
# 3. Create a contingency table to show the conditional distribution for Genre and Grammy.
twoway <- table(male$Grammy,male$Genre)
# 4. Make a bar chart to better visualize how many artists in each Genre received a Grammy.
barplot(twoway,legend=T,beside=T, main='Genre by Grammy winners',xlab='Genre',ylab='Counts')
# 5. Calculate P(A):  the probability of winning a Grammy.
prop.table(grammy)
# 6. Calculate P(A|B): the probability of winning Grammy, given the artist's Genre.
prop.table(twoway,2)
# 7. Interpret what these probabilities tell us about the relationship between Genre and winning a Grammy.
# 1) How many male artists won a Grammy?
grammy
# 2) How many male artists did not win a Grammy?
grammy
# 3) Which genre had the greatest number of Grammy wins?
twoway
# 4) What is the probability that a randomly selected artist was a Grammy winner?
prop.table(grammy)
# 5) To determine the probability of winning a Grammy if the artist 
#was a singer-songwriter, you would divide _______ by ________. 
twoway
genre
prop.table(twoway,2)
# 6) To determine the probability that a randomly-selected Grammy 
#winner was a singer-songwriter, you would divide ________ by ________.
twoway
grammy
# What is the probability that a randomly selected male artist 
#from each of the following genres won a Grammy? 
# 7a. Country?
# 7b. Jazz?
# 7c. Rock/folk/indie?
# 7d. Singer-songwriter?
prop.table(twoway,2)

# Problem Set
# Question 1
# You want to see if an artist's popularity on Facebook 
# #(whether or not they have 100,000 or more likes) has anything to do with their age.
# 1.  Generate a table to show the number of artists that are "popular" and those that are not.
popular <- acl[acl$Facebook.100k==1,]
unpopular <- acl[acl$Facebook.100k==0,]
# 2.  Generate a table to show the number of "popular" artists within each age group.
popularbyage <- table(popular$Age.Group)
