########treemap metodological approach######

library(treemapify)
library(ggplot2)


group <- c("Observational","Experimental","In Situ Exp.", "Modeling", "Obs./Exp.")
value <- c(59, 23, 11,4,3)
data <- data.frame(group,value)

treemap<-ggplot(data, aes(area = value, fill = group,
  label = paste(group))) +
  geom_treemap()+
  geom_treemap_text(colour= "black",
                    place = "centre",
                    size = 3,
                    grow = T)+
  theme(legend.position = "none")


treemap+scale_fill_brewer(palette = "PuBuGn")

#export the graph into image
ggsave("treemap.png", width = 10,
       height = 6 ,dpi=600)

