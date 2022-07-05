FROM node:16-alpine as base

WORKDIR /var/www

COPY package*.json /var/www

EXPOSE ${PORT}

FROM base as production
ENV NODE_ENV=production
RUN npm ci
COPY . /var/www/
CMD ["node", "app/index.js"]

FROM base as dev
ENV NODE_ENV=development
RUN npm install -g nodemon 
RUN npm install
COPY . /var/www/
CMD ["nodemon", "app/index.js"]