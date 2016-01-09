FROM node:5.3.0

ADD ./ /src
WORKDIR /src

EXPOSE 3000

RUN npm install
RUN npm rebuild node-sass
CMD npm start
