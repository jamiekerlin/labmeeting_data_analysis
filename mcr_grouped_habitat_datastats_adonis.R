#VEGAN package info from Jenn- functional groups need to be on own, cant have anything
#attached, create another data frame with just species and percent cover in long table
#another data frame with groupings, thats just numeric, data$site and data$year
#NMDS interpret similar to PCA code on github from Jenn

mcr_group_cover <- mcr_grouped_habitat %>%
  ungroup() %>%
  select(group, Percent_Cover)

#PERMANOVA- transforming data to matrix 
mcr_group_cover.matrix <- as.matrix(mcr_group_cover)

adonis(vegdist(mcr_group_cover.matrix), mcr_group_cover.matrix, permutations = 999, method = "bray",
       strata = NULL, contr.unordered = "contr.sum",
       contr.ordered = "contr.poly", parallel = getOption("mc.cores"))
       
