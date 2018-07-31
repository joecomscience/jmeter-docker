FROM openjdk:8-jre-alpine3.8

LABEL maintainer="joewalker<joeteerawit@gmail.com>"

ARG TZ="Asia/Bangkok"
ENV HEAP="-Xms512m -Xmx512m -XX:MaxMetaspaceSize=256m"
ENV DISPLAY=":0.0"

RUN apk update --no-cache && \
    apk upgrade --no-cache && \
    apk add ca-certificates && \
    update-ca-certificates && \
    wget http://www-eu.apache.org/dist//jmeter/binaries/apache-jmeter-4.0.tgz -P /home && \
    mkdir -p /opt && \
    tar xvzf /home/apache-jmeter-4.0.tgz -C /opt && \
    cd /opt && \
    mv apache-jmeter-4.0 apache-jmeter && \
    rm /home/apache-jmeter-4.0.tgz && \
    mkdir -p /jmeter

ENV PATH=$PATH:/opt/apache-jmeter/bin

WORKDIR jmeter
COPY . .

RUN chmod +x run.sh

ENTRYPOINT [ "/run.sh" ]