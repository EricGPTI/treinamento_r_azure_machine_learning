# Big Data na Prática 4 - Customer Churn Analytics

# Url para baixar pacotes que não foram instalados automaticamente usando o
# comando install.packages()...

urlRandomForest <- "https://cran.r-project.org/src/contrib/Archive/randomForest/randomForest_3.3-6.tar.gz"

# Install Pacotes
install.packages("corrplot")
install.packages("ggthemes")
install.packages("caret")
install.packages("gridExtra")
install.packages("randomForest")
install.packages("party")


# Carregando Pacotes
library(plyr)
library(corrplot)
library(ggplot2)
library(gridExtra)
library(ggthemes)
library(caret)
library(MASS)
library(randomForest)
library(party)


# Os dados brutos con´tem 7043 linhas (clientes) e 21 Colunas (Recursos). A coluna
# "Churn" é o nosso alvo.
churn <- read.csv('D:\\ProjetosDev\\treinamento_r_azure_machine_learning\\dbs\\Cap06_Files\\Telco-Customer-Churn.csv')
View(churn)
str(churn)


# Usamos sapply para verificar o número de valores ausentes (missing) em cada coluna.
# Descobrimos que há 11 valores ausentes nas colunas "TotalCharges.
# Então, vamos remover todas as linhas com valores ausentes.
sapply(churn, function(x) sum(is.na(x)))
churn <- churn[complete.cases(churn), ]


# Olhe para as variáveis, podemos ver que temos algumas limpezas e ajustes para fazer.
# 1. Vamos mudar "No internet service" para "No" por seis colunas, que são:
# "OnlineSecurity", "OnlineBackup", "DeviceProtection", "TechSupport", "StreamingTV", 
# "streamingMovies".
str(churn)
cols_recodel <- c(10:15)
for (i in 1:ncol(churn[, cols_recodel])) {
  churn[, cols_recodel][,i] <- as.factor(mapvalues 
                                          (churn[,cols_recodel][,i],
                                           from = c("No internet service"),
                                           to = c("No")))
}


# 2. Vamos mudar "No phone service" para "No" para a coluna "MulplipleLines"
churn$MultipleLines <- as.factor(mapvalues(
  churn$MultipleLines, from = c("No phone service"), to = c("No")
))


# 3. Como a permanência mínima é de 1 mês e a permanência máxima é de 72 meses, 
# podemos agrupá-los em cinco gruposde posses (tenure):
# "0-12 Meses", "13-24 Meses", "25-48 Meses", "49-60 Meses" Mês "."> 60 Meses"
min(churn$tenure); max(churn$tenure)

group_tenure <- function(tenure){
  if (tenure >= 0 & tenure <= 12){
    return ('0-12 Months')
  } else if (tenure > 12 & tenure <= 24){
    return ('13-24 Months')
  } else if (tenure > 24 & tenure <= 48){
    return ('25-48 Months')
  } else if (tenure > 48 & tenure <= 60) {
    return ('19-60 Months')
  } else if (tenure > 60){
    return ('> 60 Months')
  }
}


churn$tenure_group <- sapply(churn$tenure, group_tenure)
churn$tenure_group <- as.factor(churn$tenure_group)


# 4. Alteramos os valores na coluna "SeniorCitizen" de 0 ou 1 para "No" ou "Yes".
churn$SeniorCitizen <- as.factor(mapvalues(churn$SeniorCitizen, 
                                           from = c("0", "1"), 
                                           to = c("No", "Yes")))

# 5. Removemos as colunas que não precisamos para a análise.
churn$customerID <- Null
churn$tenure <- Null
View(churn)


# Análise Exploratória de dados e seleção de recursos
# Correlação entre variáveis numéricas
numeric_var < - sapply(churn, is.numeric)
corr.matrix <- cor(churn[, numeric.var])
corrplot(corr.matrix, main="\n\nGráfico de Correlação para Variáveis Numéricas", 
         method= "number")


# Os encargos mensais e os encargos totais estão correlacionados.
# Então um deles será removido do modelo. Nòs removemos Total Charges.
churn$TotalCharges <- NULL

# Gráficos de barra de variáveis categóricas
p1 <- ggplot(churn, aes(x=gender)) + ggtile("Gender") + xlab("Sexo") + 
  geom_bar(aes(y = 100*(..count..)/sum(..count..)), width = 0.5) + 
  ylab("Percentual" + )