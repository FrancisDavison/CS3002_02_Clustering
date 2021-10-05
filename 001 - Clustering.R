mydata = read.csv('C:\\Users\\Picard\\Dropbox\\Github\\CS3002_02_Clustering\\seeds_dataset.csv', sep=",");

plot(mydata);

# optional: Prepare Data
mydata = na.omit(mydata); # deletion of missing data
#mydata = scale(mydata); # standardize variables

d <- dist(mydata, method = "euclidian"); # distance matrix

fit <- hclust(d, method="average");
plot(fit); # display dendogram

Hgroups <- cutree(fit, k=2); # cut tree into 5 clusters

rect.hclust(fit, k=2, border="red");

plot(mydata, col=Hgroups);

#Kmeans:

fit <- kmeans(mydata, 2); # 5 cluster solution

aggregate(mydata,by=list(fit$cluster),FUN=mean);

Kgroups = fit$cluster;

plot(mydata, col=Kgroups);

source("C:\\Users\\Picard\\Dropbox\\Github\\CS3002_02_Clustering\\WK_R.r");

wk = WK_R(Kgroups, Hgroups);
print(wk)