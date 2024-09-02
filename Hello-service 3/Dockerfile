FROM openjdk:17
EXPOSE 9550
ARG JAR_FILE=target/Hello-service-0.0.1-SNAPSHOT.jar
COPY ${JAR_FILE} hello-service.jar
ENTRYPOINT ["java","-jar","/hello-service.jar","--spring.profiles.active=docker"]