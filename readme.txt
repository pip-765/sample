

docker build ./sample-keycloak/   -t sample-keycloak
docker build ./sample-httpd-oidc/ -t sample-httpd-oidc
docker build ./sample-lb-dev/     -t sample-lb-dev

docker run -d -p 8080:8080 -p 8787:8787 --name sample-keycloak sample-keycloak
docker run -d -p 80:80 --add-host=sso.sample-fb.fujifilm.internal:192.168.65.2 --name sample-httpd-oidc sample-httpd-oidc

docker run -d -p 80:80 --network sample --name sample-lb-dev sample-lb-dev

