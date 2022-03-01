# Solução Lista de Exercícios - Capítulo 5

# Obs: Caso tenha problemas com a acentuação, consulte este link:
# https://support.rstudio.com/hc/en-us/articles/200532197-Character-Encoding

# Configurando o diretório de trabalho
# Coloque entre aspas o diretório de trabalho que você está usando no seu computador
# Não use diretórios com espaço no nome
setwd("C:\\FCD\\BigDataRAzure\\Cap05")
getwd()


# Exercicio 1 - Encontre e faça a correção do erro na instrução abaixo:
?write.table
View(mtcars)
write.table(mtcars, file = "mtcars2.txt", sep = "|", col.name = NA, 
            qmethod = "double")


# Exercicio 2 - Encontre e faça a correção do erro na instrução abaixo:
library(readr)
?read_csv
df_iris <- read_csv("iris.csv", col_types = list(
  Sepal.Length = col_double(),
  Sepal.Width = col_double(),
  Petal.Length = col_double(),
  Petal.Width = col_double(),
  Species = col_factor(c("setosa", "versicolor", "virginica"))
))


# Exercício 3 - Abaixo você encontra dois histogramas criados separadamente.
# Mas isso dificulta a comparação das distribuições. Crie um novo plot que faça a união 
# de ambos histogramas em apenas uma área de plotagem.

# Dados aleatórios
dataset1=rnorm(4000 , 100 , 30)     
dataset2=rnorm(4000 , 200 , 30) 

# Histogramas
par(mfrow=c(1,2))
hist(dataset1, breaks=30 , xlim=c(0,300) , col=rgb(1,0,0,0.5) , xlab="Altura" , ylab="Peso" , main="" )
hist(dataset2, breaks=30 , xlim=c(0,300) , col=rgb(0,0,1,0.5) , xlab="Altura" , ylab="Peso" , main="", add=T)



# Exercício 4 - Encontre e corrija o erro no gráfico abaixo
install.packages("plotly")
library(plotly)
head(iris)

?plot_ly

plot_ly(iris, 
        x = ~Petal.Length, 
        y = ~Petal.Width,  
        type="scatter", 
        mode = "markers", 
        color = ~Species, marker=list(size=20 , opacity=0.5))


# Exercício 5 - Em anexo você encontra o arquivo exercicio5.png. Crie o gráfico 
# que resulta nesta imagem.
library(plotly)
head(volcano)

p = plot_ly(z = volcano, type = "surface")
p


# Exercício 6 - Carregue o arquivo input.json anexo a este script e imprima o 
# conteúdo no console 
# Dica: Use o pacote rjson
install.packages("rjson")
library(rjson)

result <- fromJSON(file = "D:\\ProjetosDev\\treinamento_r_azure_machine_learning\\dbs\\Cap05_Files\\input.json")
print(result)


# Exercício 7 - Converta o objeto criado ao carregar o arquivo json do exercício anterior 
# em um dataframe e imprima o conteúdo no console.
df <- data.frame(result)
df
class(df)


# Exercício 8 - Carregue o arquivo input.xml anexo a este script.
# Dica: Use o pacote XML
install.packages("XML")
library(XML)
library(methods)
?xml
result_xml <- xmlParse(file = "D:\\ProjetosDev\\treinamento_r_azure_machine_learning\\dbs\\Cap05_Files\\input.xml")
print(result_xml)


# Exercício 9 - Converta o objeto criado no exercício anterior em um dataframe
df_xml <- xmlToDataFrame(result_xml)
print(df_xml)


# Exercício 10 - Carregue o arquivo input.csv em anexo e então responda às
# seguintes perguntas:

input <- read.csv("D:\\ProjetosDev\\treinamento_r_azure_machine_learning\\dbs\\Cap05_Files\\input.csv")
View(input)
class(input)

# Pergunta 1 - Quantas linhas e quantas colunas tem o objeto resultante em R?
print(nrow(input))
print(ncol(input))
# R: 8 Linhas e 5 COlunas

# Pergunta 2 - Qual o maior salário?
print(max(input$salary))

# Pergunta 3 - Imprima no console o registro da pessoa com o maior salário.
maior_salario <- subset(input, salary == max(salary))
print(maior_salario)


# Pergunta 4 - Imprima no console todas as pessoas que trabalham no departamento de IT.
pessoas_it = subset(input, dept == "IT")
print(pessoas_it)
# Pergunta 5 - Imprima no console as pessoas do departamento de IT com salário superior a 600.

pessoas_it_salario = subset(input, dept == "IT" & salary > 600)
print(pessoas_it_salario)
