# ViPLab-Docker-Dev-Env

## Prerequisites

Before you can start the Application, you have to download and install *Docker* and *Docker Compose*.
After completing this step, you can follow the instructions below.

## Build

First create the JSON Web Keys for the JWT singing and verification.
```
docker run --rm ghcr.io/legion2/json-web-key-generator jwk-generator -t RSA -s 2048 -S -p -i mykeyid
```
Copy the two json objects into a private and public key file named `jwks.json` and `jwks.private.json` and add them to the cloned repository.

After creating the keys, run `docker compose build`.
Every config change require a rebuild of the docker images.

## Start all applications
To Start the applications:
```
docker compose up -d
```

To view all logs:
```
docker compose logs -f
```

## Profiles

| Profile | Description |
| --------| ----------- |
| standalone | Start ViPLab-Frontend |
| s3 | Use S3 for large Result-Files |
| darus | Use the DaRUS-ViPLab-Connector |
| dummy | Use the Dummy-Backend for Testing |

### Example

To enable a profile, use `--profile` in the `docker compose up`-command, like this:

```
docker compose --profile standalone --profile s3 up
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

* url: http://localhost
