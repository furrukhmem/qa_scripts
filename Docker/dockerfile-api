FROM node

WORKDIR /usr/src/app

COPY package*.json ./

RUN npm install

COPY . .

expose 8888

CMD [ "node", "index.js" ]