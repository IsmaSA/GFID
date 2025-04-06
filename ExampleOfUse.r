# You need to read excel files first

# Supporting functions
source(functions.R)

getwd()

# Ensure read it like this (do not alter the names)
df <- read_xlsx("data.xlsx")
df1 <- read_xlsx("data.xlsx", sheet = 2)


sp <- "Carassius auratus"


# First, you may want if your species exits and propose suggestions:
check<- check_species_existence(species = sp)


# 1) get all the species names
species <- get_all()
species


# 2) Get taxonomy: 
taxonomy <- get_taxonomy(species = sp)


# 3) Get habitat:
# Habitat of a given species of species in an habitat
habitat <- get_habitat(species=sp, habitat = NULL)

habitat <- get_habitat(habitat =  "marine")


# 4) Get native ranges:
range<- get_native(name=sp)


# 5) Get first records:
records<- get_first_records(species=sp)


# 6) Get pathway
pathways<- get_pathway(species=sp)


# 7) Get impacts (only columns with impacts, i.e. 1 are retained)
impact <- get_impact(species=sp)
