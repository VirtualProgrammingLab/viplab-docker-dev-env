

## Build

To build all Docker images access to the private TIK GitHub repositories is required.
Therefore a GitHub access token with `repo` scope is required.
So [generate a new token](https://github.tik.uni-stuttgart.de/settings/tokens) and create the `.env` file and add the token like a environment variable.
```
GITHUB_TOKEN=<token>
```

After adding the token, run `docker-compose build`

## Login

### Ilias
Login: root

Password: password
