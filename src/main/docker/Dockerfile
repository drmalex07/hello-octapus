FROM adoptopenjdk/maven-openjdk11 AS maven

RUN mkdir /usr/local/hello-octapus
WORKDIR /usr/local/hello-octapus

COPY pom.xml ./
COPY resources/ ./resources
RUN mvn -B dependency:go-offline

COPY src ./src
RUN mvn -B -DskipTests package shade:shade


FROM adoptopenjdk/openjdk11:x86_64-alpine-jdk-11.0.19_7-slim

ARG git_url=
ARG git_commit=
ARG git_tags=
ARG git_build_time=

RUN mkdir /usr/local/hello-octapus
WORKDIR /usr/local/hello-octapus

COPY --from=maven /usr/local/hello-octapus/target/hello-octapus.jar ./

ENV GIT_URL="${git_url}" \
    GIT_COMMIT="${git_commit}" \
    GIT_TAGS="${git_tags}" \
    GIT_BUILD_TIME="${git_build_time}"

CMD ["java", "-jar", "hello-octapus.jar"]
