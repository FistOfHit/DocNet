# Script to perform simulations based on nodes with high "journals read" being 
# infected initially

temp_network = docnet2

# Initialise variables and storage
sim_time = 500
num_init_infec = 20
infec_prone = matrix(0, 2, 242)
infec_prone[1, ] = c(1:242)
indexes = 242*sim_time - c(241:0)

# Finding random nodes with nodeJours > 5
smart_docs = ifelse(V(temp_network)$nodeJours == 9,
                    0, V(temp_network)$nodeJours)
smart_docs = smart_docs >= 5
rand_choices = matrix(0, 10, 242)
for (i in 1:10) {
    rand_choices[i, ] = sample(242, 242)
}
initial_inf = matrix(0, 10, num_init_infec)

# Creating the matrix of 10 initial conditions
for (i in 1:10) {
    k = 1
    for (j in 1:242) {
        choice = rand_choices[i, j]
        if (smart_docs[choice] == TRUE) {
            initial_inf[i, k] = choice
            k = k + 1
        }
        
        if (k >= num_init_infec) break
    }
}

# Simulating epidemic spread 
for (i in 1:10) {
    for (j in 1:10) {
        epi_sim = simEpi(temp_network, init_infected = initial_inf[i, ],
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