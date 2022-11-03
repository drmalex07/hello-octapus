# vim: set syntax=dockerfile:

FROM maven:3.6.3-openjdk-8 AS maven

WORKDIR /build

COPY pom.xml ./
RUN mvn -B dependency:go-offline
