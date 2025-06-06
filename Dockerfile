FROM node:18-slim

# Puppeteer və Chrome üçün lazım olan kitabxanalar
RUN apt-get update && apt-get install -y \
    wget ca-certificates fonts-liberation libappindicator3-1 libasound2 \
    libatk-bridge2.0-0 libatk1.0-0 libcups2 libdbus-1-3 libgdk-pixbuf2.0-0 \
    libnspr4 libnss3 libx11-xcb1 libxcomposite1 libxdamage1 libxrandr2 \
    libdrm2 libgbm1 xdg-utils libxshmfence1 libxfixes3 libxext6 \
    --no-install-recommends && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# İş qovluğu
WORKDIR /app

# Paketləri yüklə
COPY package*.json ./
RUN npm install

# Kodları əlavə et
COPY . .

# Botu işə sal
CMD ["npm", "start"]
