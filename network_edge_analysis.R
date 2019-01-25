# Load packages
library(igraph)

# Add the column edgeList$FromLabel
edgeList$FromLabel <- customers[match(edgeList$from, customers$id), 2]

# Add the column edgeList$ToLabel
edgeList$ToLabel <- customers[match(edgeList$to, customers$id), 2]

# Add the column edgeList$edgeType
edgeList$edgeType <- edgeList$FromLabel + edgeList$ToLabel

# Count the number of each type of edge
table(edgeList$edgeType)

# In your churn network, you have 8842 edges of type 0, 2996 edges of type 1, and 653 edges of type 2.

# Count churn edges
ChurnEdges <- sum(edgeList$edgeType == 2)

# Count non-churn edges
NonChurnEdges <- sum(edgeList$edgeType == 0)

# Count mixed edges
MixedEdges <- sum(edgeList$edgeType == 1)

# Count all edges
edges <- ChurnEdges + NonChurnEdges + MixedEdges

#Print the number of edges, 12491 edges of all types
edges

# Count the number of churn nodes
ChurnNodes <- sum(customers$churn == 1)

# Count the number of non-churn nodes
NonChurnNodes <- sum(customers$churn == 0)

# Count the total number of nodes
nodes <- ChurnNodes + NonChurnNodes

# Compute the network connectance
connectance <- 2 * edges  / nodes / (nodes - 1)

# Print the value
connectance

# .001014031 This network is rather sparse


