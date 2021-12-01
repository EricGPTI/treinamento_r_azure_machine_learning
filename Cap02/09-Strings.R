# Strings
texto <- "Isso é uma string!"
texto


x = as.character(3.14)
x
class(x)


# Concatenar strings
nome = "Nelson"; sobrenome = "Mandela"
paste(nome, sobrenome)
cat(nome, sobrenome)


# Formatar a saída
sprintf("A %s é nota %d", "Data Science Academy", 10)


# Extraindo partes da string
texto <- "Isso é uma strin!"
substr(texto, start=12, stop=17)
?substr


# Contando o número de caracteres
nchar(texto)


# Alterando a Capitalização
tolower("Histogramas e Elementos de Dados")
toupper("Histogramas e Elementos de Dados")


# Usando stringr
library(stringr)

# Dividindo uma string em caracteres
strsplit("Histogramas e Elementos de Dados", NULL)
?strsplit


# Dividindo uma string em caractees, após o caracter espaço
strsplit("Histogramas e Elementos de Dados", " ")


# Trabalhando com strings
string1 <- c("Esta é a primeira parte da minha string e será a primeira parte do meu vetor", 
             "Aqui a minha string continua, mas será transformada no segundo vetor")
string1

string2 <- c("Precisamos testar outras strings - 0???!$$",
             "Análise de dados em R")
string2


# Adicionando 2 strings
str_c(c(string1, string2), sep= "")


# Podemos contar quantas vezes um caracter aparece no texto
str_count(c(string2), "s")


# Localiza a primeira e última posição em que o caracter aparece na string
str_locate_all(string2, "s")


#Substitui a primeira ocorrencia de um caracter
str_replace(string2, "\\s", "")


# Substituir todas as ocorrências de um caracter
str_replace_all(string2, "\\s", "")


# Detectando padrões nas strings
string1 <- "17 jan 2001"
string2 <- "1 jan 2001"
padrao <- "jan 20"
grepl(pattern = padrao, x = string1)
padrao <- "jan20"
grepl(pattern = padrao, x = string1)
