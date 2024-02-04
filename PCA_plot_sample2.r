library("ggbiplot")

sample_data <- read.csv("DataSample.csv")
sample_data <- data.frame("sample_data" = sample_data)
sample_data <- sample_data[2:7]


sample_data[1:914, ] <- sample_data[1:914, ] + 1
sample_data[915:1123, ] <- sample_data[915:1123, ] + 2
sample_data[1124:1244, ] <- sample_data[1124:1244, ] + 3
sample_data[1245:1299, ] <- sample_data[1245:1299, ] + 4

sample_data <- cbind(c(rep("V violacea Makino", 914),
              rep("V violacea var.makinoi harima", 209),
              rep("V violacea var.makinoi", 121),
              rep("V sieboldii", 55)),
              sample_data)
colnames(sample_data) <- c("types", "L1", "L2", "L3", "L4", "L1/L2", "L1/L4")

w <- prcomp(sample_data[, 2:7], scale = FALSE)

print(
       ggbiplot(pcobj = w, choices = 1:2, obs.scale = 0.5, var.scale = 2,
                     groups = sample_data[, 1], ellipse = TRUE, ) +
              scale_colour_manual(values = c("#FF0000", "black", "#00FF00","blue")) +
              theme(legend.direction = "horizontal", legend.position = "top")
)