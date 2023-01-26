######Barplot aquatic macrophyte species############

library(ggplot2)
library(tidyverse)
#import dataset
dados<- read.table("sp.txt", h=T)
dados
head(dados)

dados<- as.data.frame(dados)
head(dados)

#to order the legend
dados$etapa <- factor(dados$etapa, levels=c("introducao", "colonizacao", "estabelecimento", "dispersao", "impacto"),
                      labels=c("Introduction", "Colonization", "Establishment", "Spread","Impact" ))

#plot

g<- dados %>% 
  ggplot(aes(y=reorder(factor(codigo.sp), codigo.sp, function(y) length(y))))+
  geom_bar((aes(fill = etapa)))+
  theme(legend.position = "right")+
  labs(x= "Number of Articles",y= "Species")+
  scale_fill_brewer(palette="Set2", name = "Invasion Stage")+
  theme_bw()+
  theme(text = element_text(size=16))


g1<- g+ scale_x_continuous(breaks = c(5, 10, 15, 20, 25, 30))


g1+ theme(legend.position = c(.87,.20))



ggsave("grafico.sp.etapa.tiff", width = 10,
       height = 6 ,dpi=600)
