FROM node:10-alpine

# Install vue first and then quasar
#RUN yarn global add vue-cli
#RUN yarn global add quasar-cli
#RUN yarn install
#RUN quasar dev

#FROM node:10-alpine
#ENV NODE_ENV development
#RUN yarn global add @vue/cli && yarn global add quasar-cli
#WORKDIR /srv


USER root
RUN npm install -g @quasar/cli && \
    npm install -g @vue/cli && \
    npm install -g @vue/cli-init 

RUN mkdir /home/node/app
WORKDIR /home/node/app

# Expose is for dev server
EXPOSE 8095

COPY package.json /home/node/app
RUN npm install

#COPY . /home/node/app

#EXPOSE 8080

CMD ["quasar", "serve"]