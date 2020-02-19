

## Build
First create the JSON Web Keys for the JWT singing and verification.
```
docker run --rm legion2/json-web-key-generator jwk-generator -t RSA -s 2048 -S -p -i iliaskey
```
Copy the two json objects into a private and public key file named `jwks.json` and `private.jwks.json`.

After adding the token, run `docker-compose build`

## Login

### Ilias
Login: root

Password: password
