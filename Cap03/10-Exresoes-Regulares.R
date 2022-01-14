# Criar uma string para uso.
str <- c("Expressões", "regulares", "em linguagem R", 
            "permitem a busca de padrões", "e exploração de textos", 
            "podemos buscar padrões em dígitos", "como por exemplo", 
            "10992451280")

length(str)
str


# Grep()
?grep
grep("ex", str, value = F)
grep("ex", str, value = T)
grep("\\d", str, value = F)
grep("\\d", str, value = T)


# grepl
grepl("\\d", str)
grepl("\\D", str)


# gsub
?gsub
gsub("em", "***", str)
gsub("ex", "EX", str)


# sub()
sub("em", "EM", str)


# regexpr()
frase <- "Isso é uma string."
regexpr(pattern = "u", frase)


# gregexpr()
gregexpr(pattern = "u", frase)


str2 <- c("2678 é maior que 45 - 0???!$$", 
          "Vamos escrever 14 scripts R")

str2
#gsub()
gsub("\\d", "", str2)
gsub("\\D", "", str2)
gsub("\\s", "", str2)
gsub("[iot]", "Q", str2)
gsub("[[:punct:]]", "", str2)
