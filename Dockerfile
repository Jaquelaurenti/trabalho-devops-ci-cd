# Use a imagem oficial do Node.js como base
FROM node:14-alpine

# Defina o diretório de trabalho dentro do contêiner
WORKDIR /app

# Copie os arquivos package.json e package-lock.json para o diretório de trabalho
COPY package*.json ./

# Instale as dependências da aplicação
RUN npm install

# Copie todo o código fonte da aplicação para o diretório de trabalho
COPY . .

# Defina a porta que a aplicação irá expor
EXPOSE 3000

# Comando a ser executado quando o contêiner for iniciado
CMD [ "node", "app.js" ]
