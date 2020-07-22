#VEGAN package info from Jenn- functional groups need to be on own, cant have anything
#attached, create another data frame with just species and percent cover in long table
#another data frame with groupings, thats just numeric, data$site and data$year
#NMDS interpret similar to PCA code on github from Jenn

library(vegan)

mcr_group_cover <- mcr_grouped_habitat %>%
  ungroup() %>%
  select(group, Percent_Cover)
  
mcr_groupings <- mcr_grouped_habitat %>%
  ungroup() %>%
  select(group)
  
#PERMANOVA- transforming data to matrix 
mcr_mat <- as.matrix(mcr_group_cover)

adonis(mcr_mat, method = "bray", permutations = 999)
       

