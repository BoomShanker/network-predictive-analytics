# Load packages
library(igraph)

# Types of Edges

names <- c("A", "B", "C", "D", "E", "F", "G", "H", "I", "J")
tech <- c(rep("R", 6), rep("P", 4))
DataScientists <- data.frame(name = names, technology = tech)
DataScienceNetwork <- data.frame(
  from = c("A", "A", "A", "A", "B", "B", "C", "C", "D", "D",
           "D", "E", "F", "F", "G", "G", "H", "H", "I"),
  to = c("B", "C", "D", "E", "C", "D", "D", "G", "E", "F",
         "G", "F", "G", "I", "I", "H", "I", "J", "J"),
  label = c(rep("rr", 7), "rp", "rr", "rr", "rp", "rr", "rp", "rp", rep("pp", 5)))

g <- graph_from_data_frame(DataScienceNetwork, directed = FALSE)

# Add the technology as a node attribute

V(g)$label <- as.character(DataScientists$technology)
V(g)$color <- V(g)$label
V(g)$color <- gsub("R", "blue3", V(g)$color)
V(g)$color <- gsub("P", "green4", V(g)$color)

# Code to color the edges

E(g)$color <- E(g)$label
E(g)$color <- gsub("rp", "red", E(g)$color)
E(g)$color <- gsub("rr", "blue3", E(g)$color)
E(g)$color <- gsub("pp", "green4", E(g)$color)

# Code to visualize the network

pos <- cbind(c(2, 1, 1.5, 2.5, 4, 4.5, 3, 3.5, 5, 6),
             c(10.5, 9.5, 8, 8.5, 9, 7.5, 6, 4.5, 5.5, 4))

plot(g, edge.label = NA,
     vertex.label.color = "white",
     layout = pos,
     vertex.size = 25)

# Counting edge types

# R Edges
edge_rr <- sum(E(g)$label == "rr")

# Python Edges
edge_pp <- sum(E(g)$label == "pp")

# Cross Label Edges
edge_rp <- sum(E(g)$label == "rp")

# Network Connectance

# p <- 2 * edges / nodes * (nodes - 1)

