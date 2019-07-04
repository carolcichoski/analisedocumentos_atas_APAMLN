library(rvest)
library(dplyr)
#install.packages("dplyr")
library(read_html)

url_p1 <- 'https://www.tamoiosnews.com.br/page/'
url_p2 <- 'porto+de+São+Sebastião'

ulrs_noticias <- c()
for (i in 1:11) {
  print(i)
  links <- paste0(url_p1, i, url_p2) %>%
    read_html() %>%
    html_nodes(xpath = '//article//a') %>%
    html_attr(name = 'href')
    
  ulrs_noticias <- c(ulrs_noticias, links)
  
}

ulrs_noticias <- unique(ulrs_noticias)

dados <- NULL
for (link in ulrs_noticias){
  print(link)
  pagina <- link %>%
    read_html()
  
  titulo <- pagina %>%
    html_nodes(xpath = '//h1[@class="entry-title"]') %>%
    html_text()
  
  if(length(titulo) != 0){
    
    data_hora <- pagina %>%
      html_nodes(xpath = '//div[@class="meta-item date"]//span') %>%
      html_text()
    
    texto <- pagina %>%
      html_nodes(xpath = '//div[@class="entry-content"]//p') %>%
      html_text()
    texto <- paste(texto, collapse = ' ')
    
    dados <- rbind(dados, data.frame(titulo, data_hora, texto, link))
    
  } 
  
}


#2015 <- dados %>% filter(data_hora == "2015")
 


write.csv2(dados, "tamoiosnews_lixo_final2.csv", fileEncoding = "Latin1", row.names = F)
