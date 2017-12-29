head(animaldata)

table(animaldata$Sex)

plot(animaldata$Sex)
plot(animaldata$Sex,main='Bar Chart of Animal Genders', xlab='Animal Gender', ylab='Frequency')

hist(animaldata$Age.Intake, main = 'Histogram of Intake Ages', xlab = 'Age at Intake')

femaleage <- animaldata$Age.Intake[animaldata$Sex =='Female']
maleage <- animaldata$Age.Intake[animaldata$Sex == 'Male']

hist(femaleage,main = 'Histogram of Female Ages',xlab='Age at Intake of Female Animals')
hist(maleage,main = 'Histogram of Male Ages',xlab='Age at Intake of Male Animals',breaks =15)

max(maleage)
max(femaleage)

which(animaldata$Age.Intake==17)
animaldata[415,]
animaldata[which(animaldata$Age.Intake==17),]

mean(animaldata$Age.Intake)
median(animaldata$Age.Intake)
sd(animaldata$Age.Intake)
fivenum(animaldata$Age.Intake)

table(animaldata$Outcome.Type)
adopted <- animaldata[animaldata$Outcome.Type=='Adoption',]
daysadopted <-adopted$Days.Shelter
hist(daysadopted)
mean(daysadopted)
median(daysadopted)
fivenum(daysadopted)
sd(daysadopted)
which(animaldata$Days.Shelter==max(daysadopted))
longestdaysadopted <- animaldata[which(animaldata$Days.Shelter==max(daysadopted)),]
zscore <- ((211-mean(daysadopted))/sd(daysadopted))

adultanimals <- animaldata[animaldata$Age.Intake>=1,]
adultdogs <- adultanimals[adultanimals$Animal.Type=='Dog',]
adultcats <- adultanimals[adultanimals$Animal.Type=='Cat',]

hist(adultdogs$Weight)
hist(adultcats$Weight)
mean(adultcats$Weight)
sd(adultcats$Weight)
zscorecat13 <- (13-mean(adultcats$Weight))/sd(adultcats$Weight)
1-pnorm(zscorecat13)
fivenum(adultdogs$Weight)
zscoredog13 <- (13-mean(adultdogs$Weight))/sd(adultdogs$Weight)
1-pnorm(zscoredog13)
median(adultcats$Weight)
sd(adultdogs$Weight)

table(animaldata$Intake.Type)
dogs <- animaldata[animaldata$Animal.Type == 'Dog',]
cats <- animaldata[animaldata$Animal.Type == 'Cat',]
table(dogs$Intake.Type)
dogs[dogs$Intake.Type=='Owner Surrender']/291
81/291
ownersurrenderdog <- dogs[which(dogs$Intake.Type=='Owner Surrender'),]
returnedtoownerdog <- ownersurrenderdog[ownersurrenderdog$Outcome.Type=='Return to Owner',]
mean(returnedtoownerdog$Days.Shelter)
hist(dogs$Intake.Type)
plot(dogs$Intake.Type)

(5.38-6.7)/1.1
(8.79-6.7)/1.1
pnorm(1.9)-pnorm(-1.2)
(4.5-6.7)/1.1
1-pnorm(-2)
