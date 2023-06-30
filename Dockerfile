# Use uma imagem base do Node.js
FROM node:14

# Defina o diretório de trabalho dentro do contêiner
WORKDIR /usr/src/app

# Copie os arquivos do projeto para o diretório de trabalho
COPY app/package.json .
COPY app/index.js .

# Instale as dependências da aplicação
RUN npm install

# Expõe a porta 3000 para acesso externo
EXPOSE 3000

# Inicia o servidor da aplicação
CMD [ "node", "index.js" ]
