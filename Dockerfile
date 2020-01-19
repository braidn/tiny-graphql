FROM node:lts-alpine3.11
RUN npm i npm@latest -g
ENV NODE_ENV=production
RUN mkdir /opt/app && chown node:node /opt/app
WORKDIR /opt/app
USER node
COPY ./package.json .
RUN npm i --silent \
   && npm cache clean --force
ENV PATH /opt/app/node_modules/.bin:$PATH
COPY ./bundle.js ./server.js
CMD ["node", "server.js"]
