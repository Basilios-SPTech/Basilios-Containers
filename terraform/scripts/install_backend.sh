#!/bin/bash

yum update -y

# Instala git + node
yum install -y git
curl -sL https://rpm.nodesource.com/setup_18.x | bash -
yum install -y nodejs

# Clona repo
cd /home/ec2-user
git clone https://github.com/Basilios-SPTech/Basilios-Backend.git

cd Basilios-Backend/basilios

# Instala dependências
npm install

# Roda app
nohup npm start > output.log 2>&1 &s
