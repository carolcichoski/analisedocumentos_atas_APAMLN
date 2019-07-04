library(tidyverse)
library(readr)
#install.packages("gridExtra")
library(gridExtra)
library(extrafont)
font_import()
loadfonts(device = "win")




top15_2009 <- read_delim("palavras/top15_2009.csv", 
                         ";", escape_double = FALSE, col_types = cols(X1 = col_skip()), 
                         locale = locale(encoding = "ISO-8859-1"), 
                         trim_ws = TRUE) %>% 
              top_n(15) %>%
  mutate(word = reorder(word, n)) %>% 
              # arrange(desc(n)) %>% 
              ggplot(aes(word, n))+
              geom_col(colour="black", fill= "white") +
              xlab(NULL) +
              coord_flip() +
              theme_minimal()+
              labs(y="Frequência de palavras", x= "Palavras", 
                   title = "2009")+
              theme(plot.title = element_text(hjust = 0.5),
                    text=element_text(size=12,  family="Times New Roman"))


top15_2010 <- read_delim("palavras/top15_2010.csv", 
                         ";", escape_double = FALSE, col_types = cols(X1 = col_skip()), 
                         locale = locale(encoding = "ISO-8859-1"), 
                         trim_ws = TRUE) %>% 
  top_n(15) %>%
  mutate(word = reorder(word, n)) %>% 
  # arrange(desc(n)) %>% 
  ggplot(aes(word, n))+
  geom_col(colour="black", fill= "white") +
  xlab(NULL) +
  coord_flip() +
  theme_minimal()+
  labs(y="Frequência de palavras",
       #x= "Palavras", 
       title = "2010")+
  theme(plot.title = element_text(hjust = 0.5),
        text=element_text(size=12,  family="Times New Roman"))


top15_2011 <- read_delim("palavras/top15_2011.csv", 
                         ";", escape_double = FALSE, col_types = cols(X1 = col_skip()), 
                         locale = locale(encoding = "ISO-8859-1"), 
                         trim_ws = TRUE) %>% 
  top_n(15) %>%
  # arrange(desc(n)) %>% 
  mutate(word = reorder(word, n)) %>% 
  ggplot(aes(word, n))+
  geom_col(colour="black", fill= "white") +
  xlab(NULL) +
  coord_flip() +
  theme_minimal()+
  labs(y="Frequência de palavras", x= "Palavras", 
       title = "2011")+
  theme(plot.title = element_text(hjust = 0.5),
        text=element_text(size=12,  family="Times New Roman"))


top15_2012 <- read_delim("palavras/top15_2012.csv", 
                         ";", escape_double = FALSE, col_types = cols(X1 = col_skip()), 
                         locale = locale(encoding = "ISO-8859-1"), 
                         trim_ws = TRUE) %>% 
  top_n(15) %>%
  # arrange(desc(n)) %>% 
  mutate(word = reorder(word, n)) %>% 
  ggplot(aes(word, n))+
  geom_col(colour="black", fill= "white") +
  xlab(NULL) +
  coord_flip() +
  theme_minimal()+
  labs(y="Frequência de palavras", x= "Palavras", 
       title = "2012")+
  theme(plot.title = element_text(hjust = 0.5),
        text=element_text(size=12,  family="Times New Roman"))


top15_2013 <- read_delim("palavras/top15_2013.csv", 
                         ";", escape_double = FALSE, col_types = cols(X1 = col_skip()), 
                         locale = locale(encoding = "ISO-8859-1"), 
                         trim_ws = TRUE) %>% 
  top_n(15) %>%
  # arrange(desc(n)) %>% 
  mutate(word = reorder(word, n)) %>% 
  ggplot(aes(word, n))+
  geom_col(colour="black", fill= "white") +
  xlab(NULL) +
  coord_flip() +
  theme_minimal()+
  labs(y="Frequência de palavras", x= "Palavras", 
       title = "2013")+
  theme(plot.title = element_text(hjust = 0.5),
        text=element_text(size=12,  family="Times New Roman"))


