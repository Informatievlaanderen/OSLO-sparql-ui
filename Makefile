VERSION:=`cat VERSION`
PUBLISHEDIMAGE:=`cat PUBLISHED`


build:
	docker build --network host -f Dockerfile.Caddy -t informatievlaanderen/caddyserver:sui .
	docker build -f Dockerfile -t sparqlui:${VERSION} .


clean:
	docker rmi informatievlaanderen/caddyserver:sui
	docker rmi sparqlui:${VERSION}


example: 
	docker run -d --rm --name sui  -p 80:80 -p 2021:2020 -p 444:443 sparqlui:${VERSION}

example2: 
	docker run -d --name sui \
		-p 80:80 \
		-e "SPARQL_ENDPOINT=http://data.dev-vlaanderen.be/sparql" \
		-v ${CURDIR}:/data \
		--network host \
		sparqlui:${VERSION}
	#


stop:
	docker stop sui
	docker rm sui


publish:
	docker tag sparqlui:${VERSION} ${PUBLISHEDIMAGE}:${VERSION}
	docker push ${PUBLISHEDIMAGE}:${VERSION}

