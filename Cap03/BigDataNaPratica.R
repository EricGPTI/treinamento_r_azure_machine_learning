# Big Data na Prática 1 - Analisando a Temperatur Média nas cidades Brasileiras

# Dataset: Berkeley Earth
# Link dos dados: https://drive.google.com/open?id=1PpVjaCbYPmfQjNBDsT3d-sh9Hkb9NoLD
# Endereço Original: http://berkeleyearth.org/data

# Instalando e carregando pacotes:
install.packages("readr")
install.packages("data.table")
install.packages("dplyr")
install.packages("ggplot2")


# Carrgando os pacotes
library(readr)
library(dplyr)
library(ggplot2)
library(scale)
library(data.table)


# Carregamento dos dados com diferentes funções
# Usando read.csv2
system.time(df_test_1 <- read.csv2("TemperaturasGlobais/TemperaturasGlobais.csv"))

# Usando read.table()
system.time(df_test_2 <- read.table("TemperaturasGlobais/TemperaturasGlobais.csv"))

# Usando fread()
system.time(df <- fread("TemperaturasGlobais/TemperaturasGlobais.csv", encoding = 'UTF-8'))


# Crando subsets dos dados carregados
cidadesBrasil <- subset(df, Country == "Brazil")
cidadesBrasil <- na.omit(cidadesBrasil)
head(cidadesBrasil)
nrow(cidadesBrasil)
ncol(cidadesBrasil)
dim(cidadesBrasil)


# Preparação e Organização

# Convertendo as Datas
cidadesBrasil$dt <- as.POSIXct(cidadesBrasil$dt, format='%Y-%m-%d')
cidadesBrasil$Month <- month(cidadesBrasil$dt)
cidadesBrasil$Year <- year(cidadesBrasil$dt)
head(cidadesBrasil)
unique(cidadesBrasil$City)

#Carregando os subsets
# Palmas
palmas <- subset(cidadesBrasil, City == "Palmas")
palmas <- subset(plm, Year %in% c(1796, 1846, 1896, 1946, 1996, 2012))
palmas


# Curitiba
curitiba <- subset(cidadesBrasil, City == "Curitiba")
curitiba <- subset(curitiba, Year %in% c(1796, 1846, 1896, 1946, 1996, 2012))
curitiba

# Recife
recife <- subset(cidadesBrasil, City == "Recife")
recife <- subset(recife, Year %in% c(1796, 1846, 1896, 1946, 1996, 2012))
recife

# São Paulo
sp <- subset(cidadesBrasil, City == "São Paulo")
sp <- subset(sp, Year %in% c(1796, 1846, 1896, 1946, 1996, 2012))
sp

# Construindo os Plots
p_palmas <- ggplot(palmas, aes(x = (Month), y = AverageTemperature, color = as.factor(Year))) + 
  geom_smooth(se = FALSE, fill = NA, size = 2) + 
  theme_light(base_size = 20) + 
  xlab("Mês") + 
  ylab("Temperatura Média") + 
  scale_color_discrete("") + 
  ggtitle("Temperatura Média ao longo dos anos em Palmas") + 
  theme(plot.title = element_text(size = 18))


p_curitiba <- ggplot(curitiba, aes(x = (Month), y = AverageTemperature, color = as.factor(Year))) + 
  geom_smooth(se = FALSE, fill = NA, size = 2) + 
  theme_light(base_size = 20) + 
  xlab("Mês") + 
  ylab("Temperatura Média") + 
  scale_color_discrete("") + 
  ggtitle("Temperatura Média ao longo dos anos em Curitiba") + 
  theme(plot.title = element_text(size = 18))


p_recife <- ggplot(recife, aes(x = (Month), y = AverageTemperature, color = as.factor(Year))) + 
  geom_smooth(se = FALSE, fill = NA, size = 2) + 
  theme_light(base_size = 20) + 
  xlab("Mês") + 
  ylab("Temperatura Média") + 
  scale_color_discrete("") + 
  ggtitle("Temperatura Média ao longo dos anos em Recife") + 
  theme(plot.title = element_text(size = 18))


p_sp <- ggplot(sp, aes(x = (Month), y = AverageTemperature, color = as.factor(Year))) + 
  geom_smooth(se = FALSE, fill = NA, size = 2) + 
  theme_light(base_size = 20) + 
  xlab("Mês") + 
  ylab("Temperatura Média") + 
  scale_color_discrete("") + 
  ggtitle("Temperatura Média ao longo dos anos em São Paulo") + 
  theme(plot.title = element_text(size = 18))


# Plotando os dados
p_palmas
p_curitiba
p_recife
p_sp
