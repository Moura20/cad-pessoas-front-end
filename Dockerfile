# frontend/Dockerfile
FROM node:18.18.2-alpine3.17

# Cria diretório de trabalho
WORKDIR /app

# Copia package.json e package-lock.json
COPY package*.json ./

# Instala dependências
RUN rm -rf ./node_modules
RUN rm -rf package-lock.json
RUN npm install

# Copia o restante do código
COPY . .

# Compila a aplicação para produção
RUN npm run build

# Instala o servidor HTTP estático para servir os arquivos compilados
RUN npm install -g serve

# Expõe a porta em que a aplicação vai rodar
EXPOSE 3000

# Comando para rodar a aplicação
CMD ["serve", "-s", "build"]
