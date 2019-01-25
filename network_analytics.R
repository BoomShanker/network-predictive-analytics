
# Load packages

library(tidyverse)
library(igraph)
library(threejs)

# Inspect edgeList
head(edgeList)

# Construct the igraph object
network <- graph_from_data_frame(edgeList, directed = FALSE)

# View your igraph object
network
