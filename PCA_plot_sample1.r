A=read.csv("")
A=data.frame("A"=A)
A<-A[2:7]
prcomp.obj<-prcomp(A,scale=TRUE)

pc1 <- prcomp.obj$x[,1] # The first principal component score
pc2 <- prcomp.obj$x[,2] # The second principal component score

label <- as.factor(A[,6]) # Classification labels
percent <- summary(prcomp.obj)$importance[3,2] * 100 # The cumulative contribution ratio

plot(pc1, pc2, col = label, main = paste(percent, "%"))
