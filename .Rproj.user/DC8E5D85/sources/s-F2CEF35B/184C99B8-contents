library(plotly)
library(readr)
library(tidyverse)
noticias <- read_delim("noticias/noticias.csv", 
                       ";", escape_double = FALSE, locale = locale(encoding = "ISO-8859-1"), 
                       trim_ws = TRUE)
View(noticias)


p <- noticias %>% 
   group_by(ameacas) %>% 
    mutate(n_total = sum(quantidade)) %>% 
  ggplot(aes(x = reorder(ameacas, -n_total),  y = quantidade, fill = ano)) +
  geom_bar(stat = "identity", position = "stack")+
coord_flip() +
  theme_minimal()+
  labs(y="Frequência das palavras", x= "Palavras", 
       title = "Notícias citando Ameaças - Jan/2015 a Mai/2019")+
  theme(plot.title = element_text(hjust = 0.5),
        text=element_text(size=12,  family="Times New Roman"))+ scale_fill_distiller(palette = "Dark2")


plotly::ggplotly(p)
