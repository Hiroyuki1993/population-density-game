FROM node:16.20.0-alpine3.17 as build-stage

WORKDIR /app
COPY ./package*.json ./
COPY ./yarn.lock ./
RUN yarn install
COPY ./ ./
RUN yarn run build

FROM nginx:1.17.10-alpine as production-stage

RUN mkdir /app
COPY --from=build-stage /app/dist /app
COPY nginx.conf /etc/nginx/nginx.conf
