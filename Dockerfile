FROM maven:3.6.3-openjdk-8 AS maven

RUN mkdir /usr/local/hello-octapus
WORKDIR /usr/local/hello-octapus

COPY pom.xml ./
COPY resources/ ./resources
RUN mvn -B dependency:go-offline

COPY src ./src
RUN mvn -B -DskipTests package shade:shade


FROM openjdk:8-jre-alpine

ARG VERSION
ENV VERSION ${VERSION}

RUN mkdir /usr/local/hello-octapus
WORKDIR /usr/local/hello-octapus

COPY --from=maven /usr/local/hello-octapus/target/hello-octapus-${VERSION}.jar ./
COPY docker-command.sh ./

CMD ["./docker-command.sh"]
