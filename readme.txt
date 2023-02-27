

docker build ./sample-keycloak/   -t sample-keycloak --add-host=keycloakdb.sample-fb.zzzzzzzz.internal:192.168.65.2
docker build ./sample-proxy/      -t sample-proxy
docker build ./sample-httpd-oidc/ -t sample-httpd-oidc
docker build ./sample-lb-dev/     -t sample-lb-dev


