# Lista de Exerc√≠cios - Cap√≠tulo 4

# Obs: Caso tenha problemas com a acentua√ß√£o, consulte este link:
# https://support.rstudio.com/hc/en-us/articles/200532197-Character-Encoding

# Configurando o diret√≥rio de trabalho
# Coloque entre aspas o diret√≥rio de trabalho que voc√™ est√° usando no seu computador
# N√£o use diret√≥rios com espa√ßo no nome
setwd("C:/FCD/BigDataRAzure/Cap04")
getwd()

# Exercicio 1 - Crie uma fun√ß√£o que receba os dois vetores abaixo como par√¢metro, 
# converta-os em um dataframe e imprima no console
vec1 <- (10:13)
vec2 <- c("a", "b", "c", "d")

df = function(v1, v2) {
  return (data.frame(v1, v2))
}

df(vec1, vec2)

# Exercicio 2 - Crie uma matriz com 4 linhas e 4 colunas preenchida com 
# n√∫meros inteiros e calcule a m√©dia de cada linha

mat <- matrix(c(1:16), nrow = 4, ncol = 4)
mat

apply(mat, 1, mean)


# Exercicio 3 - Considere o dataframe abaixo. 
# Calcule a m√©dia por disciplina e depois calcule a m√©dia de apenas uma disciplina
escola <- data.frame(Aluno = c('Alan', 'Alice', 'Alana', 'Aline', 'Alex', 'Ajay'),
                     Matematica = c(90, 80, 85, 87, 56, 79),
                     Geografia = c(100, 78, 86, 90, 98, 67),
                     Quimica = c(76, 56, 89, 90, 100, 87))


escola
# mÈdia por disciplina
media_all <- apply(escola[, c(2,3,4)], 2, mean)
media_all

# media uma matÈria
apply(escola[, c(2), drop=F], 2, mean)

# mÈdia de por alunos em todas as matÈrias
escola$Media <- apply(escola[, c(2,3,4)], 1, mean)
escola



# Exercicio 4 - Cria uma lista com 3 elementos, todos num√©ricos 
# e calcule a soma de todos os elementos da lista
lista <- list(1:3)
lista
soma <- sapply(lista, sum)
soma

# Respost do exercÌcio
lista1 <- list(a = 1:10, b = 1:5)
lista1
do.call(sum, lista1)

# Exercicio 5 - Transforme a lista anterior um vetor
unlist(lista)
unlist(lista1)


# Exercicio 6 - Considere a string abaixo. Substitua a palavra "textos" por "frases"
str <- c("Expressoes", "regulares", "em linguagem R", 
         "permitem a busca de padroes", "e exploracao de textos",
         "podemos buscar padroes em digitos",
         "como por exemplo",
         "10992451280")

str1 <- sub("texto", "frase", str)
str1

# Resposta da correÁ„o
gsub("texto", "frase", str)



# Exercicio 7 - Usando o dataset mtcars, crie um gr√°fico com ggplot do tipo 
# scatter plot. Use as colunas disp e mpg nos eixos x e y respectivamente

library(ggplot2)
?ggplot
ggplot(mtcars, aes(x=disp, y=mpg)) + geom_point()


# Exercicio 8 - Considere a matriz abaixo.
# Crie um bar plot que represente os dados em barras individuais.
mat1 <- matrix(c(652,1537,598,242,36,46,38,21,218,327,106,67), nrow = 3, byrow = T)
mat1

# ResoluÁ„o
barplot(mat1, beside = T)


# Exerc√≠cio 9 - Qual o erro do c√≥digo abaixo?
data(diamonds)
?aes
ggplot(data = diamonds, aes(x = price, group = cut, fill = cut)) + 
  geom_density(adjust = 1.5)

# group n„o pertence ao modelo do gr·fico. - Errado.
# ResoluÁ„o --> N„o existe o par‚metro fill no dataset.


# Exerc√≠cio 10 - Qual o erro do c√≥digo abaixo?
ggplot(mtcars, aes(x = as.factor(cyl), fill = as.factor(cyl))) + 
  geom_bar() +
  labs(fill = "cyl")

# O nome da funÁ„o n„o È geom_barplot e sim geom_bar



