FROM amazoncorretto:21-alpine

WORKDIR /app

# Copying the built project to our image
COPY . .

# Installing Maven and building the project
RUN apk add --no-cache maven && mvn package -DskipTests

# Exposing port 8081
EXPOSE 8081

# Running our app
CMD ["sh", "-c", "java -jar target/*.jar"]
