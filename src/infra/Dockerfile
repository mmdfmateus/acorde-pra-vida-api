# Derivando da imagem oficial do MySQL
FROM mysql:5.7

# Adicionando os scripts SQL para serem executados na criação do banco
COPY ./src/infra/migrations/ /docker-entrypoint-initdb.d/

ENV MYSQL_ROOT_PASSWORD=123456
ENV MYSQL_DATABASE=AcordePraVida
ENV MYSQL_USER=User
ENV MYSQL_PASSWORD=456789