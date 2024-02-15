# Use an official Node.js runtime as a base image
FROM node:18-alpine

WORKDIR /usr/src/docker-react-sample

ENV NODE_ENV=production

ARG DOCKER_IMAGE_NAME="asiaticesports-frontend:development"

ARG NETWORK_NAME="asiaticesports-networks"

COPY package*.json ./

RUN npm install

COPY . .

RUN npm run build

EXPOSE 3000

CMD ["npm", "start"]
