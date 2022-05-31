# BUILD JAVA BACK
FROM maven:adoptopenjdk as build

WORKDIR /home/lab

COPY pom.xml .
RUN mvn verify -DskipTests --fail-never

COPY src ./src
RUN mvn verify

# RUN JAVA BACK
FROM adoptopenjdk:8-jre

ENTRYPOINT ["java", "-Xmx8m", "-Xms8m", "-jar", "/app/words.jar"]
EXPOSE 8080

WORKDIR /app
COPY --from=build /home/lab/target .

#BUILD
FROM golang:1.16-alpine as builder

COPY dispatcher.go .

RUN go build dispatcher.go

#RUN

#TOUJOURS PRECISER UNE VERSION / TAG
FROM alpine:3.16.0

EXPOSE 80
CMD [ "/dispatcher" ] 

COPY --from=builder /go/dispatcher /
COPY static /static/

# Test actions

FROM postgres:10.0-alpine

# entryPoint defini par postgres
COPY words.sql /docker-entrypoint-initdb.d/

# new test





