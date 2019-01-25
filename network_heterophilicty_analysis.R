# Load packages
library(igraph)

# Heterophilicity measures measures the connectedness between nodes with opposite labels,
# compared to what is expected for a random configuration of the network.

# Outcomes

# H > 1 : Heterophilic
# D ~ 1: Random
# D < 1 : Heterophobic

# Compute the expected heterophilicity
ExpectedHet <- NonChurnNodes * ChurnNodes * connectance

# Compute the heterophilicity
Het <- MixedEdges / ExpectedHet

# Inspect the heterophilicity
Het
