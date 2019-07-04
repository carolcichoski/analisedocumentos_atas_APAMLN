library(ggplot2)
library(readr)
ameacas <- read_delim("saliencia/ameacas.csv", 
                      ";", escape_double = FALSE, locale = locale(encoding = "ISO-8859-1"), 
                      trim_ws = TRUE)
View(ameacas)
#ameacas <- ameacas [order(ameacas$Saliencia)]

#tentativa nova
ameacas %>%
  group_by(risco) %>% 
  mutate(n_total = sum(indice)) %>% 
  ggplot(aes(x = reorder(risco, n_total),  y = indice))+ 
  geom_col(colour="black", fill= "white") +
  xlab(NULL) +
  coord_flip() +
  theme_minimal()+
  labs(y="Frequência de palavras", x= "Palavras", 
       title = "")+
  theme(plot.title = element_text(hjust = 0.5),
        text=element_text(size=12,  family="Times New Roman"))



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
#tentativa não deu certo
ameacas %>%
  group_by(risco) %>% 
  mutate(n_total = sum(indice)) %>% 
  ggplot(aes(y = reorder(risco, n_total),  x = indice))+
  geom_col(colour="black", fill= "white") +
  coord_flip() +
  scale_x_discrete()
  theme_minimal()+
  labs(y="Índice de Saliência", x= "Ameaças", 
       title = "Gráfico da Saliência das Ameaças Percebidas")+
    theme(plot.title = element_text(hjust = 0.5),
        text=element_text(size=12,  family="Times New Roman"))+
  #scale_fill_distiller(palette = "Paired")+
  scale_x_discrete()
                     

 ameacas %>% 
   group_by(risco, indice) %>% 
   ggplot(aes(y = reorder(risco, n_total),  x = indice))
   ggplot (ameacas , aes ( risco , indice)) +
    geom_col (colour="black", fill= "white")+
    coord_flip()+
    scale_x_discrete()
                     
