library(tidyverse)

dados <- 
  data.frame(
    grp = c(rep("Serviço de Provisão", 8), 
            rep("Serviço Cultural", 8),
            rep("Serviço de Regulação", 12)),
    subgrp = c(rep("Provisão de \n alimento", 4), 
               rep("Patrimônio \n Cultural", 4),
               rep("Lazer e \n Recreação", 4),
               rep("Beleza \n Cênica", 4),
               rep("Regulação \n Climática", 4),
               rep("Depuração \n de Efluentes", 4),
               rep("Prevenção de \n inundações \n e enchentes", 4)),
    itens = factor(rep(c("Econômica", "Sociocultural", 
                         "Ambiental Ecológica", "Não soube"), 7), 
                   levels = c("Econômica", "Sociocultural",                                        "Ambiental Ecológica", "Não soube")),
    valor = c(0.699, 0.796, 0.505, 0, 
              0.645, 0.839, 0.387, 0.065, 
              0.871, 0.742, 0.387, 0,
              0.611, 0.844, 0.544, 0,
              0.591, 0.629, 0.731, 0,
              0.554, 0.618, 0.739, 0,
              0.634, 0.710, 0.559, 0.032))


#g1 <- 
dados %>% 
  ggplot(aes(x= interaction(subgrp, grp), y= valor, fill= itens)) +
  geom_bar(stat = "identity", position = position_dodge(), 
           color="white", size=1.5) +
  labs(title = "Avaliação da Importância dos Benefícios e SE")+ 
       #subtitle = "se houver texto para subtítulo",
       #caption = "Fonte: XXXX") +
  theme_bw() +
  theme( 
    plot.title = element_text(face ="bold", hjust=0.5),
    legend.direction = "horizontal",
    legend.title = element_blank(),
    legend.position = c(0.5, -0.25),
    plot.margin = margin(0.5, 0.75, 4, 0.5, unit = "cm"),
    axis.title = element_blank(),
    axis.text.x = element_blank(),
    axis.ticks.x = element_blank(),
    panel.grid.major.x = element_blank(),
    panel.grid.minor.x = element_blank()
    )+
  scale_fill_manual(values=c("#7cb5ec", "#8d8dbf", "#88b19f",
                             "#e6d26e"))+ # cores das barras
  coord_cartesian(ylim = c(0, 1), clip = "off") + #expand = FALSE
  annotate("text", x = 1:length(unique(dados$subgrp)), y = -0.12,
           label = unique(dados$subgrp)) +
  annotate("text", c(1.5, 3.5, 6), y = -0.22, 
           label = unique(dados$grp), size = 4.75)+
  scale_y_continuous(labels = scales::comma_format(big.mark = ".",
                                                 decimal.mark = ",",
                                                 accuracy = 0.01))+
  annotate("segment", x = 2.5, xend = 2.5, y = -0.05, yend = -0.25,
           color = "grey60")+
  annotate("segment", x = 4.5, xend = 4.5, y = -0.05, yend = -0.25,
           color = "grey60")

# library(grid)
# # remove clipping of x axis labels
# g2 <- ggplot_gtable(ggplot_build(g1))
# g2$layout$clip[g2$layout$name == "panel"] <- "off"
# grid.draw(g2)
