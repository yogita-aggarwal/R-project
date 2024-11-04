install.packages("ggplot2")           #install the ggplot2 library for scatter plot 
library(ggplot2)                         # Load the ggplot2 library

D <- read.csv("C:\\Users\\Asus\\Downloads\\user_behavior_dataset.csv")
D

#understand its structure
str(D)             #check the structure of dataset
summary(D)                     #summary of dataset

#aggregation of dataset
 #aggregate(dependent~independent,dataname,function)

aggregate(Screen.On.Time..hours.day.~ User.Behavior.Class, D,mean)
aggregate(Screen.On.Time..hours.day.~ Gender, D,mean)
aggregate(Number.of.Apps.Installed~Age, D,mean)
aggregate(Screen.On.Time..hours.day.~ User.Behavior.Class, D,sum)
aggregate(Screen.On.Time..hours.day.~ Gender, D,sum)



#Checking for a Data frame
D<-as.data.frame(D)
is.data.frame(D)                         #to check if D as a data frame

# Plotting histograms for numerical variable

hist(D$Screen.On.Time..hours.day., main = "Screen Time",
     xlab = "screen time", 
     col = "lightblue", 
     border = "black")
hist(D$Age, main = "Age", 
     xlab = "Age", 
     col = "green",
     border = "black")
hist(D$Number.of.Apps.Installed, main = "No. of Apps", 
     xlab = "No. of app installed", 
     col = "lightcoral",
     border = "black")

# Boxplots to identify outliers in the numerical variables

boxplot(D$Age, main = "Boxplot of Age",
        ylab = "Age",
        col = "lightblue",horizontal = TRUE )

boxplot(D$Data.Usage..MB.day., main = "Boxplot of Battery Usage",
        ylab = "Battery Usage", 
        col = "green", horizontal = TRUE)

boxplot(D$Screen.On.Time..hours.day.,main= " Boxplot of Screen Time",
        ylab = "Screen Time", 
        col = "lightcoral", horizontal = TRUE)

boxplot(D$Number.of.Apps.Installed, main = "Boxplot of App Installed",
        ylab = "Apps", 
        col = "pink", horizontal = TRUE)

# Scatter plot of Number of Apps Installed vs Battery Drain (mAh/day), colored by Age

ggplot(D, aes(x = Number.of.Apps.Installed, y = Battery.Drain..mAh.day., color = Age)) +
  geom_point(size = 2) +
  labs(title = "Scatter Plot of Number of Apps Installed vs Battery Drain mAh day", 
       x = "Number of Apps Installed", 
       y = "Battery Drain (mAh/day)") +
  theme_minimal()


# Scatter plot of App Usage Time min day vs Number of Apps Installed, colored by Age

ggplot(D, aes(x =  App.Usage.Time..min.day., y = Number.of.Apps.Installed, color = Age)) +
  geom_point(size = 2) +
  labs(title = "Scatter Plot  App Usage Time min day of vs Number of Apps Installed",
       x = " App Usage Time min day", y = "Number of Apps Installed") +
  theme_minimal()

#box plot: Number.of.Apps.Installed for different Gender

D <- boxplot( Number.of.Apps.Installed~ Gender,
             data=D,
             main="BOX-PLOT Graph",
             xlab="Age",
             ylab="Number of Apps Installed",
             col=c("lightblue", "purple", "lightgreen"),
             border="black",
             pch=16)




