FROM node:lts-alpine3.9


# make the 'app' folder the current working directory
WORKDIR /usr/src/app
ENV POR=8080
# install project dependencies
RUN apk update &&\
    apk add git &&\
    npm install -g npm @vue/cli 

CMD ["npm", "run", "serve"]
