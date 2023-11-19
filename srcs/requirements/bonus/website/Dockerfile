FROM alpine:3.16

RUN apk update && apk upgrade && apk add --no-cache nodejs npm

WORKDIR /var/www

COPY requirements/bonus/website/conf ./

#RUN npm install tailwindcss --save-dev

RUN npm install --force

RUN ls -la

RUN pwd

EXPOSE 3000

CMD ["npm", "run", "start"]
