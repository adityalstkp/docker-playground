FROM node:10-alpine

WORKDIR /app

# rule of thumb, if less frequent for changes put it up here
COPY .env /app/.env
COPY package.json /app/package.json
COPY yarn.lock /app/yarn.lock

RUN yarn

COPY app.js /app/app.js
COPY config.js /app/config.js

CMD ["node", "app.js"]