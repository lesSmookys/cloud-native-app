# BUILD JAVA BACK
FROM maven:adoptopenjdk as build

WORKDIR /home/lab

COPY /words/pom.xml .
RUN mvn verify -DskipTests --fail-never

COPY /words/src ./src
RUN mvn verify

# RUN JAVA BACK
FROM adoptopenjdk:8-jre

ENTRYPOINT ["java", "-Xmx8m", "-Xms8m", "-jar", "/app/words.jar"]
EXPOSE 8080

WORKDIR /app
COPY --from=build /home/lab/target .

# Test actions 1 !





