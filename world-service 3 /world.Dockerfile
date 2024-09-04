FROM openjdk:17
EXPOSE 8080
ARG JAR_FILE=target/World-service-0.0.1-SNAPSHOT.jar
COPY ${JAR_FILE} world-service.jar
ENTRYPOINT ["java","-jar","/world-service.jar","--spring.profiles.active=docker"]
