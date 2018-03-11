# Script to simulate infection spread based on nodes with highest betweeness 
# centrality being infected initially.

temp_network = docnet2

# Initialise variables and storage
sim_time = 1000
num_init_infec = 20
infec_prone = matrix(0, 2, 242)
infec_prone[1, ] = c(1:242)
indexes = 242*sim_time - c(241:0)

# Finding nodes with top 
bet_centy = betweenness(temp_network, v = V(temp_network),
                        directed = TRUE)
initial_inf = c(1:num_init_infec)

# finding top num_nodes most infection prone nodes
for (i in 1:num_init_infec) {
    initial_inf[i] = which.max(initial_inf)
    bet_centy = bet_centy[-initial_inf[i]]
}

# Simulating epidemic spread 
for (i in 1:100) {
    epi_sim = simEpi(temp_network, init_infected = initial_inf,
                     inf.prob = 0.5, max.time = sim_time)
    those_infected = epi_sim$results[indexes, 2]
    
    infec_prone[2, ] = ifelse(those_infected == TRUE,
                              infec_prone[2, ] + 1, infec_prone[2, ])
}

# Dataframe for plot
infec_data = data.frame(
    x = c(1:242),
    y = infec_prone[2, ]
)