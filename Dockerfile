# FROM node:current-alpine
FROM node:16.5-alpine

EXPOSE 80
# port 3000 par défaut

# use tini to init new processes
RUN    apk add --update tini \
    && mkdir -p /usr/src/app

COPY package.json package.json

RUN npm i \
    && npm cache clean

COPY . .

CMD ["tini", "--", "node", "./bin/www"]