# O pacote Lattice é um sistema de visualizaçaõ de dados de alto nível, 
# poderoso e elegante, com ênfase em dados muitivariados

# Na criação de fráficos, condições e agrupamentos são 2 conceitos
# importantes, que nos permitem compreender mais facilmente os que temos
# em mãos. O conceito por trás do Lattice é agrupar os dados e criar
# visualizações de forma que fique mais fácil a busca pro padrões


# Instalar e carregar o pacote
install.packages("lattice")
library(lattice)

# Scatterplot com Lattice
View(iris)
xyplot(data = iris, groups = Species, Sepal.Length~Petal.Length)


# Barplots com dataset Titanic
barchart(Class ~ Freq | Sex + Age, data = as.data.frame(Titanic),
         groups = Survived, stack = T, layout = c(4, 1), 
         auto.key = list(title = "Dados Titanic", columns = 2))

# Adicionando uma scala 
barchart(Class ~ Freq | Sex + Age, data = as.data.frame(Titanic),
         groups = Survived, stack = T, layout = c(4, 1), 
         auto.key = list(title = "Dados Titanic", columns = 2), 
         scales = list(x = "free"))


# Contagem de elementos
PetalLength <- equal.count(iris$Petal.Length, 4)
PetalLength


# Scatterplots
xyplot(Sepal.Length ~ Sepal.Width | PetalLength, data = iris)

xyplot(Sepal.Length ~ Sepal.Width | PetalLength, data = iris, 
       panel = function(...) {
         panel.grid(h = -1, v = -1, col.line = "skyblue")
         panel.xyplot(...)})


xyplot(Sepal.Length ~ Sepal.Width | PetalLength, data = iris, 
       panel = function(x,y,...) {
         panel.xyplot(x,y,...)
         mylm <- lm(y~x)
         panel.abline(mylm)})


histogram(~Sepal.Length | Species, xlab = "",
          data = iris, layout = c(3, 1), type = "density",
          main = "Histograma Lattice", sub = "Iris Dataset, Sepal Length")


# Distribuição dos dados
qqmath(~ Sepal.Length | Species, data = iris, distribution = qunif)


# Boxplot
bwplot(Species~Sepal.Length, data = iris)


# violinPlot
bwplot(Species~Sepal.Length, data = iris, panel = panel.violin)
