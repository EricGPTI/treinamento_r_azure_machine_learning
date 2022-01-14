?barplot

# Preparando os dados - número de casamentos em uma igreja de SP
dados <- matrix(c(65, 1537, 598, 242, 36, 46, 38, 21, 218, 327, 106, 67), nrow = 3, byrow = T)
dados


# Nomeando linhas e colunas na matriz
colnames(dados) <- c("0", "1-150", "151-300", ">300")
rownames(dados) <- c("Jovem", "Adulto", "Idoso")
dados


# Construindo o Barplot
barplot(dados, beside = T)


# Construindo o plot - Stacked Bar Plot
# As 3 faixas de  idade são representadas na mesma coluna para as diferentes quantidades
barplot(dados, col = c("steelblue1", "tan3", "seagreen3"))


# Crie uma legenda para o gráfico anterior
?barplot
legend("topright", pch = 1, cex = 0.6, col = c("steelblue1", "tan3", "seagreen3"), 
       legend = c("Jovem", "Adulto", "Idoso"))


barplot(dados, beside = T, legend.text = T, 
        main = "Casamentos por classe de pessoas", 
        col = c("steelblue1", "tan3", "seagreen3"))

# Agora temos uma coluna para cada faixa etária mas na mesema faixa de quantidade
barplot(dados, beside = T, col = c("steelblue1", "tan3", "seagreen3"))
legend("topright", pch = 1, col = c("steelblue1", "tan3", "seagreen3"), 
       legend = c("Jovem", "Adulto", "Idoso"), cex = 0.6)


# Com a Transposta da matriz, invertemos as posições entre faixa etaria e faixa de quantidade
t(dados)
barplot(t(dados), beside = T, col = c("steelblue1", "tan3", "seagreen3", "peachpuff1"))
legend("topright", pch = 1, col = c("steelblue1", "tan3", "seagreen3", "peachpuff1"),
       legend = c("0", "1-150", "151-300", ">300"), cex = 0.6)
