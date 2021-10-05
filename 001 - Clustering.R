mydata = read.csv('C:\\Users\\Picard\\Dropbox\\Github\\CS3002_02_Clustering\\spaeth_02.csv', sep=",")

plot(mydata)

# optional: Prepare Data
mydata = na.omit(mydata) # deletion of missing data
mydata = scale(mydata) # standardize variables

d <- dist(mydata, method = "euclidean") # distance matrix

fit <- hclust(d, method="average")
plot(fit) # display dendogram

Hgroups <- cutree(fit, k=5) # cut tree into 5 clusters

rect.hclust(fit, k=5, border="red")

plot(mydata, col=Hgroups)

#Kmeans:

fit <- kmeans(mydata, 5) # 5 cluster solution

aggregate(mydata,by=list(fit$cluster),FUN=mean)

Kgroups = fit$cluster

plot(mydata, col=Kgroups)

source("C:\\Users\\Picard\\Dropbox\\Github\\CS3002_02_Clustering\\WK_R.r")

wk = WK_R(Kgroups, Hgroups)

