library(plotly)
library(readr)
library(tidyverse)

importancia_servicos <- read_delim("~/GitHub/analisedocumentos_atas_APAMLN/saliencia/importancia_servicos.csv", 
                                   ";", escape_double = FALSE, locale = locale(decimal_mark = ",", 
                                                                               encoding = "ISO-8859-1"), trim_ws = TRUE)
View(importancia_servicos)


#Grafico com a categoria
importancia_servicos %>%
group_by(se) %>% 
  mutate(n_total = sum(is)) %>% 
  ggplot(aes(x = reorder(se, n_total),  y = is, fill = importancia))+
  geom_bar(stat = "identity", position = "stack")+
  #coord_flip() +
  theme_minimal()+
  labs(y="Índice de Saliência", x= "Ameaças",
       title = "Gráfico do Índice de Saliência das Ameaças")+
  theme(plot.title = element_text(hjust = 0.5),
        text=element_text(size=12,  family="Times New Roman"))+
  scale_fill_distiller(palette = "Paired")
       
 #para salvar 
    ggsave("importancia_beneficios.png", dpi = 600,   width = 8, height = 5)
   

  
  
  
  
  