# magister-authcode

Magister auth code fetcher. Stores the latest auth code in a gist.

## Usage

Docker-compose:

```yaml
magister_authcode:
  image: robbertkl/magister-authcode
  restart: always
  environment:
    GITHUB_USER: xxxxxxxx
    GITHUB_TOKEN: xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
    GIST_ID: xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
    GIST_FILE: authcode.json
    INTERVAL: 3600
```
