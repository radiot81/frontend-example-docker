FROM ubuntu:18.04

ENV API_URL=http://localhost:8000
WORKDIR mydir
COPY . .
# RUN ls -la . 
# previous command we use to check if files are copied
# need to copy files before npm install

RUN apt-get update && apt-get install -y curl ca-certificates && \ 
	curl -sL https://deb.nodesource.com/setup_10.x | bash && apt-get install -y nodejs && \ 
	npm install && \
	npm install -g serve && \ 
	apt-get purge -y --auto-remove curl && \ 
    rm -rf /var/lib/apt/lists/*


EXPOSE 5000

CMD npm start