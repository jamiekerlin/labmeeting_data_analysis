#bar graph for all years
ggplot(data = mcr_grouped_habitat) + geom_bar(mapping = aes(x= Habitat, y = Percent_Cover, fill = group), stat= "identity") + facet_wrap(facets=~Year) +  theme(axis.text.x = element_text(angle=45)) + ggtitle("Percent Cover of Groups by Habitat and Year")


#bar graph for each year
mcr_grouped_habitat2007 <- mcr_grouped_habitat %>% filter(Year == "2007")
ggplot(data = mcr_grouped_habitat2007) + geom_bar(mapping = aes(x= Habitat, y = Percent_Cover, fill = group), stat= "identity") + theme(axis.text.x = element_text(angle=45)) + ggtitle("Percent Cover of Groups by Habitat in 2007")