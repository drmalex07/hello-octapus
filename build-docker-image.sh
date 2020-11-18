#!/bin/bash 
docker build --build-arg VERSION=${ARTIFACT_VERSION} -t local/hello-octapus:${ARTIFACT_VERSION} .
