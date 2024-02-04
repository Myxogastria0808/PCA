sample_data <- read.csv("DataSample.csv")
sample_data <- data.frame("sample_data" = sample_data)
sample_data <- sample_data[2:7]
prcomp_obj <- prcomp(sample_data, scale = TRUE)

pc1 <- prcomp_obj$x[, 1] # The first principal component score
pc2 <- prcomp_obj$x[, 2] # The second principal component score

label <- as.factor(sample_data[, 6]) # Classification labels
percent <- summary(prcomp_obj)$importance[3, 2] * 100 # The cumulative contribution ratio

plot(pc1, pc2, col = label, main = paste(percent, "%"))
