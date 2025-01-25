# Use the official Node.js image as the base image
FROM node:16-alpine

# Set the working directory inside the container
WORKDIR /usr/src/app

# Copy package.json and package-lock.json into the container
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy all application files to the working directory
COPY .. .

# Expose the application port
EXPOSE 3000

# Command to start the application
CMD ["npm", "start"]