FROM maven:3-eclipse-temurin-21-noble AS build
COPY . .
RUN mvn clean package -DskipTests

FROM  eclipse-temurin:21-alpine
COPY --from=build /target/*.jar green-mart-backend.jar
ENTRYPOINT ["java", "-jar", "green-mart-backend.jar"]