###
# compile
###
FROM openjdk:11.0.16-jdk as compiler

WORKDIR /tmp

RUN git clone https://github.com/pip-765/sample-keycloak-ex.git

RUN cd sample-keycloak-ex && chmod 755 gradlew && ./gradlew build


###
# build
###
FROM quay.io/keycloak/keycloak:19.0.1 as builder

## configurations
ADD keycloak.conf  /opt/keycloak/conf/
ADD cache-ispn.xml /opt/keycloak/conf/

## extentions
#ADD *.jar /opt/keycloak/providers/
COPY --from=compiler /tmp/sample-keycloak-ex/lib/build/libs/*.jar  /opt/keycloak/providers/

RUN /opt/keycloak/bin/kc.sh build


###
# exec
###
FROM quay.io/keycloak/keycloak:19.0.1

ENV KC_HTTP_PORT=8080
ENV KEYCLOAK_ADMIN=admin
ENV KEYCLOAK_ADMIN_PASSWORD=password

#COPY --from=builder /opt/keycloak/lib/quarkus/ /opt/keycloak/lib/quarkus/
#COPY --from=builder /opt/keycloak/providers/   /opt/keycloak/providers/
COPY --from=builder /opt/keycloak/  /opt/keycloak/
WORKDIR /opt/keycloak

USER root

## install RPMs
## timezone
RUN microdnf install -y tzdata
RUN ln -sf /usr/share/zoneinfo/Asia/Tokyo /etc/localtime

## nslookup
RUN microdnf install -y bind-utils

RUN microdnf clean all

## import 
#ADD export.json /opt/keycloak/import/
#RUN /opt/keycloak/bin/kc.sh import --file /opt/keycloak/import/export.json

## log
#RUN mkdir -p /opt/keycloak/logs

## 実行
ENTRYPOINT ["/opt/keycloak/bin/kc.sh", "start-dev"]

