library(readr)
library(tidyverse)

noticias_clima <- read_delim("noticias/noticias_clima.csv", 
                             ";", escape_double = FALSE, locale = locale(encoding = "ISO-8859-1"), 
                             trim_ws = TRUE)
View(noticias_clima)

noticias_clima %>%
  group_by(ameacas) %>%
  mutate(n_total = sum(quantidade)) %>%
  ggplot(aes(x = ano,  y = quantidade, fill = ameacas)) +
  geom_bar(stat = "identity", position = "stack", fill = "#969696") +
  theme_minimal() +
  labs(y = "Número de Noticías", x = "Ano",
       title = "Noticías citando Mudanças Climáticas - Jan/2015 a Mai/2019") +
  theme(plot.title = element_text(hjust = 0.5)) +
  scale_y_continuous(breaks = seq(0, 15, by = 1))

+
  ggsave(
    "graficos_defesa/grafico_noticias_mudancas_climaticas.jpg",
    dpi = 600,
    height = 6,
    width = 10
  )

