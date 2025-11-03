FROM amazoncorretto:21-alpine

WORKDIR /app

# Copying the built project to our image
COPY app-name .

# Installing Maven
RUN apk add --no-cache maven

# Exposing port 8080
# WARN: It should not be here, but we gonna leave it here until everything is okay
EXPOSE 8080

# Running our app
CMD ["java", "-jar", "target/*.jar"]
