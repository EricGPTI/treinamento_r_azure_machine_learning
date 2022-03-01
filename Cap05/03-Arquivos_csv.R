# Instalando pacote para leitura de arquivos
install.packages("readr")
library(readr)


# Importanto arquivos
meu_arquivo <- read_csv(file.choose())


# Importando arquivos
df1 <- read_table("D:\\ProjetosDev\\treinamento_r_azure_machine_learning\\dbs\\Cap05_Files\\temperaturas.txt", 
                  col_names = c("DAY", "MONTH", "YEAR", "TEMP"))

head(df1)
str(df1)


read_lines("D:\\ProjetosDev\\treinamento_r_azure_machine_learning\\dbs\\Cap05_Files\\temperaturas.txt",
           skip = 0, n_max = 1L)
read_file("D:\\ProjetosDev\\treinamento_r_azure_machine_learning\\dbs\\Cap05_Files\\temperaturas.txt")


# Exportando e Importando
write_csv(iris, "iris.csv")
dir()


# col_integer():
# col_double():
# col_logical():
# col_character():
# col_factor():
# col_skip():
# col_date() (alias = "0"), col_datetime() (alias = "T"), col_time()

df_iris <- read_csv("iris.csv", col_types = list(
                      Sepal.Length = col_double(),
                      Sepal.Width = col_double(),
                      Petal.Length = col_double(),
                      Petal.Width = col_double(), 
                      Species = col_factor(c("setosa", "versicolor", "virginica"))
                    ))

dim(df_iris)
str(df_iris)


# Maniuplando arquivos csv
df_cad <- read.csv("D:\\ProjetosDev\\treinamento_r_azure_machine_learning\\dbs\\Cap05_Files\\cadastro.csv")
View(df_cad)


library(dplyr)

# Ignorando warns. Poderia ser qualquer tipo de alerta.
options(warn=-1)


df_cad <- tbl_df(df_cad)
head(df_cad)


# Gravando os dados num arquivo csv
write.csv(df_cad, "df_cad_bkp.csv")


# Importando vários arquivos simultaneamente
list.files()
lista_arquivos <- list.files("D:\\ProjetosDev\\treinamento_r_azure_machine_learning\\dbs\\Cap05_Files", full.names = TRUE)
class(lista_arquivos)
lista_arquivos


# Usando lapply para ler todos os arquivos
lista_arquivos2 <- lapply(lista_arquivos, read_csv)
class(lista_arquivos2)
View(lista_arquivos2)


# Parsing de datas
parse_date("01/02/15", "%m/%d/%y")
parse_date("01/02/15", "%d/%m/%y")
parse_date("01/02/34", "%y/%m/%d")


# Locale - para especificar o idioma de trabalho
locale("en")
locale("fr")
locale("pt")
