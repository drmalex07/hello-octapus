FROM maven:3.6.3-openjdk-8 AS maven

ARG VERSION
ENV VERSION ${VERSION}

RUN mkdir /usr/local/hello-octapus
WORKDIR /usr/local/hello-octapus

COPY pom.xml ./
COPY src ./src
COPY resources/ ./resources
RUN mvn dependency:go-offline

RUN mvn package shade:shade
RUN ls -hal target 


FROM openjdk:8-jre-alpine

ARG VERSION
ENV VERSION ${VERSION}

RUN mkdir /usr/local/hello-octapus
WORKDIR /usr/local/hello-octapus

COPY --from=maven /usr/local/hello-octapus/target/hello-octapus-${VERSION}.jar ./
COPY docker-command.sh ./

CMD ["./docker-command.sh"]
