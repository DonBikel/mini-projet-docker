FROM amazoncorretto:17-alpine
LABEL maintainer="Bikel"  email="keumekabik@gmail.com"
RUN apk update && apk upgrade

#repertoire de travail
WORKDIR /app

COPY ./target/paymybuddy.jar .

# Exposer le port 8080
EXPOSE 8080

# Démarrer l'appilcation Java
CMD [ "java", "-jar", "paymybuddy.jar" ]

