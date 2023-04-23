FROM node:19.2-slim

WORKDIR /app

COPY package.json .
RUN npm install --quiet
COPY . .

CMD ["npm" ,"run", "start"]
