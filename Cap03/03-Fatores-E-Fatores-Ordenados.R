vec1 <- c("Macho", "Femea", "Femea", "Macho", "Macho")
vec1

fac_vec1 <- factor(vec1)
fac_vec1

class(vec1)
class(fac_vec1)


# Variáveis categóricas nominais
# Não existe uma ordem implicita
animais <- c("Zebra", "Pantera", "Rinoceronte", "Macaco", "Tigre")
animais
fac_animais <- factor(animais)
fac_animais
class(fac_animais)
levels(fac_animais)


# Vaiáveis categóricas ordinais
# Possuem uma ordem natural
graduacao <- c("Mestrado", "Doutorado", "Bacharelado", "Mestrado", "Mestrado")
graduacao
fac_graduacao <- factor(graduacao, order = TRUE, levels = C("Doutorado","Mestrado", "Bachareladdo"))
fac_graduacao
level(fac_graduacao)


# Sumarizar os dados fornece uma visão geral sobre o conteúdo das variáveis
summary(fac_graduacao)
summary(graduacao)


# Criar um vetor de macho e fêmea
vec2 <- c("M", "F", "F", "M", "M", "M", "F", "F", "M", "M", "M", "F", "F", "M", "M")
vec2
fact_vec2 <- factor(vec2)
fact_vec2
levels(fact_vec2)
levels(fact_vec2) <- c("Fêmea", "Macho")
fact_vec2
summary(fact_vec2)
summary(vec2)


# Mais exemplos
data = c(1,2,2,3,1,2,3,3,1,2,3,3,1)
fdata = factor(data)
fdata

rdata = factor(data, labels = c("I", "II", "III"))
rdata


# Fatores Nâo ordenados
set1 <- c("AA", "B", "BA", "CC", "CA", "AA", "BA","CC", "CC")
set1


# Transformando os dados.
# R apenas criou os níveis, o que não significa que exista uma hierarquia.
f.set1 <- factor(set1)
f.set1
class(f.set1)
is.ordered(f.set1)


# Fatores Ordenados
o.set1 <- factor(set1, 
                 levels = c("CA", "BA", "AA", "CC", "B"), 
                 ordered = TRUE)
o.set1
is.ordered(o.set1)

as.numeric(o.set1)
table(o.set1)


# Fatores e Dataframes
df <- read.csv2("etnias.csv", sep = ',')
View(df)

# Variáveis do tipo fator
str(df)


# Níveis de fatores
# Internamente, o R armazena valores inteiros e faz um mapeamento
# para as strings (em ordem alfabética) e agrupa as estatísticas por níveis.
# Agora, se fizermos sumarização de estatísticas, é possível visualizar a 
# contabilização para cada categoria.
# OBS: Na minha versão version.string R version 4.1.2 (2021-11-01), esse 
# agrupamento não ocorreu, logo, se tento verificar os levels recebo null ou 
# o tamanho de Etnia, caso use summary().
levels(df$Etnia)
summary(df$Etnia)

# Como não houve a conversão para factor acima, terei que fazer isso manualmente.
df$Sexo <- factor(df$Sexo)
df$Etnia <- factor(df$Etnia)

# Agora vamos exibir novamente o data frame e visualizar se houve mudanças.
str(df)

# Vamos verificar os levels
levels(df$Etnia)

# E sumarizar os dados de etnia
summary(df$Etnia)

# Plot
# Agora se fizermos um plot, temos um boxplot para estas variáveis categóricas
plot(df$Idade~df$Etnia, xlab = 'Etnia', ylab = 'Idade', main = 'Idade por Etnia')


# Regressão
summary(lm(Idade~Etnia, data = df))


# Convertendo uma coluna em variável categórica. Isso criará um fator não-ordenado.
df
str(df)
df$Estado_Civil.cat <- factor(df$Estado_Civil, labels = c("Solteiro", "Casado", "Divorciado"))
df
str(df)
