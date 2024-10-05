# Use the official Node.js image from the Docker Hub
FROM node:20

# Set the working directory in the container
WORKDIR /home/hellal/Documents/hello-world-node/my-node-app

# Copy package.json and package-lock.json (if available)
COPY package*.json ./

# Check directory contents for debugging
RUN ls -al

# Install the app's dependencies
RUN npm install

# Copy the rest of the application code
COPY . .

# Expose the port the app runs on
EXPOSE 3000

# Command to run the application
CMD ["node", "app.js"]

