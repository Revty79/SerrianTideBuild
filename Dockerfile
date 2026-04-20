FROM node:22-alpine

WORKDIR /app

# Next.js runtime compatibility on Alpine.
RUN apk add --no-cache libc6-compat

ENV NEXT_TELEMETRY_DISABLED=1

COPY package.json package-lock.json ./
RUN npm ci

COPY . .

RUN npm run build

EXPOSE 3003

CMD ["npm", "run", "start"]
