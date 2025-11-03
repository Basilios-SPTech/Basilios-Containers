#/bin/bash

# Cloning our ReactJS app into our EC2
echo 'Cloning github ReactJS project'
git clone https://github.com/Basilios-SPTech/Basilios---Projeto-de-PI-.git > /dev/null
mv Basilios---Projeto-de-PI- ./node

# Creating docker-images from Dockerfiles...
echo 'Creating NodeJS docker-image...'
docker build -t nodejs-basilios ./node /dev/null
echo 'NodeJS image succesfully created'

echo 'Creating Java docker-image...'
docker build -t java-basilios ./java > /dev/null
echo 'Java image succesfully created'

echo 'Creating MySQL docker-image...'
docker build -t mysql-basilios ./mysql /dev/null
echo 'MySQL image succesfully created'
