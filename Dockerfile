# Specify a base image
FROM node:alpine

# Establish the working directory for the container (where to copy project files)
WORKDIR /usr/app

# Install dependencies -> the COPY ./ ./ is because our local files of index.js and package.json are not 
# automatically available in the docker container
COPY ./package.json ./      
RUN npm install

# Now copy the source code -> this separate step to avoid full rebuild of node modules for source code changes
COPY ./ ./

# Default command
CMD ["npm", "start"]