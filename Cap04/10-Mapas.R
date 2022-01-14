install.packages(c("ggplot2", "maps", "mapdata"))

# Carregar os pacotes
library(ggplot2)
library(maps)
library(mapdata)


# Função para buscar as coordenadas dos países
?map_data
mapa <- map_data("world")


# Visualizando o dataframe
dim(mapa)
View(mapa)


# Gerando o mapa
ggplot() + geom_polygon(data = mapa, aes(x = long, y = lat, group = group))

# + coord_fixed(1, 3) -> Esse trecho adicionado quebra o gráfico.

ggplot() + 
  geom_polygon(data = mapa, aes(x = long, y = lat, group = group), 
               fill = NA, color = "blue") # + coord_fixed(1, 3) -> Esse trecho adicionado quebra o gráfico.

gg1 <- ggplot() + 
  geom_polygon(data = mapa, aes(x=long, y=lat, group=group), fill = "seagreen1",
               color = "blue") # + coord_fixed(1, 3) -> Esse trecho adicionado quebra o gráfico.

gg1

# Marcando alguns pontos no mapa
# Se nosso dataset não possuir essas informações podemos usar um shapefile
labs <- data.frame(
  long = c(69.24140, -2.8456051),
  lat = c(-78.38995, 22.44512), 
  names = c("Ponto1", "Ponto2"),
  stringsAsFactors = FALSE
  
  
  # rMaps
  # http://rmaps.github.io
)


# Pontos no mapa
gg1 + 
  geom_point(data = labs, aes(x = long, y = lat), color = "black", size = 10) + 
  geom_point(data = labs, aes(x = long, y = lat), color = "yellow", size = 2)


# Divisão por países
ggplot(data = mapa) + 
  geom_polygon(aes(x = long, y = lat, fill = region, group = group), color = "white") + 
  coord_fixed(ratio = 1/1) +
  guides(fill="none")



