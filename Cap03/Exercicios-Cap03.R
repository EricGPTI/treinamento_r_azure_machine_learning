# Lista de Exercícios - CapÃ­tulo 3

# Obs: Caso tenha problemas com a acentuação, consulte este link:
# https://support.rstudio.com/hc/en-us/articles/200532197-Character-Encoding

# Configurando o diretório de trabalho
# Coloque entre aspas o diretório de trabalho que você está usando no seu computador
# Não use diretórios com espaçoo no nome
setwd("C:/FCD/BigDataRAzure/Cap02")
getwd()

# Exercício 1 - Pesquise pela função que permite listar todos os arquivo no diretório de trabalho
help("list.dirs")
################# Resposta ##################
list.files()

# Exercício 2 - Crie um dataframe a partir de 3 vetores: um de caracteres, um lógico e um de números
vec1 <- c("A", "B", "C")
vec2 <- c(TRUE, FALSE, TRUE)
vec3 <- c(10, 15, 20)

df = data.frame(vec1, vec2, vec3)
df
# Correto.


# Exercício 3 - Considere o vetor abaixo. 
# Criando um Vetor
vec1 <- c(12, 3, 4, 19, 34, 10)
vec1

# Crie um loop que verifique se há números maiores que 10 e imprima o números e uma mensagem no console.
install.packages("glue")
library(glue)

for (i in vec1){
  if (i > 10){
    print(glue("{i} é maior que 10"))
  }
}
################# Resposta ##################
for (i in 1:length(vec1)){
  if (vec1[i] > 10){
    print(vec1[i])
    print('Este elemento do vetor é maior que 10')
  } else if (vec1[i] == 10){
    print(vec[i])
    print('Este elemento é igual a 10')
  }else {
    print(vec1[i])
    print('Este elemento é menor que 10')
  }
}



# Exercício 4 - Conisdere a lista abaixo. Crie um loop que imprima no console cada elemento da lista
lst2 <- list(2, 3, 5, 7, 11, 13)
lst2
for (i in lst2){
  print(i)
}


################# Resposta ##################
for (i in 1:length(lst2)){
  print(lst2[[i]])
}


# Exercício 5 - Considere as duas matrizes abaixo. 
# Faça uma Multiplicação element-wise e Multiplicação normal entre as materizes
mat1 <- matrix(c(1:50), nrow = 5, ncol = 5, byrow = T)
mat1
mat2 <- t(mat1)
mat2

# Multiplicação element-wise
mat3 <- mat1 * mat2
mat3

# Multiplicação de matrizes
mat4 <- mat1 %*% mat2
mat4
# Correto


# Exercício 6 - Crie um vetor, matriz, lista e dataframe e Faça a nomeação de cada um dos objetos
names <- c("A", "B", "C", "D")
vec <- c(1, 2, 3, 4)

names(vec) <- names
vec

mat <- matrix(c(1, 2, 3, 4), nc = 4)
dim(mat)
dimnames(mat)
dimnames(mat) <- (list(c("Linha"), c("A", "B", "C", "D")))
mat

lst <- list(c(1, 2, 3, 4))
lst

names(lst[[1]]) <- c("A", "B", "C", "D")
lst


df <- data.frame(1, 2, 3, 4)
df

colnames(df) <- names
df
                  
                    
################# Resposta ##################
# Lista
lst_resp <- list(1, 2, 3, 4)
lst_resp
names(lst) <- c("A", "B", "C", "D")
lst_resp


# Exercício 7 - Considere a matriz abaixo. Atribua valores NA de forma aleatório para 50 elementos da matriz
# Dica: use a função sample()
mat2 <- matrix(1:90, 10)
mat2

?sample

for (i in sample(mat2, 50, replace = F)){
  mat2[i] = NA
}
mat2

################# Resposta ##################
mat2[sample(1:50, 10)] = NA
mat2



# Exercício 8 - Para a matriz abaixo, calcule a soma por linha e por coluna
mat1 <- matrix(c(1:50), nrow = 5, ncol = 5, byrow = T)
mat1



# Sum by row
?apply

row.sums <- apply(mat1, 1, sum)
row.sums
# Sum by col
col.sums <- apply(mat1, 2, sum)
col.sums


################# Resposta ##################
rowSums(mat1)
colSums(mat1)




# Exercício 9 - Para o vetor abaixo, ordene os valores em ordem crescente
a <- c(100, 10, 10000, 1000)
a_ordered <- sort(a)
a_ordered

################# Resposta ##################
order(a)
a[order(a)]



# # Exercício 10 - Imprima no console todos os elementos da matriz abaixo que forem maiores que 15
mat1 <- matrix(c(1:50), nrow = 5, ncol = 5, byrow = T)
mat1
for (i in mat1){
  if (i > 15){
    print(i)
  }
}
