#/bin/bash

echo "========================================="
echo " Construindo imagens e containers docker"
echo "========================================="

echo "Passos que serão executados:"
echo "  1. Rodar o script de verificação de dependências"
echo "  2. Criar docker-image de NodeJS"
echo "  3. Criar docker-image de Java"
echo "  4. Criar docker-image de MySQL"
echo "  5. Iniciar os containers com o docker-compose"
echo "  6. Resumo"

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

# Iniciando os containers com docker-compose
echo "Iniciando containers com docker-compose..."
docker-compose up -d

# Resumo da execução
if [ $? -eq 0 ]; then
    echo ""
    echo "========================================="
    echo " Deploy concluído com sucesso!"
    echo "========================================="
    echo ""
    echo "Serviços disponíveis:"
    echo "  [-] MySQL:  localhost:3306"
    echo "  [-] Java:   localhost:8080"
    echo "  [-] NodeJS: localhost:3000"
    echo ""
    echo "Para ver os logs: docker-compose logs -f"
    echo "Para parar:       docker-compose down"
    echo "========================================="
else
    echo ""
    echo "✗ Falha ao iniciar containers"
    exit 1
fi
