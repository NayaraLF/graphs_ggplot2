######Barplot aquatic macrophyte species############


#import dataset
dados<- read.table("sp.etapa.txt", h=T)
dados
head(dados)

dados<- as.data.frame(dados)
head(dados)

#to order the legend
dados$etapa <- factor(dados$etapa, levels=c("introducao", "colonizacao", "estabelecimento", "dispersao", "impacto"),
                      labels=c("Introdu��o", "Coloniza��o", "Estabelecimento", "Dispers�o","Impacto" ))

#plot

g<- dados %>% 
  ggplot(aes(y=reorder(factor(codigo.sp), codigo.sp, function(y) length(y))))+
  geom_bar((aes(fill = etapa)))+
  theme(legend.position = "right")+
  labs(x= "N�mero de artigos",y= "Esp�cies")+
  scale_fill_brewer(palette="Set2", name = "Etapas da Invas�o")+
  theme_bw()+
  theme(text = element_text(size=16))


g1<- g+ scale_x_continuous(breaks = c(5, 10, 15, 20, 25, 30))


g1+ theme(legend.position = c(.87,.20))



ggsave("grafico.sp.etapa.tiff", width = 10,
       height = 6 ,dpi=600)
