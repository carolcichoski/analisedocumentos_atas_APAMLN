library(readr)
library(tidyverse)
library(readr)
library(readr)
library(readr)
beneficios_ponto <- read_delim("~/GitHub/analisedocumentos_atas_APAMLN/saliencia/beneficios_ponto.csv", 
                               ";", escape_double = FALSE, locale = locale(encoding = "ISO-8859-1"), 
                               trim_ws = TRUE)

#Gráfico de colunas
beneficios_ponto %>% 
  group_by(beneficio) %>% 
  mutate(n_total = sum(saliencia)) %>% 
  ggplot(aes(x = reorder(beneficio, n_total),  y = saliencia, fill = Frequência))+
  geom_col(colour="black", fill= "white") +
  coord_flip() +
  theme_minimal()+
  labs(y="Índice de Saliência", x= "Benefícios", 
       title = "Gráfico do Índice de Saliência dos Benefícios")+
  theme(plot.title = element_text(hjust = 0.5),
        text=element_text(size=12,  family="Times New Roman"))+
  scale_fill_distiller(palette = "Paired")

  
  #grafico com frequencia
  
  beneficios_ponto %>% 
  group_by(beneficio) %>% 
  mutate(n_total = sum(saliencia)) %>% 
  ggplot(aes(x = reorder(beneficio, n_total),  y = saliencia, fill = Frequência))+
  geom_bar(stat = "identity", position = "stack")+
  coord_flip() +
  theme_minimal()+
  labs(y="Índice de Saliência", x= "Benefícios",
       title = "Gráfico do Índice de Saliência dos Benefícios")+
  theme(plot.title = element_text(hjust = 0.5),
        text=element_text(size=12,  family="Times New Roman"))+
  scale_fill_distiller(palette = "Paired")
  Paired
  
  
  
 

#GRAFICO QUE DEU MAIS CERTO
ameacas %>%
  ggplot(aes(risco, indice))+
  geom_col(colour="black", fill= "white") +
  coord_flip() +
  theme_minimal()+
  labs(X ="Ameaças", Y= "Índice de Saliência", 
       title = "Gráfico da Saliência das Ameaças Percebidas")+
  scale_y_discrete(breaks = seq(0, 1.0,by = 0.2))

  
 
