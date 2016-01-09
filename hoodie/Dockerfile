FROM node:5.3.0

RUN mkdir /src

COPY . /src
WORKDIR /src
ADD package.json /src/package.json
RUN npm install

EXPOSE 8080

CMD npm start
