#Load the necessary package
install.packages("readr")
library(readr)

#Read the data set from the URL
dataset_url <- "https://raw.githubusercontent.com/HackBio-Internship/public_datasets/main/R/datasets/data.tsv"
my_data <- read.table(dataset_url, header = TRUE, sep = "\t")

head(my_data)

# Calculate the difference (ΔE)
my_data$delta_E <- my_data$Beta_5d.release_etoposide - my_data$Beta_Untreated_day14

head(my_data)

#Load the necessary library
library(dplyr)

#Filter genes based on dependency score and change in expression
filtered_genes <- my_data %>% 
  filter(Depmap < -1 & delta_E > 0.2)

# Print the list of filtered genes
print(filtered_genes)

