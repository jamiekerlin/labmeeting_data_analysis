#information from ("https://jkzorz.github.io/2019/06/06/NMDS.html")

library(vegan)
#extract columns with abundance
com <- mcr_wide_group[,3:ncol(mcr_wide_group)]

#df to matrix
com_matrix = as.matrix(com)

#run metaMDS, set.seed is to maintain consistency 
set.seed(123)
nmds <- metaMDS(com_matrix, distance = "bray")
nmds

plot(nmds)

#extract NMDS x and y coordinates and put in new data frame
nmds_df <- as.data.frame(scores(nmds))

#add columns from original data frame to new nmds df
nmds_df$year = mcr_wide_group$Year
nmds_df$habitat = mcr_wide_group$Habitat

head(nmds_df)


#plot nmds data
library(ggplot2)

#make year categorical variable
nmds_df2 <- nmds_df %>%
 mutate_at(c("year"), as.factor)


nmds_ggplot <- ggplot(nmds_df, aes(x = NMDS1, y = NMDS2)) + 
  geom_point(size = 6, aes(shape = habitat, color = year)) + 
  scale_color_continuous("year")
  theme(axis.text.y = element_text(colour = "black", size = 12, face = "bold"), 
        axis.text.x = element_text(colour = "black", face = "bold", size = 12), 
        legend.text = element_text(size = 12, face ="bold", colour ="black"), 
        legend.position = "right", axis.title.y = element_text(face = "bold", size = 14), 
        axis.title.x = element_text(face = "bold", size = 14, colour = "black"), 
        legend.title = element_text(size = 14, colour = "black", face = "bold"), 
        panel.background = element_blank(), panel.border = element_rect(colour = "black", fill = NA, size = 1.2),
        legend.key=element_blank()) + 
  labs(x = "NMDS1", color = "year", y = "NMDS2", shape = "habitat")

nmds_ggplot

