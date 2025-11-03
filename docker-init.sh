#/bin/bash

echo "========================================="
echo " Construindo imagens e containers docker"
echo "========================================="

echo "Passos:"

chmod +x libs-check.sh
./libs-check.sh

# Creating docker-images from Dockerfiles...
echo "Criando imagem do NodeJS..."
docker build -t nodejs-basilios ./node > /dev/null
echo "docker-image do NodeJS criada"

echo "Criando imagem do Java"
docker build -t java-basilios ./java > /dev/null
echo "docker-image do Java criada"

echo "Criando imagem do MySQL"
docker build -t mysql-basilios ./mysql > /dev/null
echo "docker-image do MySQL criada"

# Iniciando os containerns com docker-compose
