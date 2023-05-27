FROM node:16.18.0 as node

RUN mkdir /usr/src/app
WORKDIR /usr/src/app

# add .bin to $PATH
ENV PATH /usr/src/app/node_modules/.bin:$PATH

# install package.json (o sea las dependencies)
COPY package.json /usr/src/app/package.json
RUN npm install

COPY . /usr/src/app

CMD npm cicd:local

FROM nginx:alpine
COPY --from=node /usr/src/app/dist/app /usr/share/nginx/html/
COPY nginx.conf /etc/nginx/conf.d/default.conf

