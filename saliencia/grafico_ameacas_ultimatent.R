library(readr)
library(tidyverse)
library(readr)
library(readr)
ameacas_ponto <- read_delim("~/GitHub/analisedocumentos_atas_APAMLN/saliencia/ameacas_ponto.csv", 
                            ";", escape_double = FALSE, locale = locale(encoding = "ISO-8859-1"), 
                            trim_ws = TRUE)
View(ameacas_ponto)

#grafico com Frequencia
ameacas_ponto %>% 
  group_by(risco) %>% 
  mutate(n_total = sum(indice)) %>% 
  ggplot(aes(x = reorder(risco, n_total),  y = indice, fill = Frequência))+
  geom_bar(stat = "identity", position = "stack")+
  coord_flip() +
  theme_minimal()+
  labs(y="Índice de Saliência", x= "Ameaças",
       title = "Gráfico do Índice de Saliência e Frequência das Ameaças")+
  theme(plot.title = element_text(hjust = 0.5),
        text=element_text(size=12,  family="Times New Roman"))+
     scale_fill_distiller(palette = "Set1")
  
  scale_fill_distiller(palette = "Paired")
    
   # scale_colour_brewer(discrete_scale(), type = "seq", palette = 1, #direction = 1, aesthetics = "Dark2")
  



#Gráfico correto de colunas
ameacas_ponto %>% 
  group_by(risco) %>% 
  mutate(n_total = sum(indice)) %>% 
  ggplot(aes(x = reorder(risco, n_total),  y = indice))+
  geom_col(colour="black", fill= "white") +
  coord_flip() +
  theme_minimal()+
  labs(y="Índice de Saliência", x= "Ameaças", 
       title = "Gráfico do Índice de Saliência das Ameaças")+
  theme(plot.title = element_text(hjust = 0.5),
        text=element_text(size=12,  family="Times New Roman"))+
 # scale_y_discrete(breaks = seq(0, 1.0,by = 0.2)) 
  
  
  #não consigo mudar a escala
  

#GRAFICO QUE DEU MAIS CERTO
ameacas %>%
  ggplot(aes(risco, indice))+
  geom_col(colour="black", fill= "white") +
  coord_flip() +
  theme_minimal()+
  labs(X ="Ameaças", Y= "Índice de Saliência", 
       title = "Gráfico da Saliência das Ameaças Percebidas")+
  scale_y_discrete(breaks = seq(0, 1.0,by = 0.2))

  
 
