FROM adoptopenjdk/maven-openjdk11 AS maven

RUN mkdir /usr/local/hello-octapus
WORKDIR /usr/local/hello-octapus

COPY pom.xml ./
COPY resources/ ./resources
RUN mvn -B dependency:go-offline

COPY src ./src
RUN mvn -B -DskipTests package shade:shade


FROM adoptopenjdk/openjdk11:x86_64-alpine-jdk-11.0.19_7-slim

RUN mkdir /usr/local/hello-octapus
WORKDIR /usr/local/hello-octapus

COPY --from=maven /usr/local/hello-octapus/target/hello-octapus.jar ./

CMD ["java", "-jar", "hello-octapus.jar"]
