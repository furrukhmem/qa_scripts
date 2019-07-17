FROM node as nod

WORKDIR /build

COPY . .

RUN npm install

RUN npm run build

FROM nginx

WORKDIR /usr/share/html

COPY --from=nod /build/dist/poolmanger-ui /usr/share/nginx/html

expose 80
