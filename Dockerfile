# Use an official Node.js runtime as a base image
FROM node:18-alpine

# Set the working directory
WORKDIR /app

# Set environment variables
ENV NODE_ENV=production

# docker image name and tag
ARG DOCKER_IMAGE_NAME="asiaticesports-frontend"
ARG DOCKER_IMAGE_TAG="development"

# Add labels
# LABEL maintainer="Your Name <your.email@example.com>"
# LABEL version="1.0"
# LABEL description="Description of your application."

# Copy package.json and package-lock.json to the working directory
COPY package*.json ./

# Install project dependencies
RUN npm install

# Copy the rest of the application code to the working directory
COPY . .

# Build the React app
RUN npm run build

# Expose the port that the app will run on
EXPOSE 3000

# Command to run the application
CMD ["npm", "start"]
