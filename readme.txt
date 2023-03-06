

docker build ./sample-keycloak/   -t sample-keycloak
docker build ./sample-proxy/      -t sample-proxy
docker build ./sample-httpd-oidc/ -t sample-httpd-oidc
docker build ./sample-lb-dev/     -t sample-lb-dev


docker run -d -p 80:8080 --add-host=keycloakdb.sample-fb.zzzzzzzz.internal:192.168.65.2 --name sample-keycloak sample-keycloak


管理コンソール
http://sso.sample-fb.zzzzzzzz.com

アプリアクセス
http://app.sample-fb.zzzzzzzz.com/auth

トークン発行
curl -X POST http://localhost:18080/realms/sample/protocol/openid-connect/token -d "grant_type=password&client_id=sample-client&client_secret=oCBp0Oxbe4a6ji4vUvNsboqr7GkuGKba&username=u001&password=password" | jq .

確認
curl -X POST http://localhost:28080/realms/sample/protocol/openid-connect/token/introspect -d "client_id=sample-client&client_secret=oCBp0Oxbe4a6ji4vUvNsboqr7GkuGKba&token=" | jq .


