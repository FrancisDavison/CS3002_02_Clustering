mydata = read.csv('C:\\Users\\Picard\\Dropbox\\Other Folders\\LABS\\Year 3\\CS3002\\002 - Clustering (Assessed)\\seeds_dataset.csv') #imports the data from seeds_dataset.csv', sep=",")
source("C:\\Users\\Picard\\Dropbox\\Other Folders\\LABS\\Year 3\\CS3002\\002 - Clustering (Assessed)\\WK_R.R") #imports Weighted Kappa code to use as source

linkage_method="average" #specifies linkage method for hierarchical clustering
k=5 #determines the value of k for hierarchical and kmeans clustering

#Hierarchical Clustering
d <- dist(mydata, method="euclidian") #distance matrix
#Average Linkage
fit <- hclust(d, method=linkage_method)
plot(fit) #displays dendrogram
Hgroups <- cutree(fit, k)
rect.hclust(fit, k, border="pink")
plot(mydata, col=Hgroups, main=bquote("Average Linkage, k="~.(k)))

#Kmeans Clustering:
fit<- kmeans(mydata, k)
aggregate(mydata,by=list(fit$cluster),FUN=mean)
Kgroups = fit$cluster #assigns value to Kgroups
plot(mydata, col=Kgroups, main=bquote("Kmeans, k="~.(k))) #plots scatterplot of mydata with Kgroups_n to colour code

wk = WK_R(Kgroups, Hgroups)