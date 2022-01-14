?read.table
# Local dos arquivos
# D:\\ProjetosDev\\treinamento_r_azure_machine_learning\\dbs\\Cap05_Files\\


path = "D:\\ProjetosDev\\treinamento_r_azure_machine_learning\\dbs\\Cap05_Files\\"
path
# Verificando os pacotes instalados
search()


# Importando arquivo com read.table()
df1 <- read.table("D:\\ProjetosDev\\treinamento_r_azure_machine_learning\\dbs\\Cap05_Files\\pedidos.txt")
df1
dim(df1)

# Temos que passar o cabeçalho e o separador
df1 <- read.table("D:\\ProjetosDev\\treinamento_r_azure_machine_learning\\dbs\\Cap05_Files\\pedidos.txt",
                  header = T, sep = ",")
df1
dim(df1)


# Podemos passar os nomes das colunas
df1 <- read.table("D:\\ProjetosDev\\treinamento_r_azure_machine_learning\\dbs\\Cap05_Files\\pedidos.txt",
                  header = T, sep = ",",
                  col.names = c("var1", "var2", "var3"))
df1


# No momento da carga podemos substituir valores definidos por NA
df1 <- read.table("D:\\ProjetosDev\\treinamento_r_azure_machine_learning\\dbs\\Cap05_Files\\pedidos.txt",
                  header = T, sep = ",",
                  col.names = c("var1", "var2", "var3"),
                  na.string = c("Zico", "Maradona"),
                  stringsAsFactors = F)
df1


# Verficar o resultado do import
str(df1)



# Importando arquivos csv
# A função read.csv já espera o separador de caracter como sendo ","
df2 <- read.csv("D:\\ProjetosDev\\treinamento_r_azure_machine_learning\\dbs\\Cap05_Files\\pedidos.txt")
df2

# Verificando as dimensões
dim(df2)


# Usando a função read_csv2
# Essa função precisa que seja especificado o separador.
df3 <- read.csv2("D:\\ProjetosDev\\treinamento_r_azure_machine_learning\\dbs\\Cap05_Files\\pedidos.txt")
df3
dim(df3)


df3 <- read.csv2("D:\\ProjetosDev\\treinamento_r_azure_machine_learning\\dbs\\Cap05_Files\\pedidos.txt",
                 header = T, sep = ",")
df3
dim(df3)



# Importando arquivos com read.delim
# Esta função não reconhece o separador de colunas.
df4 <- read.delim("D:\\ProjetosDev\\treinamento_r_azure_machine_learning\\dbs\\Cap05_Files\\pedidos.txt")
df4
dim(df4)


df4 <- read.delim("D:\\ProjetosDev\\treinamento_r_azure_machine_learning\\dbs\\Cap05_Files\\pedidos.txt", 
                  sep = ",")
df4
dim(df4)



# Importando / Exportando
# Gerando arquivo
write.table(mtcars, file = "D:\\ProjetosDev\\treinamento_r_azure_machine_learning\\dbs\\Cap05_Files\\mtcars.txt")
dir("D:\\ProjetosDev\\treinamento_r_azure_machine_learning\\dbs\\Cap05_Files")


df_mtcars <- read.table("D:\\ProjetosDev\\treinamento_r_azure_machine_learning\\dbs\\Cap05_Files\\mtcars.txt")
df_mtcars
dim(df_mtcars)

 
# Criando arquivo mtcars2 passando parâmetros
write.table(mtcars, file = "D:\\ProjetosDev\\treinamento_r_azure_machine_learning\\dbs\\Cap05_Files\\mtcars2.txt", 
            sep = "|", col.names = NA, qmethod = "double")


# Listando arquivos no diretório.
list.files("D:\\ProjetosDev\\treinamento_r_azure_machine_learning\\dbs\\Cap05_Files")



# Lendo arquivos
read.table("D:\\ProjetosDev\\treinamento_r_azure_machine_learning\\dbs\\Cap05_Files\\mtcars.txt")
df_mtcars2 <- read.table("D:\\ProjetosDev\\treinamento_r_azure_machine_learning\\dbs\\Cap05_Files\\mtcars2.txt")
df_mtcars2


# Lendo arquivos especificando o separador
df_mtcars2 <- read.table("D:\\ProjetosDev\\treinamento_r_azure_machine_learning\\dbs\\Cap05_Files\\mtcars2.txt", sep = "|")
df_mtcars2


# Lendo arquivo e especificando encoding
df_mtcars2 <- read.table("D:\\ProjetosDev\\treinamento_r_azure_machine_learning\\dbs\\Cap05_Files\\mtcars2.txt", 
                         sep = "|", encoding = "UTF-8")
df_mtcars2
