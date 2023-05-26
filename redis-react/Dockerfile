FROM node:alpine

WORKDIR /app

COPY . .

RUN npm install -g serve

CMD serve -s build

EXPOSE 3000
