FROM anapsix/alpine-java

MAINTAINER nicolas@lrqdo.fr

RUN apk update \
    && apk add ca-certificates wget \
    && update-ca-certificates

WORKDIR /home

RUN wget https://crowdin.com/downloads/crowdin-cli.zip

RUN mkdir crowdin-cli && \
    unzip crowdin-cli.zip -d crowdin-cli

RUN cd crowdin-cli/$(ls crowdin-cli) && \
    cp crowdin-cli.jar /usr/local/bin/crowdin-cli.jar && \
    echo "java -jar /usr/local/bin/crowdin-cli.jar" > /usr/local/bin/crowdin && \
    chmod +x /usr/local/bin/crowdin

ENTRYPOINT crowdin    
