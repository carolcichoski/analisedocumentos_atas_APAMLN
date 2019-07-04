library(readr)
ameacas <- read_delim("saliencia/ameacas.csv", 
                      ";", escape_double = FALSE, locale = locale(encoding = "ISO-8859-1"), 
                      trim_ws = TRUE)
View(ameacas)



#GRAFICO QUE DEU MAIS CERTO
ameacas %>%
  ggplot(aes(risco, indice))+
  geom_col(colour="black", fill= "white") +
  coord_flip() +
  theme_minimal()+
  labs(X ="Ameaças", Y= "Índice de Saliência", 
       title = "Gráfico da Saliência das Ameaças Percebidas")+
  scale_fill_distiller(palette = "Paired")+
  theme(plot.title = element_text(hjust = 0.5),
        text=element_text(size=12,  family="Times New Roman"))
  
 
