install.packages("ggbiplot")
library("ggbiplot")

A=read.csv("")
A=data.frame("A"=A)
A<-A[2:7]


A[1:914,] <- A[1:914,] + 1
A[915:1123,] <- A[915:1123,] + 2
A[1124:1244,] <- A[1124:1244,] + 3
A[1245:1299,] <- A[1245:1299,] + 4

A<- cbind(c(rep("V violacea Makino", 914),
            rep("V violacea var.makinoi harima",209),
            rep("V violacea var.makinoi", 121),
            rep("V sieboldii", 55)),
            A)
colnames(A) <- c("types","L1","L2","L3","L4","L1/L2","L1/L4" )
 
W <- prcomp(A[, 2:7], scale = FALSE)
 
ggbiplot(pcobj = W, choices = 1:2, obs.scale = 0.5, var.scale = 2,
         groups = A[, 1], ellipse = TRUE, ) +
  scale_colour_manual(values = c("#FF0000", "black", "#00FF00","blue")) +
  theme(legend.direction = "horizontal", legend.position = "top")
  