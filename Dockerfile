FROM informatievlaanderen/caddyserver:sui
#FROM caddy:2.7.6-alpine

EXPOSE 80
EXPOSE 443

ENV SPARQL_ENDPOINT=https://data.vlaanderen.be/sparql

COPY Caddyfile /config/Caddyfile
COPY yasgui.min.css /www/yasgui.min.css
COPY yasgui.min.js /www/yasgui.min.js
COPY index.html /www/index.html
ADD run.sh run.sh

CMD ["./run.sh"]
