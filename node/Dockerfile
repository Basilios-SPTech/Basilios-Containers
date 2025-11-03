FROM node:22-alpine
WORKDIR /app

# Copying our project
COPY ./Basilios---Projeto-de-PI-/basilios-auth-ui ./

# Installing dependencies
RUN npm install

# Running our app
RUN npm run dev

# Exposing port
EXPOSE 5173
