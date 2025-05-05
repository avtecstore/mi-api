# Usamos una imagen base de Python 3.10
FROM python:3.10-slim

# Instalamos dependencias del sistema necesarias para Chrome
RUN apt-get update && apt-get install -y \
    wget \
    unzip \
    gnupg \
    curl \
    fonts-liberation \
    libnss3 \
    libxss1 \
    libasound2 \
    libatk-bridge2.0-0 \
    libgtk-3-0 \
    libdrm2 \
    libgbm1 \
    libxshmfence1 \
    && rm -rf /var/lib/apt/lists/*

# Descargamos y configuramos Google Chrome
RUN curl -sSL https://dl.google.com/linux/linux_signing_key.pub | apt-key add - && \
    echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list && \
    apt-get update && \
    apt-get install -y google-chrome-stable && \
    rm -rf /var/lib/apt/lists/*

# Creamos directorio de trabajo
WORKDIR /app

# Copiamos el código al contenedor
COPY . .

# Instalamos dependencias de Python
RUN pip install fastapi uvicorn selenium

# Exponemos el puerto donde correrá FastAPI
EXPOSE 8080

# Ejecutamos la app
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8080"]
