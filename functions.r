
# functions: 

check_species_existence <- function(species, taxon_col = "Taxon") {
  require(stringdist)
  if (!species %in% df[[taxon_col]]) {
    all_taxa <- unique(df[[taxon_col]])
    distances <- stringdist(species, all_taxa, method = "osa")
    suggestions <- all_taxa[order(distances)]
    message(paste0(
      "Species '", species, "' not found.\n",
      "Closest matches are:\n  ",
      paste(head(suggestions, 5), collapse = "\n  ")
    ))
    return(invisible(NULL))
    
  } else {
print(paste0("Yes!, ", species," exits") )
  }
}


# All species:
get_all<- function(x){
    fish <- unique(df$Taxon)
}


# Get taxonomic information
get_taxonomy<- function(species = sp){
    data <- df[df$Taxon ==species,]
    data1 <- data[,c("Taxon","ScientificName","Phylum","Family","Class")]
    data1 <- data1[1,]
return(data1)
}


# Get habitat
habitat = "freshwater"

get_habitat <- function(species = NULL, habitat = NULL) {
  
  if (!is.null(species)) {
    data_out <- subset(df, Taxon == species, select = c("Taxon", "Habitat"))
    data_out <- data_out[!duplicated(data_out$Taxon),]
    return(data_out)
  } 
  
  if (!is.null(habitat)) {
    data_out <- subset(df, grepl(habitat, Habitat, ignore.case = TRUE),
                       select = c("Taxon", "Habitat"))
    data_out <- data_out[!duplicated(data_out["Taxon","Habitat"]),]

    return(data_out)
  }
  stop("Please supply either a species or a habitat name (freshwater or marine) ")
}


# Get native range
get_native <- function(species =x){
    range<- df[df$Taxon ==species, ]
    range <- range[,c("Taxon","native_region")]
    range <- range[!duplicated(range$Taxon), ]
}


# Get first records
get_first_records <- function(species=sp){
records <- df[df$Taxon ==species,]
records <- records[,c("Taxon","Location","Continent","First_record")]
return(records)
}


# Get pathways
get_pathway <- function(species=sp){
path <- df[df$Taxon ==species,]
path <- path[,c("Taxon","Pathway_main_category","Pathway_subcategory","Pathway_intentionality")]
path <- path[!duplicated(path$Taxon), ]
return(path)
}


# Get impacts
get_impact <- function(species=sp){
imp <- df1[df1$Taxon ==species,]
cols <- names(imp)[which(imp[1, ] == 1)]
cols2 <- intersect(c("Taxon", cols), names(imp))
imp2 <- imp[, cols2, drop = FALSE]
return(imp2)
}
