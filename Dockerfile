FROM node:20

WORKDIR /app

COPY package.json package-lock.json ./

RUN npm install

COPY . .

RUN npx prisma generate

RUN npx prisma migrate deploy --preview-feature

RUN npm run build

EXPOSE 3000

CMD ["npm", "start"]
