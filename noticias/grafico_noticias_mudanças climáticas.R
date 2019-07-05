library(plotly)
library(readr)
library(tidyverse)
library(readr)
noticias_clima <- read_delim("noticias/noticias_clima.csv", 
                             ";", escape_double = FALSE, locale = locale(encoding = "ISO-8859-1"), 
                             trim_ws = TRUE)
View(noticias_clima)


p <- noticias_clima %>% 
  group_by(ameacas) %>% 
  mutate(n_total = sum(quantidade)) %>% 
  ggplot(aes(x = reorder(ameacas, -n_total),  y = quantidade, fill = ano)) +
  geom_bar(stat = "identity", position = "stack")+
  coord_flip() +
  theme_minimal()+
  labs(y="Número de Noticías", x= "Ameaça", 
       title = "Noticías citando Mudanças Climáticas - Jan/2015 a Mai/2019")+
  theme(plot.title = element_text(hjust = 0.5),
        text=element_text(size=12,  family="Times New Roman"))+
  scale_fill_distiller(palette = "Paired")+
  scale_y_continuous(breaks = seq(0, 31,by = 5))


by = 5


plotly::ggplotly(p)
