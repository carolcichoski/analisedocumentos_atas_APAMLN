library(readr)
library(tidyverse)


ameacas_ponto <-
  read_delim(
    "saliencia/ameacas_ponto.csv",
    ";",
    escape_double = FALSE,
    locale = locale(encoding = "ISO-8859-1"),
    trim_ws = TRUE
  )
View(ameacas_ponto)

ameacas_ponto <- data.frame(
  stringsAsFactors = FALSE,
  risco = c(
    "Esgoto",
    "Lixo",
    "Crescimento urbano",
    "Circulação de embarcação",
    "Atividade portuária",
    "Mudanças climáticas",
    "Pesca predatória",
    "Turismo",
    "Atividade petrolífera"
  ),
  indice = c(0.626, 0.204, 0.156, 0.153, 0.177, 0.108, 0.108, 0.048, 0.094),
  Frequência = c(64.5, 32.3, 29, 29, 25.8, 16.1, 12.9, 12.9, 12.9)
)


ameacas_ponto %>%
  group_by(risco) %>%
  mutate(n_total = sum(indice)) %>%
  ggplot(aes(
    x = reorder(risco,-n_total),
    y = indice,
    fill = Frequência
  )) +
  geom_bar(stat = "identity", position = "stack") +
  coord_flip() +
  theme_minimal() +
  labs(y = "Índice de Saliência", x = "Ameaças",
       title = "Índice de Saliência e frequência das Ameaças") +
  theme(plot.title = element_text(hjust = 0.5)) +
  scale_fill_distiller(palette = "Paired"#,
                       # , guide = "legend"
                       ) 

+
  ggsave(
    "graficos_defesa/grafico_ameacas_ultimatent.jpg",
    dpi = 600,
    height = 6,
    width = 10
  )

