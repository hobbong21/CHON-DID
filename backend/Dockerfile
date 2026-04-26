# Stage 1: Build
FROM eclipse-temurin:21-jdk AS build
WORKDIR /app
COPY pom.xml .
COPY src ./src
RUN apt-get update && apt-get install -y maven && \
    mvn -q -DskipTests package

# Stage 2: Runtime
FROM eclipse-temurin:21-jre
WORKDIR /app

# Create directory for image storage
RUN mkdir -p /data/chon-images

COPY --from=build /app/target/mcrs-api-*.jar app.jar

# Default environment variables
ENV SPRING_PROFILES_ACTIVE=dev
ENV ROOT_FOLDER_IMAGE=/data/chon-images
ENV LOG_FILE_PATH=/app/logs/chon-logs.log

EXPOSE 8888

# Health checks are handled by ALB target group, not Docker HEALTHCHECK.
# Docker-level HEALTHCHECK can conflict with ECS deployment controller.

ENTRYPOINT ["java", "-jar", "app.jar"]
