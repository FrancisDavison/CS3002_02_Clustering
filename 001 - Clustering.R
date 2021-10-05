mydata = read.csv('C:\\Users\\Picard\\Dropbox\\Other Folders\\LABS\\Year 3\\CS3002\\002 - Clustering (Assessed)\\seeds_dataset.csv') #imports the data from seeds_dataset.csv
mydata = na.omit(mydata) #prepping data, removing empty values
mydata = scale(mydata) #prepping data, standardizing variables

#Kmeans clustering:

#k=1
fit<- kmeans(mydata, 1)
aggregate(mydata,by=list(fit$cluster),FUN=mean)

#k=2
fit<- kmeans(mydata, 1)
aggregate(mydata,by=list(fit$cluster),FUN=mean)

#k=3
fit<- kmeans(mydata, 1)
aggregate(mydata,by=list(fit$cluster),FUN=mean)

#k=4
fit<- kmeans(mydata, 1)
aggregate(mydata,by=list(fit$cluster),FUN=mean)

#k=5
fit<- kmeans(mydata, 1)
aggregate(mydata,by=list(fit$cluster),FUN=mean)

#k=6
fit<- kmeans(mydata, 1)
aggregate(mydata,by=list(fit$cluster),FUN=mean)

#k=7
fit<- kmeans(mydata, 7)
aggregate(mydata,by=list(fit$cluster),FUN=mean)

Kgroups = fit$cluster #assigns value to Kgroups
plot(mydata, col=Kgroups) #plots scatterplot of mydata with Kgroups to colour code










source("C:\\Users\\Picard\\Dropbox\\Other Folders\\LABS\\Year 3\\CS3002\\002 - Clustering (Assessed)\\WK_R.R") #imports Weighted Kappa code to use as source
