FROM ubuntu:latest

# Install Node.js dependencies
RUN apt-get update && \
    apt-get install -y curl && \
    curl -fsSL https://deb.nodesource.com/setup_18.x | bash - && \
    apt-get install -y nodejs

# Define which files should be copied into the container image
COPY *.js .
COPY page.* .
COPY pictures/* /pictures/
COPY package.json .

# Load all dependencies
RUN npm install

# Define how the app is being started
EXPOSE 8080
CMD [ "node", "app.js" ]
