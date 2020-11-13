

## Build
First create the JSON Web Keys for the JWT singing and verification.
```
docker run --rm legion2/json-web-key-generator jwk-generator -t RSA -s 2048 -S -p -i iliaskey
```
Copy the two json objects into a private and public key file named `jwks.json` and `jwks.private.json`.

After creating the keys, run `docker-compose build`.
Every config change require a rebuild of the docker images.

## Start all applications
To Start the applications:
```
docker-compose up -d
```

To view all logs:
```
docker-compose logs -f
```

## Services

### Ilias

* url: http://localhost:8082
* Login: root
* Password: password

### websocket-api

* url: http://localhost:8083

### activemq

* url: http://localhost:8084/console/login
* Username: user
* Password: password

### Standalone frontend

* url: http://localhost:8085
