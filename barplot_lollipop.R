###############Barplot (lolipop stile)########
library(grid)
library(ggplot2)
library(tidyverse)
library(forcats)

# Create data

data<- read.table("dados.etapas.txt",h=T)

fix(data) #rename the columns 
# Horizontal version
head(data)

p<- data %>%
    mutate(etapa = fct_relevel(etapa, 
                          "Introdu??o", "Coloniza??o", "Dispers?o", 
                          "Estabelecimento", "Impacto")) %>% 
  ggplot2::ggplot(aes(x = etapa, y = artigos)) +
  geom_segment( aes(x=etapa, xend=etapa, y=0, yend=artigos),) +
  geom_point(  size=5, color="violetred1", fill=alpha("steelblue3", 0.3), alpha=0.7, shape=21, stroke=2) +
  labs(x = "Etapa da invas?o",
       y = "N?mero de artigos")+
  theme_light(base_size = 20) +
  coord_flip() +
  theme(
    panel.grid.major.y = element_blank(),
    panel.border = element_blank(),
    axis.ticks.y = element_blank())
  
p+ scale_y_continuous(breaks = c(0,5, 10, 15, 20, 25, 30, 35, 40, 45))

ggsave("grafico.etapalolipop.tiff", width = 12,
       height = 6 ,dpi=800)






  