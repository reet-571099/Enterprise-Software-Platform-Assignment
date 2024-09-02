FROM openjdk:17
EXPOSE 9550
ARG JAR_FILE=target/world-docker.jar
COPY ${JAR_FILE} world-docker.jar
ENTRYPOINT ["java","-jar","/world-docker.jar"]