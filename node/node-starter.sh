#!/bin/bash

# Cloning our project inside the container
if ls | grep -q "nome do projeto"; then
    echo 'Projeto encontrado...'
else
    echo 'Projeto não encontrado, clonando ele do github'
    git clone https://github.com/Basilios-SPTech/Basilios---Projeto-de-PI-.git > /dev/null
    echo 'Projeto clonado'
fi

cd Basilios---Projeto-de-PI-/basilios-auth-ui
echo 'Instalando dependências'
npm install

echo 'Iniciando projeto'
npm run dev
