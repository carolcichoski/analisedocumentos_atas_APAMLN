library(ggplot2)
library(readr)
ameacas <- read_delim("saliencia/ameacas.csv", 
                      ";", escape_double = FALSE, locale = locale(encoding = "ISO-8859-1"), 
                      trim_ws = TRUE)
View(ameacas)
#ameacas <- ameacas [order(ameacas$Saliencia)]


ameacas %>%
  group_by(Riscos) %>% 
  mutate(n_total = sum(Saliencia)) %>% 
  ggplot(aes(x = reorder(Riscos, -n_total),  y = Saliencia))+
  geom_col(colour="black", fill= "white") +
  coord_flip() +
  theme_minimal()+
  labs(y="Índice de Saliência", x= "Ameaças", 
       title = "Gráfico da Saliência das Ameaças Percebidas")+
    theme(plot.title = element_text(hjust = 0.5),
        text=element_text(size=12,  family="Times New Roman"))+
  #scale_fill_distiller(palette = "Paired")+
  scale_x_discrete()
                     


ameacas %>%
  slice(1:20) %>% 
  mutate(Riscos = n/sum(n)) %>%
  mutate(Saliencia = reorder(Saliencia, Riscos)) %>%
  ggplot(aes(x = Saliencia, y = Riscos, fill = Saliencia)) +
  geom_bar(stat = 'identity', width = 0.95) + 
  coord_flip() + 
  scale_x_discrete() +
  xlab("Share of total chords") +
  ylab("Chord")
                     
