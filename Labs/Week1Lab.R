bike <- BikeData

table(bike$student)
bikestudents <- bike[bike$student == '1',]
table(bikestudents$cyc_freq)
mean(bikestudents$distance)
a_b

# Import the BikeData dataset, name it "bike"

# Find the number of students in the dataset
table(bike$student)

# Pull out student data into a new dataframe
student <-bike[bike$student==1,]

# Find how often the students ride, using the new dataframe
table(student$cyc_freq)

# Create a vector for the distance variable
distance <-student$distance

# Find average distance ridden
mean(distance)

males <- bike[bike$gender == 'M',]
male_times <- males$time
mean(male_times)

table(bike$cyc_freq)
table(bike$cyc_freq == 'Daily')

dailyriders <- bike[bike$cyc_freq == 'Daily',]
table(dailyriders$gender)
mean(dailyriders$age)
femaledailyriders <- dailyriders[dailyriders$gender == "F",]
maledailyriders <- dailyriders[dailyriders$gender == "M",]
mean(femaledailyriders$age)
mean(maledailyriders$age) > mean(femaledailyriders$age)
mean(maledailyriders$age)
thiry <- bike[bike$age >= 30,]
thirtymale <- maledailyriders[maledailyriders$age >= 30,]
