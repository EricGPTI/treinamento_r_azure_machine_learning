# Níveis dos Fatores
# Internamente, o R armazena valres inteiros e faz um mapeamento para as strings (em ordem alfabética)
# e agrupa as estatísticas por níveis.
vec1 <- c(1001, 1002, 1003, 1004, 1005)
vec2 <- c(0, 1, 1, 0, 2)
vec3 <- c("Verde", "Laranja", "Azul", "Laranja", "Verde")

# Unindo os vetores em um dataframe
df <- data.frame(vec1, vec2, vec3)
df


# Verificando que o R categorizou a última coluna como fator
# OBS.: na minha versão a coluna não está sendo convertido em factor.
str(df)

# Então vamos fazer a conversão.
df$vec3 <- factor(df$vec3)
str(df)


# Verificando os níveis do fator. PErceba que os níeis estão categorizados
# em ordem alfabética
levels(df$vec3)


# Criando uma outra coluna e atribuindo labels
df$cat1 <- factor(df$vec3, labels = c("Cor2", "Cor1", "Cor3"))
df


# Internamente os fatores são resgistrados como inteiros, mas a ordenação se dá
# por ordem alfabética das strings
str(df)

# Vamos ver o que aconteceu para que cor2 aparecesse primeiro que cor1
# Azul = cor2, 
# Laranja = cor1
# verde = cor3
# Ou seja, os vetores com os labels seguiram a ordem alfabética dos níves de
# classificação do R.

# Criar uma outra coluna e criar labels
# Ao aplicarmos a função factor() a coluna vec2, internamente o R classificou em 
# ordem alfabética, e quando atribuímos os labels, foi feita a associação.
df$cat2 <- factor(df$vec2, labels = c("Divorciado", "Casado", "Solteiro"))
df
str(df)
levels(df$cat2)