top15_2014 <- read_delim("palavras/top15_2014.csv", 
                         ";", escape_double = FALSE, col_types = cols(X1 = col_skip()), 
                         locale = locale(encoding = "ISO-8859-1"), 
                         trim_ws = TRUE)%>% 
  top_n(15) %>%
  # arrange(desc(n)) %>% 
  mutate(word = reorder(word, n)) %>% 
  ggplot(aes(word, n))+
  geom_col(colour="black", fill= "white") +
  xlab(NULL) +
  coord_flip() +
  theme_minimal()+
  labs(y="Frequência de palavras", x= "Palavras", 
       title = "2014")+
  theme(plot.title = element_text(hjust = 0.5),
        text=element_text(size=12,  family="Times New Roman"))


top15_2015 <- read_delim("palavras/top15_2015.csv", 
                         ";", escape_double = FALSE, col_types = cols(X1 = col_skip()), 
                         locale = locale(encoding = "ISO-8859-1"), 
                         trim_ws = TRUE) %>% 
  top_n(15) %>%
  # arrange(desc(n)) %>% 
  mutate(word = reorder(word, n)) %>% 
  ggplot(aes(word, n))+
  geom_col(colour="black", fill= "white") +
  xlab(NULL) +
  coord_flip() +
  theme_minimal()+
  labs(y="Frequência de palavras", x= "Palavras", 
       title = "2015")+
  theme(plot.title = element_text(hjust = 0.5),
        text=element_text(size=12,  family="Times New Roman"))


top15_2016 <- read_delim("palavras/top15_2016.csv", 
                         ";", escape_double = FALSE, col_types = cols(X1 = col_skip()), 
                         locale = locale(encoding = "ISO-8859-1"), 
                         trim_ws = TRUE) %>% 
  top_n(15) %>%
  # arrange(desc(n)) %>% 
  mutate(word = reorder(word, n)) %>% 
  ggplot(aes(word, n))+
  geom_col(colour="black", fill= "white") +
  xlab(NULL) +
  coord_flip() +
  theme_minimal()+
  labs(y="Frequência de palavras", x= "Palavras", 
       title = "2016")+
  theme(plot.title = element_text(hjust = 0.5),
        text=element_text(size=12,  family="Times New Roman"))


top15_2017 <- read_delim("palavras/top15_2017.csv", 
                         ";", escape_double = FALSE, col_types = cols(X1 = col_skip()), 
                         locale = locale(encoding = "ISO-8859-1"), 
                         trim_ws = TRUE) %>% 
  top_n(15) %>%
  # arrange(desc(n)) %>%
  mutate(word = reorder(word, n)) %>% 
  ggplot(aes(word, n))+
  geom_col(colour="black", fill= "white") +
  xlab(NULL) +
  coord_flip() +
  theme_minimal()+
  labs(y="Frequência de palavras", x= "Palavras", 
       title = "2017")+
  theme(plot.title = element_text(hjust = 0.5),
        text=element_text(size=12,  family="Times New Roman"))

top15_2018 <- read_delim("palavras/top15_2018.csv", 
                         ";", escape_double = FALSE, col_types = cols(X1 = col_skip()), 
                         locale = locale(encoding = "ISO-8859-1"), 
                         trim_ws = TRUE) %>% 
  top_n(15) %>%
  # arrange(desc(n)) %>%
  mutate(word = reorder(word, n)) %>% 
  ggplot(aes(word, n))+
  geom_col(colour="black", fill= "white") +
  xlab(NULL) +
  coord_flip() +
  theme_minimal()+
  labs(y="Frequência de palavras", x= "Palavras", 
       title = "2018")+
  theme(plot.title = element_text(hjust = 0.5),
        text=element_text(size=12,  family="Times New Roman"))

# ---- salvar 3 colunas

top15_todos_3col <- grid.arrange(top15_2009,top15_2010,
             top15_2011,top15_2012,
             top15_2013,top15_2014,
             top15_2015,top15_2016,
             top15_2017,
             top15_2018,
             ncol=3)

ggsave("graficos/frequencia_todos_3_col.png", top15_todos_3col, dpi = 600, height = 10, width = 12)



# ---- salvar 2 colunas

top15_todos_2col <- grid.arrange(top15_2009,top15_2010,
                            top15_2011,top15_2012,
                            top15_2013,top15_2014,
                            top15_2015,top15_2016,
                            top15_2017,
                            top15_2018,
                            ncol=2)

ggsave("graficos/frequencia_todos_2_col.png", top15_todos_2col, dpi = 600, height = 14, width = 8)

