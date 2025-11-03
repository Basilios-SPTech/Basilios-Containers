#/bin/bash

# Creating docker-images from Dockerfiles...
echo 'Creating NodeJS docker-image...'
docker build -t nodejs-basilios ./node > /dev/null
echo 'NodeJS image succesfully created'

echo 'Creating Java docker-image...'
docker build -t java-basilios ./java > /dev/null
echo 'Java image succesfully created'

echo 'Creating MySQL docker-image...'
docker build -t mysql-basilios ./mysql > /dev/null
echo 'MySQL image succesfully created'
