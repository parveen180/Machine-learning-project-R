#kmeans clusterring

dataset=read.csv('mall.csv')
X = dataset[4:5]

#using elbow method to find number of clustors
set.seed(6)
wcss <- vector()
for (i in 1:10) wcss[i] = sum(kmeans(X, i)$withinss)
plot(x = 1:10,
     y = wcss,
     type = 'b',
     main = paste('The Elbow Method'),
     xlab = 'Number of clusters',
     ylab = 'WCSS')

#applying kmeans
set.seed(29)
kmeans = kmeans(X,
                centers = 5,
                iter.max = 300,
                nstart = 10)

library(cluster)
clusplot(x = X,
         clus = kmeans$cluster,
         lines = 0,
         shade = TRUE,
         color = TRUE,
         labels = 2,
         plotchar = FALSE,
         span = TRUE,
         main = paste('Clusters of customers'),
         xlab = 'Annual Income',
         ylab = 'Spending Score')