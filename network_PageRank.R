# Load packages
library(igraph)

# Mirror network server variables
network = g1

######################################
# WARNING: THIS CODE IS EX, CRASHES R!
######################################


# Compute one iteration of PageRank 
iter1 <- page_rank(network, algo = 'power', options = list(niter = 1))$vector

# Compute two iterations of PageRank 
iter2 <- page.rank(network, algo = 'power', options = list(niter = 2))$vector

# Inspect the change between one and two iterations
sum(abs(iter1 - iter2))

# Inspect the change between nine and ten iterations
sum(abs(iter9 - iter10))