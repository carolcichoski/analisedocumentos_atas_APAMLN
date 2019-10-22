library(readr)
library(tidyverse)

beneficios_ponto <-
  read_delim(
    #"~/GitHub/analisedocumentos_atas_APAMLN/saliencia/beneficios_ponto.csv",
    "saliencia/beneficios_ponto.csv",
    ";",
    escape_double = FALSE,
    locale = locale(encoding = "ISO-8859-1"),
    trim_ws = TRUE
  )

#grafico com frequencia

beneficios_ponto %>%
  group_by(beneficio) %>%
  mutate(n_total = sum(saliencia)) %>%
  ggplot(aes(
    x = reorder(beneficio, -n_total),
    y = saliencia,
    fill = Frequência
  )) +
  geom_bar(stat = "identity", position = "stack") +
  coord_flip() +
  theme_minimal() +
  labs(y = "Índice de Saliência", x = "Benefícios",
       title = "Índice de Saliência e frequência dos Benefícios") +
  theme(
    plot.title = element_text(hjust = 0.5),
    text = element_text(size = 12,  family = "Times New Roman")
  ) +
  scale_fill_distiller(palette = "Paired", guide = "legend") +
  ggsave(
    "graficos_defesa/grafico_beneficios_ponto.jpg",
    dpi = 600,
    height = 8,
    width = 12
  )
