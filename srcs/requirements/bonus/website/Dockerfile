FROM alpine:3.16

RUN apk update && apk upgrade && apk add --no-cache nodejs npm

WORKDIR /var/www

RUN ls -la

COPY requirements/bonus/website/conf ./

RUN ls -la

RUN pwd
#RUN npm install tailwindcss --save-dev

RUN npm install --force

RUN ls -la

RUN pwd

EXPOSE 3000

CMD ["npm", "run", "start"]
