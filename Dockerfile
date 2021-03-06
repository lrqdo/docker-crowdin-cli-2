FROM anapsix/alpine-java:latest

MAINTAINER nicolas@lrqdo.fr

# https://crowdin.com/downloads/crowdin-cli.zip
COPY bin/2.0.9/crowdin-cli.jar /usr/local/bin/crowdin-cli.jar

RUN mkdir /crowdin
VOLUME /crowdin
WORKDIR /crowdin

ENTRYPOINT ["java", "-jar", "/usr/local/bin/crowdin-cli.jar"]
