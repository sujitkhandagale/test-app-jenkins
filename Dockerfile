# Use an official Node.js runtime as a base image
FROM node:18-alpine

WORKDIR /usr/src/app

ENV NODE_ENV=production

ARG DOCKER_IMAGE_NAME="asiaticesports-frontend"
ARG DOCKER_IMAGE_TAG="development"

COPY package*.json ./

RUN npm install

COPY . .

RUN npm run build

EXPOSE 3000

CMD ["npm", "start"]
