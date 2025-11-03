#!/bin/bash

# Checking all dependencies we need to run our project
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

echo "========================================="
echo "  Verificando dependências do sistema"
echo "========================================="

echo "Passos que serão executados:"
echo "  1. Verificar e instalar Git"
echo "  2. Verificar e instalar Java (OpenJDK 17)"
echo "  3. Verificar e instalar NodeJS (LTS)"
echo "  4. Verificar e instalar MySQL"
echo "  5. Verificar e instalar Docker"

# Checking git
echo "[-] Verificando Git..."
if command_exists git; then
    echo "✓ Git já está instalado: $(git --version)"
else
    echo "✗ Git não encontrado. Instalando..."
    sudo apt-get update
    sudo apt-get install -y git

    if command_exists git; then
        echo "✓ Git instalado com sucesso: $(git --version)"
    else
        echo "✗ Falha ao instalar Git"
    fi
fi

# Checking java
echo "[-] Verificando Java..."
if command_exists java; then
    echo "✓ Java já está instalado: $(java -version 2>&1 | head -n 1)"
else
    echo "✗ Java não encontrado. Instalando Java 21..."
    sudo apt-get update
    sudo apt-get install -y openjdk-21-jdk

    if command_exists java; then
        echo "✓ Java instalado com sucesso: $(java -version 2>&1 | head -n 1)"
    else
        echo "✗ Falha ao instalar Java"
    fi
fi

# Checking node
echo "[-] Verificando Node.js..."
if command_exists node; then
    echo "✓ Node.js já está instalado: $(node --version)"
    echo "✓ npm: $(npm --version)"
else
    echo "✗ Node.js não encontrado. Instalando via NodeSource (LTS)..."
    curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
    sudo apt-get install -y nodejs

    if command_exists node; then
        echo "✓ Node.js instalado com sucesso: $(node --version)"
        echo "✓ npm: $(npm --version)"
    else
        echo "✗ Falha ao instalar Node.js"
    fi
fi

# Checking mysl
echo "[-] Verificando MySQL..."
if command_exists mysql; then
    echo "✓ MySQL já está instalado: $(mysql --version)"
else
    echo "✗ MySQL não encontrado. Instalando MySQL Server..."
    sudo apt-get update
    sudo apt-get install -y mysql-server

    if command_exists mysql; then
        echo "✓ MySQL instalado com sucesso: $(mysql --version)"
        echo "! Execute 'sudo mysql_secure_installation' para configurar a segurança"

        # Iniciar e habilitar MySQL
        sudo systemctl start mysql
        sudo systemctl enable mysql
        echo "✓ MySQL iniciado e habilitado no boot"
    else
        echo "✗ Falha ao instalar MySQL"
    fi
fi

# Checking docker
echo "[-] Verificando Docker..."
if command_exists docker; then
    echo "✓ Docker já está instalado: $(docker --version)"
else
    echo "✗ Docker não encontrado. Instalando Docker..."

    # Remover versões antigas
    sudo apt-get remove -y docker docker-engine docker.io containerd runc 2>/dev/null

    # Instalar dependências
    sudo apt-get update
    sudo apt-get install -y \
        ca-certificates \
        curl \
        gnupg \
        lsb-release

    # Adicionar chave GPG oficial do Docker
    sudo mkdir -p /etc/apt/keyrings
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

    # Configurar repositório
    echo \
      "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
      $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

    # Instalar Docker Engine
    sudo apt-get update
    sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

    if command_exists docker; then
        echo "✓ Docker instalado com sucesso: $(docker --version)"

        # Adicionar usuário atual ao grupo docker
        sudo usermod -aG docker $USER
        echo "! Faça logout e login novamente para usar Docker sem sudo"

        # Iniciar e habilitar Docker
        sudo systemctl start docker
        sudo systemctl enable docker
        echo "✓ Docker iniciado e habilitado no boot"
    else
        echo "✗ Falha ao instalar Docker"
    fi
fi

# Mostrando o resumo:
echo "========================================="
echo "           RESUMO DA INSTALAÇÃO"
echo "========================================="
echo ""

command_exists git && echo "✓ Git: $(git --version)" || echo "✗ Git: não instalado"
command_exists java && echo "✓ Java: $(java -version 2>&1 | head -n 1)" || echo "✗ Java: não instalado"
command_exists node && echo "✓ Node.js: $(node --version) | npm: $(npm --version)" || echo "✗ Node.js: não instalado"
command_exists mysql && echo "✓ MySQL: $(mysql --version)" || echo "✗ MySQL: não instalado"
command_exists docker && echo "✓ Docker: $(docker --version)" || echo "✗ Docker: não instalado"

echo ""
echo "========================================="
echo "Checagem concluída!"
echo "========================================="
