FROM node:carbon
MAINTAINER Greg Fullard

# Update Timezone
ENV TZ=Africa/Johannesburg
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Define location for app - This should NOT be changed
ENV APP_HOME /usr/src/app

# Create app directory
WORKDIR /usr/src/app

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
COPY package*.json ./

RUN npm install
# If you are building your code for production
# RUN npm install --only=production

RUN npm install -g supervisor nodemon

VOLUME ["$APP_HOME"]

# Bundle app source
COPY . .

EXPOSE 8080

CMD supervisor server.js