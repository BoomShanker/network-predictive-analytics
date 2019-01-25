# Load packages
library(igraph)

# Network dyadicity measures the connectedness between nodes with the same label,
# compared to what is expected in a random configuration of the network.


# 1) Compute the number of expected same label edges
# 2) Dyadicity equals the actual number of same label
#     edges divided by the expected number of same label edges

# Outcomes

# D > 1 : Dyadic
# D ~ 1: Random
# D < 1 : Anti-Dyadic

# Compute the expected churn dyadicity
ExpectedDyadChurn <- ChurnNodes * (ChurnNodes - 1) * connectance / 2

# Compute the churn dyadicity
DyadChurn <- ChurnEdges / ExpectedDyadChurn

# Inspect the value
DyadChurn

# D > 1 == TRUE, there is dyadicity amongst the churners!

# Compute the expected nonchurn dyadicity
ExpectedDyadNonChurn <- NonChurnNodes * (NonChurnNodes - 1) * connectance / 2

# Compute the churn dyadicity
NonDyadChurn <- NonChurnEdges / ExpectedDyadNonChurn

# Inspect the value
NonDyadChurn

# D ~ 1 == TRUE, this is random