## Stage 1: Build Angular application ##
FROM node:8 as builder

COPY bootstrapapp /bootstrapapp
WORKDIR /bootstrapapp

RUN npm install
RUN $(npm bin)/ng build

## Stage 2: Run nginx to serve application ##
FROM nginx
COPY --from=builder /bootstrapapp/dist/* /usr/share/nginx/html/

EXPOSE 80
