# Global Fish Invasions Database (GFID)

**Welcome to the Global Fish Invasions Database (GFID) repository.** GFID is a harmonized global dataset on **established** (self-sustaining) non-native fish species. It currently covers:

- **193 countries**  
- **1,536 fish species**  
- **5,413 country-level occurrence records**  

Each record includes **introduction pathways**, **native biogeographic realms**, **habitat types** (freshwater, marine, or both), **first-record timelines**, and **impact data** (environmental, economic, social) with mechanistic detail.

This repository provides:

1. The **GFID data** (in Excel format) split into two main files:
   - **Overall_data**: country-level occurrences, habitats, pathways, first records, etc.
   - **Species_spec_impacts**: summarized impact categories and mechanisms for each species.
2. **R scripts** that demonstrate how to **access, filter, and analyze** the data programmatically.


This database is described in detail in the accompanying manuscript, _GFID: A Global Fish Invasion Database_, intended for submission to *Ecological Research*.

---

## Repository Structure

- **README.md**: (this file) – explains how to set up and use the database.
- **data/**:
  - `Overall_data.csv`: 5,413 records (species × country) detailing occurrences, pathways, and other metadata.
  - `Species_spec_impacts.csv`: 1,536 species-level records with environmental/economic/social impact fields.
- **scripts/**:
  - `ExampleOfUse.R`: Demonstrates loading and querying GFID data.
  - `functions.R`: Custom R functions for retrieving species information, approximate matching, etc.

---

## Data Description

### 1. Overall_data

Each row in **Overall_data** corresponds to a species-country record, detailing:

- **Taxonomy**: `Taxon` (species name), `Family`, `Class`, `Phylum`
- **Geography**: `Location`, `Continent`, plus internal IDs (`LocationID`, `ContinentID`)
- **Habitat**: freshwater, marine, or both
- **Introduction pathways**: (`Pathway_main_category`, `Pathway_subcategory`, `Pathway_intentionality`)
- **Native region**: (`native_region`) identifying the original biogeographic realm
- **First_record**: year of first introduction
- **Occurrence status**: presence/establishment qualifiers (e.g., `DegreeOfEstablishment`)

### 2. Species_spec_impacts

Each row in **Species_spec_impacts** corresponds to **one fish species** (not separated by country) and includes:

- Binary indicators for **environmental**, **economic**, and **social** impacts
- Mechanistic impact categories (competition, predation, disease transmission, habitat alteration, etc.)
- Reference or comment fields for source documentation

---

## Installation & Requirements

1. **R version 4.0+** is recommended.
2. Key packages for data handling, visualization, and approximate matching include:

   ```r
   install.packages(c("tidyverse", "sf", "rnaturalearth", "rnaturalearthdata",
                      "countrycode", "stringdist"))

## Getting Started

### 1. Clone or Download

```bash
git clone https://github.com/IsmaSA/GFID.git
cd GFID
```

### Load the Data

# Check structure
```r
glimpse(df)
glimpse(df1)

 ```

```r
source("scripts/functions.R")
```

# Example: check if a species exists
```r
check_species_existence(df_overall, "Carassius auratus")
```

Data License & Citation
License: Creative Commons Attribution (CC BY 4.0). You are free to share and adapt the data for any purpose, but please provide appropriate credit and indicate if changes were made.

Suggested citation:
Haubrock, P.J., Novello, M., Abreo, N.A., Blonska, D., Franco, A.C.S., Soto, I., Castaldelli, G., Katsanevakis, S., Kouba, A., Balzani, P., Kurtul, I., Tarkan, A.S., Briski, E., Britton, R. (2025). GFID: A Global Fish Invasion Database. ...

Check the final published article (if available) for an updated DOI and citation format.

Acknowledgements
Work on GFID was supported by grants from HORIZON-MSCA-2022-PF-01 (DIRECT, Grant No. 101203662; PROSPER, Grant No. 101105250). Please see the paper and repository documentation for full acknowledgements.
Thank you for using GFID! If you find this database helpful, please consider sharing your results or improvements with the community.

