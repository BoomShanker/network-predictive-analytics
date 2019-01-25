# Load packages

library(tidyverse)
library(igraph)
library(threejs)
# Load the pROC package
library(pROC)

# Inspect the customers dataframe
head(customers)

# Count the number of churners and non-churners
table(customers$churn)

# Add a node attribute called churn
V(network)$churn <- customers$churn

# Visualize the network
plot(network, vertex.label = NA, edge.label = NA, 
     edge.color = 'black', vertex.size = 2)

# Add a node attribute called color
V(network)$color <- V(network)$churn

# Change the color of churners to red and non-churners to white
V(network)$color <- gsub("1", "red", V(network)$color) 
V(network)$color <- gsub("0", "white", V(network)$color)

# Plot the network
plot(network, vertex.label = NA, edge.label = NA,
     edge.color = "black", vertex.size = 2)

# Create a subgraph with only churners
churnerNetwork <- induced_subgraph(network, 
                                   v = V(network)[which(V(network)$churn == 1)])

# Plot the churner network 
plot(churnerNetwork, vertex.label = NA, vertex.size = 2)


#
# Below vectors are given, need to calculate
#

# Compute the churn probabilities
churnProb <- ChurnNeighbors / (ChurnNeighbors + NonChurnNeighbors)

# Find who is most likely to churn
mostLikelyChurners <- which(churnProb == max(churnProb))

# Extract the IDs of the most likely churners
customers$id[mostLikelyChurners]

# Find churn probability of the 44th customer
churnProb[44]

# Update the churn probabilties and the non-churn probabilities
churnProb_updated <- as.vector((AdjacencyMatrix %*% churnProb) / neighbors)

# Find updated churn probability of the 44th customer
churnProb_updated[44]



