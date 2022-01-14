?pie

# Criando Fatias
fatias = c(40, 20, 40)

# Nomeando os labels
paises = c("Brasil", "Argentina", "Chile")

# Unindo paises e fatias
paises = paste(paises, fatias)

# Incluindo mais detalhes no label
paises = paste(paises, "%", sep = "")

colors()

# Construindo um gráfico
pie(fatias, labels = paises,
    col = c("darksalmon", "tomato4", "violetred1"),
    main = "Distribuilão de Vendas")


# Trabalhando com dataframes

attach(iris)
Values = table(Species)
Values
labels = paste(names(Values))
labels
pie(Values, labels = labels, main = "Distribuição de Espécies")


# 3D
install.packages("plotrix")
library(plotrix)

?pie3D

pie3D(fatias, labels = paises, explode = 0.06,
      col = c("steelblue1", "tomato2", "tan3"),
      main = "Distribuição de Vendas")
