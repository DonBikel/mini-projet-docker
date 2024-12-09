FROM maven:3.8.6-eclipse-temurin-17 AS build

# Définit le répertoire de travail
WORKDIR /app

# Copie les fichiers pom.xml et les sources dans le conteneur
COPY pom.xml .
COPY src ./src

# Compile le projet et génère le JAR
RUN mvn clean package -DskipTests

FROM amazoncorretto:17-alpine
LABEL maintainer="Bikel"  email="keumekabik@gmail.com"
RUN apk update && apk upgrade

#repertoire de travail
WORKDIR /app

# Copie le JAR généré depuis l'étape de construction
COPY --from=build /app/target/*.jar app.jar

# Exposer le port 8080
EXPOSE 8080

# Démarrer l'appilcation Java
CMD [ "java", "-jar", "paymybuddy.jar" ]

