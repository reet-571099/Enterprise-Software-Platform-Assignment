# **Microservices with Java Spring Boot, Docker, and Minikube**

## **Table of Contents**

## 

1\.[Setting Up the Development Environment](\#setting-up-the-development-environment)

2\.[Creating the Microservices](\#creating-the-microservices)

3\.[Containerizing the Microservices with Docker](\#containerizing-the-microservices-with-docker)

4\.[Deploying the Application on Kubernetes](\#deploying-the-application-on-kubernetes)

5\.[Testing and Integration](\#testing-and-integration)

##

## **Setting Up the Development Environment** {#setting-up-the-development-environment}

### **Choose a Programming Language and Framework**

Java with Spring Boot

### **Set Up Your Development Environment**

1. **Install Necessary Tools :**  
   Java JDK   
   Maven   
   Docker   
   Minikube 

## **Creating the Microservices** {#creating-the-microservices}

1.Go to [Spring Initializr](https://start.spring.io/), and generate a new Spring Boot project with the following steps:

* **Project:** Maven Project  
* **Language:** Java  
* **Spring Boot Version:** 3.x (latest stable version)  
* **Project Metadata:**  
  * **Group:** com.Hello  
  * **Artifact:** hello-service (for the Hello Service) or world-service (for the World Service)  
  * **Name:** hello-service (for the Hello Service) or world-service (for the World Service)  
  * **Description:** A simple microservice for \[Hello/World\] service  
  * **Package Name:** com.example.helloservice (for the Hello Service) or com.example.worldservice (for the World Service)  
  * **Packaging:** Jar  
  * **Java Version:** 17  
* **Dependencies:**  
  * **Spring Web**

2.Click **Generate** to download a ZIP file of the project.

3.Extract the downloaded ZIP file and open it in your IDE (e.g., IntelliJ IDEA).

**Add Endpoints:**

**@GetMapping("/hello")**

**public String sayHello() {**

   **return "Hello";**

**}**

Run application locally to test /hello api 

## **Containerizing the Microservices with Docker** {#containerizing-the-microservices-with-docker}

1. **Create Dockerfiles:**  
   **FROM openjdk:17**  
   **EXPOSE 9550**  
   **ARG *JAR\_FILE*\=target/Hello-service-0.0.1\-SNAPSHOT.jar**  
   **COPY ${*JAR\_FILE*} hello-service.jar**  
   **ENTRYPOINT \["java","-jar","/hello-service.jar","--spring.profiles.active=docker"\]**  
   

**2\. Create and  build Docker images**

1.docker build \-t world-service \-f hello.Dockerfile .  
2.docker network create myhellonetwork

**3\. Run Docker services locally and test :** 

docker run \-d \--name world-container \--network myhellonetwork \-p 9550:9550 hello-service

Test service on http://localhost:9550/hello

4\. **Push on Docker hub registry** 

1.docker tag hello-service:latest reetkhanchandani/hello-service:latest  
2.docker push reetkhanchandani/hello-service:latest

## **Deploying the Application on Kubernetes** {#deploying-the-application-on-kubernetes}

**1.Set Up a Kubernetes Cluster:**

minikube start

**2.Create Kubernetes Manifests:**

* **Deployment and Service for Hello Service:** `hellokube.yaml`

**Apply Kubernetes Manifests:** 

$ kubectl apply \-f hellokube.yaml

**Ensure both services are accessible through Kubernetes services :**

$ Kubectl get services

**To start the service :** 

minikube service hello-service \--url

## **Testing and Integration** {#testing-and-integration}

**Test the Hello and World services** individually on the post given by above command to ensure they return the correct responses.

**Create a simple script or service** that calls both endpoints and prints "Hello World".

Create a script which calls both the service endpoints  

**Run the Script on bash :** 

$ ./hello\_world.sh

