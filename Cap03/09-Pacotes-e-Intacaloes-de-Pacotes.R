# De onde vem as funções? Pacotes(conjuntos de funções)
# Quando você instala o RStudio, alguns pacotes são carregados por padrão.

# Busca os pacotes carregados
search()


# Instala e carrega os pacotes
install.packages(c("ggvis", "tm", "dplyr"))
install.packages("ggplot2")
library(ggvis)
library(tm)
library(ggplot2)
require(dplyr)


search()
?require
detach(package:dplyr)


# Lista o conteúdo dos pacotes
?ls
ls(pos = "package:tm")
ls(getNamespace("tm"), all.names = T)


# Lista as funções de um pacote
lsf.str("package:tm")
lsf.str("package:ggplot2")


# R possui um conjunto de datasets preinstalados
library(MASS)
data()


?lynx
head(lynx)
head(iris)
tail(lynx)
summary(lynx)

plot(lynx)
hist(lynx)
head(iris)
iris$Sepal.Length
sum(iris$Sepal.Length)
