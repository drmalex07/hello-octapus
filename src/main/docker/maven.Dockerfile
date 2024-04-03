FROM adoptopenjdk/maven-openjdk11

RUN mkdir /usr/local/hello-octapus
WORKDIR /usr/local/hello-octapus

COPY pom.xml ./
COPY resources/ ./resources
RUN mvn -B dependency:go-offline

COPY src ./src
RUN mvn -B -DskipTests package shade:shade
