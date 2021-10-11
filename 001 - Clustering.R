mydata = read.csv('C:\\Users\\Picard\\Dropbox\\Other Folders\\LABS\\Year 3\\CS3002\\002 - Clustering (Assessed)\\seeds_dataset.csv') #imports the data from seeds_dataset.csv', sep=",")
source("C:\\Users\\Picard\\Dropbox\\Other Folders\\LABS\\Year 3\\CS3002\\002 - Clustering (Assessed)\\WK_R.R") #imports Weighted Kappa code to use as source

min=2 #defines minimum value of k, cannot be less than 2
max=20 #defines maximum value of k

linkage_measure="average" #specifies linkage method for hierarchical clustering
wk_store <- data.frame()
for(k in min:max)
{
  #Hierarchical Clustering
  d <- dist(mydata, method="euclidian") #distance matrix
  #Average Linkage
  fit <- hclust(d, method=linkage_measure)
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
  wk_temp <- data.frame(k,wk)
  wk_store <- rbind(wk_store, wk_temp)
}
plot(wk_store, main="wk against k") #plots the different wk values against their respective k value