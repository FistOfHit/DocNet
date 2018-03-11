# Script to simulate the connectedness (largest component size) of docnet
# during iterative removal of nodes based on their measures of centrality

# Temporary copy of network to play around with
bet_network = docnet2
clo_network = docnet2
prk_network = docnet2

num_to_remove = 100

# Storing maximum and average size per each iteration
bet_comp_size = c(1:num_to_remove+1)
clo_comp_size = c(1:num_to_remove+1)
prk_comp_size = c(1:num_to_remove+1)

# Initial largest component size
bet_comp_data = clusters(bet_network, mode = "strong")
bet_comp_size[1] = max(bet_comp_data$csize)

clo_comp_data = clusters(clo_network, mode = "strong")
clo_comp_size[1] = max(clo_comp_data$csize)

prk_comp_data = clusters(prk_network, mode = "strong")
prk_comp_size[1] = max(prk_comp_data$csize)

# Degree centrality
bet_centy = betweenness(bet_network, v = V(bet_network), directed = TRUE)
clo_centy = closeness(clo_network, vids = V(clo_network), mode = "all")
prk_centy = page_rank(prk_network, algo = "prpack", vids = V(prk_network),
                      directed = TRUE, damping = 0.85)
prk_centy = prk_centy$vector / max(prk_centy$vector)

# Removing nodes one by one and finding size
for (i in 1:num_to_remove) {
    
    # Recording max component size for each measure
    bet_node = which.max(bet_centy)
    bet_network = bet_network - V(bet_network)[bet_node]
    bet_comp_data = clusters(bet_network, mode = "strong")
    bet_comp_size[i+1] = max(bet_comp_data$csize)
    
    clo_node = which.max(clo_centy)
    clo_network = clo_network - V(clo_network)[clo_node]
    clo_comp_data = clusters(clo_network, mode = "strong")
    clo_comp_size[i+1] = max(clo_comp_data$csize)
    
    prk_node = which.max(prk_centy)
    prk_network = prk_network - V(prk_network)[prk_node]
    prk_comp_data = clusters(prk_network, mode = "strong")
    prk_comp_size[i+1] = max(prk_comp_data$csize)
    
    # new degree centrality
    bet_centy = betweenness(bet_network, v = V(bet_network), directed = TRUE)
    clo_centy = closeness(clo_network, vids = V(clo_network), mode = "all")
    prk_centy = page_rank(prk_network, algo = "prpack", vids = V(prk_network),
                          directed = TRUE, damping = 0.85)
    prk_centy = prk_centy$vector / max(prk_centy$vector)
}

# Setting up data frames for plotting
bet_size_data = data.frame(
    x = c(0:num_to_remove),
    y = bet_comp_size,
    type = "Betweenness")
clo_size_data = data.frame(
    x = c(0:num_to_remove),
    y = clo_comp_size,
    type = "Closeness")
prk_size_data = data.frame(
    x = c(0:num_to_remove),
    y = prk_comp_size,
    type = "PageRank")
deg_size_data = data.frame(
    x = c(0:num_to_remove),
    y = deg_comp_size,
    type = "Degree"
)
comp_size_data = rbind(bet_size_data, clo_size_data, prk_size_data, deg_size_data) 