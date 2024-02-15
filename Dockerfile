# Use an official Node.js runtime as a base image
FROM node:18-alpine

WORKDIR /usr/src/docker-react-sample

ENV NODE_ENV=production

COPY package*.json ./

RUN npm install

COPY . .

RUN npm run build

EXPOSE 3000

CMD ["npm", "start"]
