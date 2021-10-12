mydata = read.csv('.\\seeds_dataset.csv') #imports the data from seeds_dataset.csv
source(".\\WK_R.R") #imports Weighted Kappa code to use as source
min=2 #defines minimum value of k, cannot be less than 2
max=8 #defines maximum value of k

linkage_measure="average" #specifies linkage method for hierarchical clustering
wk_store <- data.frame() #creates blank dataframe for storing wk values
for(k in min:max) #for loop runs hierarchical and kmeans clustering for values of k in range min:max
{
  ##Hierarchical Clustering
  d <- dist(mydata, method="euclidian") #generate distance matrix of euclidian values between datapoints
  fit <- hclust(d, method=linkage_measure) #performs clustering with linkage measure defined above
  plot(fit) #plots dendrogram
  Hgroups <- cutree(fit, k) #cuts dendrogram into k clusters
  rect.hclust(fit, k, border="pink") #places pink borders to display k clusters
  plot(mydata, col=Hgroups, main=bquote("hierarchical clustering," ~.(linkage_measure)~"Linkage, k="~.(k))) #plots scatterplot with colour coded clusters
  
  ##Kmeans Clustering:
  fit<- kmeans(mydata, k) #calculates kmeans for k clusters
  aggregate(mydata,by=list(fit$cluster),FUN=mean) #gets statistics on clusters using mean value for each variable
  Kgroups = fit$cluster #assigns value to Kgroups
  plot(mydata, col=Kgroups, main=bquote("Kmeans, k="~.(k))) #plots scatterplot of mydata with Kgroups_n to colour code
  
  wk = WK_R(Kgroups, Hgroups) #sets wk value to the value returned by WK_R code
  wk_store <- rbind(wk_store, (wk_temp <- data.frame(k,wk))) #creates wk_temp dataframe, adds k and wk to wk_temp, binds wk_temp to bottom of wk_store
}
plot(wk_store, main="wk against k") #plots the different wk values against their respective k value