library(plotly)
library(readr)
library(tidyverse)
library(readr)


enquadramento <- read_delim("noticias/enquadramento.csv", 
                            ";", escape_double = FALSE, locale = locale(encoding = "ISO-8859-1"), 
                            trim_ws = TRUE)
View(enquadramento)

#grafico
enquadramento %>% 
  group_by(enquadramento) %>% 
  mutate(n_total = sum(quantidade)) %>% 
  ggplot(aes(x = reorder(enquadramento, -n_total),  y = quantidade, fill = ano)) +
  geom_bar(stat = "identity", position = "stack")+
  coord_flip() +
  theme_minimal()+
  labs(y="Número de notícias", x= "Categorias de enquadramento", 
       title = "Enquadramento das notícias sobre Mudanças Climáticas")+
  theme(plot.title = element_text(hjust = 0.5),
        text=element_text(size=12,  family= "Times New Roman"))+
  scale_fill_distiller(palette = "Paired")+
  scale_y_continuous(breaks = seq(0, 12,by = 2))+
  ggsave("Grafico_enquadramento_noticia_paired.png", dpi = 600,   width = 8, height = 5)





plotly::ggplotly(p)