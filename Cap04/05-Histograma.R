# Definindo dados
?cars
View(cars)
dados = cars$speed

# Construindo um histograma
?hist
hist(dados)


# Conforme consta no help, o parâmetro breaks pode ser um dos itens abaixo:
# Um vetor para os pontos de quebar entre as células do histograma
# Uma função para cálcular o vetor de breakpoints
# Um único número que representa o número de células para o histograma
# Uma cadeia de caracteres que nomeia um algoritmo para calcular o número de céclulas
# Uma função para calcular o número de células.

hist(dados, breaks = 10, main = "Histograma das Velocidades")
hist(dados, labels = T, breaks = c(0, 2, 10, 20,30), main = "Histograma das Velocidades")
hist(dados, labels = T, breaks = 10, main = "Histograma das Velocidades")
hist(dados, labels = T, ylim = c(0, 10), breaks = 10, main = "Histograma das Velocidades")


# Adicionando linhas ao histograma
grafico <- hist(dados, breaks = 10, main = "Histograma de Velocidade")
xaxis = seq(min(dados), max(dados), length = 10)
yaxis = dnorm(xaxis, mean = mean(dados), sd = sd(dados))
yaxis = yaxis * diff(grafico$mids) * length(dados)

lines(xaxis, yaxis, col = "red")

