FROM maven:3.9.5-eclipse-temurin-17 AS build
COPY . .
RUN mvn clean package -DskipTests

FROM openjdk:17.0.1-jdk-slim
COPY --from=build /target/Finance_Planning_Application-0.0.1-SNAPSHOT.jar Finance_Planning_Application.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "Finance_Planning_Application.jar"]
