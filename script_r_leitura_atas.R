# carregando pacotes
library(readtext)
library(magrittr)
library(stringr)
library(tm)
library(dplyr)
library(tidytext)
library(ggplot2)
library(wordcloud2)
library(webshot)
library(htmlwidgets)

# função para gerar gráficos, tabelas e nuvem de palavras
gera_graficos <- function(ano) { # ano <- ANO
  
# lendo o caminho do R
getwd()

# redirecionando para outro caminho
# setwd(paste0(getwd(), "/atas"))

# lendo as pastas dos anos selecionados no endereço atas e salvando em pastas_txt
pastas_txt <- dir(path="dados/atas") %>% grep(ano, ., value = T)


# lendo todos arquivos atas txt existentes nas pastas/anos selecionados
tds_atas <- readtext(paste0("dados/atas/", pastas_txt[1:length(pastas_txt)]))

# Padronizar a codificação de caracteres para UTF-8:
# tds_atas <- iconv(tds_atas, from="windows-1252", to="UTF-8")




# Limpando pontuações, números, etc...
tds_atas_limpas <- tds_atas %>%
  paste(., collapse = " ") %>%
  removeNumbers() %>%   
  removePunctuation() %>%
  str_remove_all("\r") %>%    
  str_remove_all("\n") %>%   
  str_to_lower() %>%   
  stripWhitespace()


# Transformar em dataframe
atas_df <- data_frame(id_discurso = 1:length(tds_atas_limpas), 
                      text = tds_atas_limpas)  

# data frame com uma palavra por linha
atas_df2 <- atas_df %>%
  unnest_tokens(word, text)


# Conjunto de palavras a serem limpas/ retiradas das atas:
stopwords_pt <- data.frame(word = c(stopwords("pt"), "que", "porque", "vai",
                  "aqui", "sobre", "assim", "etc","pois", "desse", "ainda", 
                  "então", "gente", "ser", "de", "lá", "acho", "ter", "sim", 
                  "coisa", "fazer", "litoral","centro", "norte", 
                  "reunião", "apa", "marinha", "plano", "gt", "rua", 
                  "diz", "ff", "é", "º", "atas", "cg", "falou",
                  "apresentação", "dia", "sugere", "todos",
                  "deve", "propôs", "r", "ata",
                  "conselho", "projeto", "área", "pergunta", 
                  "conselheiros", "disse", "ln", "sendo", "grupo",
                  "reuniões",  "apmln", "próximo", "documento",
                  "comentou", "representantes",  "explicou", "perguntou",
                  "sendo", "b", "apalmnairess", "pm", "ressaltou",
                  "existe",  "cita", "n", "grande", "apamln", "horas",
                  "apamlnariess", "informativo", "importante",
                  "questão", "devido",
                  #bia colocando algumas
                  "cada", "comenta", "quais", "pode", "quanto", 
                  "exemplo", "sugeriu", "respondeu",
                  "informou", "passou", "desta","todas", "onde",
                  "h", "z"), stringsAsFactors = F)



# Limpando as atas e exportando as 15 palavras mais citadas em um arquivo csv
atas_df3 <- atas_df2 %>%
  anti_join(stopwords_pt, by = "word") %>% 
  mutate(word = str_to_title(word)) %>% 
  count(word, sort = TRUE) %>%
  #top_n(15) %>% 
  mutate(word = reorder(word, n))

atas_df3$word <- atas_df3$word %>%  
        str_replace_all("Zee", "ZEE") %>% 
       str_replace_all("Tdr", "TDR") %>% 
      str_replace_all("Ct", "CT") %>% 
      str_replace_all("Apaln", "APA-LN") %>% 
  str_replace_all("Apamln", "APAM-LN") %>% 
  str_replace_all("Eia", "EIA") %>% 
  str_replace_all("Ucs", "UCS") %>% 
  str_replace_all("Presal", "Pré-Sal") %>% 
  str_replace_all("Présal", "Pré-Sal")%>% 
  str_replace_all("Dt", "DT")

atas_df3 <- atas_df3 %>%    mutate(word = reorder(word, n))


ano2 <- ifelse(str_count(ano) > 4, paste0(str_sub(ano, end = 4), "_", str_sub(ano, start = -4)), ano)

atas_df3 %>% 
  write.csv2(file = paste0("./palavras/top15_", ano2, ".csv"))


# Criar um gráfico de frequência de palavras:
atas_df3 %>%
  top_n(15) %>% 
  ggplot(aes(word, n))+
  geom_col(colour="black", fill= "white") +
  xlab(NULL) +

  coord_flip() +
  theme_minimal()+
  labs(y="Frequência das palavras", x= "Palavras", 
       title = paste0("Gráfico de frequência de Palavras Atas ", ano))+
    theme(plot.title = element_text(hjust = 0.5),
        text=element_text(size=12,  family="Times New Roman"))+


ggsave(paste0("./graficos/frequencia_", ano2, ".png"), dpi = 300, width = 5, height = 3)


# Fazendo nuvem de palavras
nuvem_ano <- atas_df2 %>%
  anti_join(stopwords_pt, by = "word") %>% 
  mutate(word = str_to_title(word)) %>% 
  count(word, sort = T) %>% 
  #filter(n > 20) %>% 
  top_n(200)

# Criar a nuvem de palavras
wordcloud_ano <- wordcloud2(nuvem_ano, size=.5, color="random-dark", shuffle = FALSE, shape="circle")
# Salvar em HTML
saveWidget(wordcloud_ano, paste0("nuvem", ano2, ".html"), selfcontained = F)
# Salvar em PNG
webshot(paste0("nuvem", ano2, ".html"), paste0("wordcloud/nuvem_", ano2, ".png"), delay = 10)

}



##########################################################
# digite aqui os anos em que deseja ler os dados das atas
ANO <- "2009" # glue::glue_collapse(2009:2018, sep="|") 
##########################################################

gera_graficos(ANO)
gera_graficos("2010")
#gerar nuvem de todos os anos juntos
gera_graficos(glue::glue_collapse(2009:2018, sep="|"))

#gera grafico de todos os anos - ano a ano
for(i in 2009:2018){
  gera_graficos(as.character(i))
}
