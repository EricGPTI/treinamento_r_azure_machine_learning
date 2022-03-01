# ****************** Pacotes que requerem Java ****************** #
# XLConnect
# xlsx
# Java

# ****************** Pacotes que requerem Perl ****************** #
# É necessário instalar o interpretador da linguagem Perl e adicionar
# o diretório nas variáveis de ambiente "PATH"
# Download: https://www.activestate.com/activeperl
# gdata

# Instalando os pacotes
install.packages("rJava")
install.packages("xlsx")
install.packages("XLConnect")
install.packages("readxl")
install.packages("gdata")
library(rJava)

# Obs: rear todos os pacotes que manipulam excel, pode gerar problemas...
# possuem o mesmo nome de fujções (que são diferentes entre os pacotes). Para...
# os pacotes de foma dividual (não carregue todo os pacotes de uma única vez.)


# Pacote readxl
library(readxl)

# Lista as worksheet no arquivo Excel
excel_sheets("D:\\ProjetosDev\\treinamento_r_azure_machine_learning\\dbs\\Cap05_Files\\UrbanPop.xlsx")


# Lendo a planilha do Excel
read_excel("D:\\ProjetosDev\\treinamento_r_azure_machine_learning\\dbs\\Cap05_Files\\UrbanPop.xlsx")
head(read_excel("D:\\ProjetosDev\\treinamento_r_azure_machine_learning\\dbs\\Cap05_Files\\UrbanPop.xlsx"))
read_excel("D:\\ProjetosDev\\treinamento_r_azure_machine_learning\\dbs\\Cap05_Files\\UrbanPop.xlsx", 
           sheet = "Period2")
read_excel("D:\\ProjetosDev\\treinamento_r_azure_machine_learning\\dbs\\Cap05_Files\\UrbanPop.xlsx", 
           sheet = 3)
read_excel("D:\\ProjetosDev\\treinamento_r_azure_machine_learning\\dbs\\Cap05_Files\\UrbanPop.xlsx",
           sheet = 4)



# Importando uma worksheet para um dataframe
df <- read_excel("D:\\ProjetosDev\\treinamento_r_azure_machine_learning\\dbs\\Cap05_Files\\UrbanPop.xlsx",
                 sheet = 3)
head(df)


# Importando todas as worksheets
df_todas <- lapply(excel_sheets("D:\\ProjetosDev\\treinamento_r_azure_machine_learning\\dbs\\Cap05_Files\\UrbanPop.xlsx"),
                   read_excel, 
                   path = "D:\\ProjetosDev\\treinamento_r_azure_machine_learning\\dbs\\Cap05_Files\\UrbanPop.xlsx")
df_todas
class(df_todas)



# Pacote XLConnect
detach("package:readxl", unload=TRUE)
library(XLConnect)


# Namespace
arq1 = XLConnect::loadWorkbook("D:\\ProjetosDev\\treinamento_r_azure_machine_learning\\dbs\\Cap05_Files\\UrbanPop.xlsx")
df1 = readWorksheet(arq1, sheet = "Period1", header = TRUE)
df1
class(df1)


# Pacote xlsx
detach(package:XLConnect)
library(xlsx)
?xlsx

?read.xlsx

df2 <- read.xlsx("D:\\ProjetosDev\\treinamento_r_azure_machine_learning\\dbs\\Cap05_Files\\UrbanPop.xlsx", 
                 sheetIndex = 1)
df2


# Pacote gdata
detach("package:xlsx", unload=TRUE)
library(gdata)


arq1 <- xls2csv("D:\\ProjetosDev\\treinamento_r_azure_machine_learning\\dbs\\Cap05_Files\\planilha1.xlsx",
                sheet = 1,
                na.strings = "EMPTY")
arq1
read.csv(arq1)


