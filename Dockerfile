# Usamos una imagen base con JDK 22
FROM openjdk:21-slim

# Establecemos el directorio de trabajo dentro del contenedor
WORKDIR /app

# Copiamos los archivos de Gradle y el archivo de configuración del wrapper
COPY gradlew /app/gradlew
COPY gradlew.bat /app/gradlew.bat
COPY gradle /app/gradle

# Copiamos los archivos del proyecto
COPY . /app

# Damos permisos de ejecución al script de Gradle
RUN chmod +x ./gradlew

# Establecemos las variables de entorno necesarias
ENV AUTH0_AUDIENCE=http://ejemploapi
ENV AUTH0_ISSUER_URI=https://dev-ivcgfpif76bc7frn.us.auth0.com/
ENV CORS_ALLOWED_ORIGINS=https://auth0-front-seven.vercel.app/
ENV SPRING_SECURITY_LOG_LEVEL=INFO
ENV WEB_SECURITY_DEBUG=true

# Deshabilitar el daemon de Gradle
RUN echo "org.gradle.daemon=false" >> /app/gradle.properties

# Construimos el proyecto, deshabilitando el daemon de Gradle
RUN ./gradlew --no-daemon clean build

# Exponemos el puerto en el que la aplicación va a correr
EXPOSE 8080

# Definimos el comando para correr la aplicación
CMD ["./gradlew", "bootRun", "--no-daemon"]


