FROM node:20

WORKDIR /app

COPY package*.json ./
RUN npm install

COPY . .

# Build frontend
RUN npm run build

# Install static server
RUN npm install -g serve

# Cloud Run uses PORT env variable
ENV PORT=8080

CMD ["serve", "-s", "dist", "-l", "8080"]
