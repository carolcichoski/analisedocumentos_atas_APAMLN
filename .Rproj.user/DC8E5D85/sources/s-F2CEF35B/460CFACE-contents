library(plotly)
library(readr)
library(tidyverse)

importancia <- read_delim("saliencia/importancia.csv", 
                          ";", escape_double = FALSE, locale = locale(encoding = "ISO-8859-1"), 
                          trim_ws = TRUE)
View(importancia)



#Gráfico importancia dos SE

importancia %>% 
  ggplot(aes(x = se,  y = is, fill = importancia)) +
  geom_bar(stat = "identity", position = "stack")+
    coord_flip() +
  theme_minimal()+
  labs(y="Índice de Saliência", x= "Benefícios", 
       title = "Índice de Saliência dos Benefícios percebidos")+
  theme(plot.title = element_text(hjust = 0.5),
        text=element_text(size=12,  family="Times New Roman"))+
    scale_fill_manual(values=c("green", "blue2", "yellow2"), #essas cores feias
                       labels=c("Ambiental Ecológica
", "Econômica", "Sociocultural"),
                        name="Importância")+
        
       
 #para salvar 
    ggsave("importancia_beneficios.png", dpi = 600,   width = 8, height = 5)
   

  
  
  
  
  