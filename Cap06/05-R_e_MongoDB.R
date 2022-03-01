# RMongoDB
# Instalação do pacote
install.packages("devtools")
library(devtools)
install_github("mongosoup/rmongodb", force = T)
library(rmongodb)


# Criando a conexão
help("mongo.create")
mongo <- mongo.create(host = "localhost",
                      db = "admin",
                      username = "root", 
                      password = "123456")
mongo


# Checando a conexão
mongo.is.connected(mongo)

if (mongo.is.connected(mongo) == T){
  mongo.get.databases(mongo)
}
