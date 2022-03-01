# Instalar SQLite
install.packages("RSQLite")
library(RSQLite)


# Remover o banco SQLite, caso exista - Não é obrigatório.
system("del exmplo.db") # --> No windows
system("rm exemplo.db") # --> no Mac e linux


# Criando driver e conexão ao banco de dados.
drv = dbDriver("SQLite")
conn = dbConnect(drv, dbname="exemplo.db")
dbListTables(conn)


# Criando uma tabela e carregando com dados do dataset mtcars
dbWriteTable(conn, "mtcars", mtcars, row_names = TRUE)


# Listando uma tabela
dbListTables(conn)
dbExistsTable(conn, "mtcars")
dbExistsTable(conn, "mtcars2")
dbListFields(conn, "mtcars")


# Lendo o conteúdo da tabela
dbReadTable(conn, "mtcars")


# Criando apenas a definição da tabela
dbWriteTable(conn, "mtcars2", mtcars[0, ], row.names = T)
dbListTables(conn)
dbReadTable(conn, "mtcars2")
dbReadTable(conn, "mtcars")

# Executando consultas no banco de dados.
query = "select row_names from mtcars"
rs = dbSendQuery(conn, query)
dados = fetch(rs, n = -1)
dados
class(dados)


query = 'select row_names from mtcars2'
rs = dbSendQuery(conn, query)
while (!dbHasCompleted(rs))
{
  dados = fetch(rs, n = 1)
  print(dados$row_names)
}


View(mtcars)

query = "select disp, hp from mtcars where disp > 160"
rs = dbSendQuery(conn, query)
dados = fetch(rs, n = -1)
dados


query = "select row_names, avg(hp) from mtcars group by row_names"
rs = dbSendQuery(conn, query)
dados = fetch(rs, n = -1)
dados


# Criando uma tabela a partir de um arquivo
dbWriteTable(conn, "iris", "D:\\ProjetosDev\\treinamento_r_azure_machine_learning\\dbs\\Cap05_Files\\iris.csv", sep = ",", header = T)
dbListTables(conn)
dbReadTable(conn, "iris")


# Encerrando a conexão
dbDisconnect(conn)


# Carregando dados no banco de dados
# http://dados.gov.br/dataset/indice-nacional-de-precos-ao-consumidor-amplo-15-ipca-15
# Criando driver e conexão ao banco de dados
drv = dbDriver("SQLite")
conn = dbCanConnect(drv, dbname="exemplo.db")

dbWriteTable(conn, "indices", "D:\\ProjetosDev\\treinamento_r_azure_machine_learning\\dbs\\Cap06_Files\\indice.csv",
             sep = "|", header = T)
dbListTables(conn)
dbReadTable(conn, "indices")

df <- dbReadTable(conn, "indices")
df
str(df)
sapply(df, class)

hist(df$setembro)
df_mean <- unlist(lapply(df[, c(4,5,6,7,8)], mean))
df_mean

dbDisconnect(conn)