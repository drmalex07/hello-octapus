FROM openjdk:8-jdk

ARG VERSION
ENV VERSION ${VERSION}

RUN mkdir /usr/local/hello-octapus
WORKDIR /usr/local/hello-octapus

COPY target/hello-octapus-${VERSION}.jar ./
COPY docker-entrypoint.sh ./

CMD ["./docker-entrypoint.sh"]
