# Build
FROM arm64v8/node:16 AS builder
WORKDIR /app
COPY . .
RUN npm install
RUN npm run build

# Run
FROM arm64v8/node:16-alpine
WORKDIR /app
ENV NODE_ENV production
COPY --from=builder /app ./
EXPOSE 8080
CMD ["npm","run","start"]