###
# build
###
FROM quay.io/keycloak/keycloak:19.0.1 as builder

RUN /opt/keycloak/bin/kc.sh build

###
# exec
###
FROM quay.io/keycloak/keycloak:19.0.1

ENV KC_HTTP_PORT=8080
ENV KEYCLOAK_ADMIN=admin
ENV KEYCLOAK_ADMIN_PASSWORD=password

COPY --from=builder /opt/keycloak/lib/quarkus/ /opt/keycloak/lib/quarkus/
COPY --from=builder /opt/keycloak/providers/   /opt/keycloak/providers/
WORKDIR /opt/keycloak

USER root

## install RPMs
## timezone
RUN microdnf install -y tzdata
RUN ln -sf /usr/share/zoneinfo/Asia/Tokyo /etc/localtime

RUN microdnf clean all

## import 
ADD export.json /opt/keycloak/import/
RUN /opt/keycloak/bin/kc.sh import --file /opt/keycloak/import/export.json

## log
RUN mkdir -p /opt/keycloak/logs

## é¿çs
ENTRYPOINT ["/opt/keycloak/bin/kc.sh", "start-dev"]
