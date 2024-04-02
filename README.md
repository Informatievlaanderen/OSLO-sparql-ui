# Sparql-ui
A microserver which serves a YASGUI frontend to a configurable SPARQL endpoint.
Contains data.vlaanderen.be styling.

  - http://yasgui.org/
  - https://github.com/OpenTriply/
  - (versie 2.11.x)

## Caddy templates notes

The templates directive must be set specifically on the files it should apply, otherwise it does not work.


## Options
* SPARQL_ENDPOINT: The url the client should use to reach the sparql endpoint (not the internal IP)
                   It must be the https version.

## Usage
```bash
docker run -p "80:80" -e "SPARQL_ENDPOINT=http://data.vlaanderen.be" registry.gitlab.com/oslo2/sparql-ui
```

