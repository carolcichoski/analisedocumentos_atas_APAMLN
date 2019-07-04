

library(readr)
beneficios <- read_delim("saliencia/beneficios.csv", 
                         ";", escape_double = FALSE, locale = locale(encoding = "ISO-8859-1"), 
                         trim_ws = TRUE)
View(beneficios)

#fazendo gráfico

beneficios %>%
  ggplot(aes(Benefício, Saliência))+
  geom_col(colour="black", fill= "white") +
  coord_flip() +
  theme_minimal()+
  labs(y="Índice de Saliência", x= "Benefícios", 
       title = "Gráfico da Saliência dos Benefícios Percebidos")+
  theme(plot.title = element_text(hjust = 0.5),
        text=element_text(size=12,  family="Times New Roman"))



#Grafico das ameaças
read.csv("~/ameacas.txt", sep="\t", fileEncoding = "UTF8") %>% 
  ggplot() +
  geom_col(aes (ameacas, Salience)) +
  coord_flip()


