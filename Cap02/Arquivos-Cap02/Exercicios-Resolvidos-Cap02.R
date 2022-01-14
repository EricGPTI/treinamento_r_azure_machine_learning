# Lista de Exercícios - Capítulo 2

# Obs: Caso tenha problemas com a acentuação, consulte este link:
# https://support.rstudio.com/hc/en-us/articles/200532197-Character-Encoding

# Configurando o diretÃ³rio de trabalho
# Coloque entre aspas o diretÃ³rio de trabalho que vocÃª estÃ¡ usando no seu computador
# NÃ£o use diretÃ³rios com espaÃ§o no nome
setwd("C:/FCD/BigDataRAzure/Cap02")
getwd()

# Exercício 1 - Crie um vetor com 30 números inteiros
vet <- c(1:30)
vet


# ExercÃ­cio 2 - Crie uma matriz com 4 linhas e 4 colunas preenchida com números inteiros
mat <- matrix(c(1:16), nrow = 4, ncol = 4)
mat



# ExercÃ­cio 3 - Crie uma lista unindo o vetor e matriz criados anteriormente
list <- c(vet, mat)
list


# Exercício 4 - Usando a função read.table() leia o arquivo do link abaixo para uma dataframe
# http://data.princeton.edu/wws509/datasets/effort.dat
table = read.table("http://data.princeton.edu/wws509/datasets/effort.dat")
table
class(table)

# Correção 
df <- data.frame(read.table("http://data.princeton.edu/wws509/datasets/effort.dat"))
class(df)
df


# Exercício 5 - Transforme o dataframe anterior, em um dataframe nomeado com os seguintes labels:
# c("config", "esfc", "chang")
label = c("config", "esfc", "chang")
df <- c(table, colnames(label))
df

# Correção: Esta correção deve ser rodada a partir da correção anterior para ter
# O efeito desejado.
names(df) = c("config", "esfc", "chang")
df


# Exercício 6 - Imprima na tela o dataframe iris, verifique quantas dimensões existem no dataframe iris e imprima um resumo do dataset
iris
View(iris)
summary(iris)

# Correção
iris
class(iris)
dim(iris)
summary(iris)
str(iris)
View(iris)


# Exercício 7 - Crie um plot simples usando as duas primeiras colunas do dataframe iris
plot(iris$Sepal.Length, iris$Sepal.Width)



# Exercício 8 - Usando a função subset, crie um novo dataframe com o conjunto de dados do dataframe iris em que Sepal.Length > 7
# Dica: consulte o help para aprender como usar a função subset()
?subset()
iris1 <- subset(iris, Sepal.Length > 7)
iris1

# Exercício 9 (Desafio) - Crie um dataframe que seja cópia do dataframe iris e usando a função slice(), divida o dataframe em um subset de 15 linhas
# Dica 1: Você vai ter que instalar e carregar o pacote dplyr
# Dica 2: Consulte o help para aprender como usar a funÃ§Ã£o slice()
#install.packages("dplyr")
library(dplyr)
?help()
help(package = dplyr)

iris_subset <- slice(iris, 1:15) 
iris_subset
class(iris_subset)

# Exercícios 10 - Use a função filter no seu novo dataframe criado no item anterior e retorne apenas valores em que Sepal.Length > 6
# Dica: Use o RSiteSearch para aprender como usar a função filter
iris %>% filter(Sepal.Length > 7)
?filter()

# Correção
novo_iris <- iris
RSiteSearch('filter')
filter(novo_iris, Sepal.Length > 7)
