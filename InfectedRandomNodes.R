# Script to simulate infection spread baed on random nodes being initially 
# infected

temp_network = docnet2

# Initialise variables and storage
sim_time = 500
num_init_infec = 20
infec_prone = matrix(0, 2, 242)
infec_prone[1, ] = c(1:242)
indexes = 242*sim_time - c(241:0)

# Repeatedly simulating epidemic spread
for (i in 1:10) {
    initial_inf = sample(242, num_init_infec)
    for (j in 1:25) {
        epi_sim = simEpi(temp_network, init_infected = initial_inf,
                         inf.prob = 0.5, max.time = sim_time)
        those_infected = epi_sim$results[indexes, 2]
        
        infec_prone[2, ] = ifelse(those_infected == TRUE,
                                  infec_prone[2, ] + 1, infec_prone[2, ])
    }
}

# Dataframe for plot
infec_data = data.frame(
    x = c(1:242),
    y = infec_prone[2, ]
)
