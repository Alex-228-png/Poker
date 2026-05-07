FROM ubuntu:noble
RUN apt-get update && apt-get install -y \
    libfontconfig1 \
    libxcursor1 \
    libxinerama1 \
    libxrandr2 \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Копируем только исполняемый файл
COPY server.x86_64 . 

RUN chmod +x /app/server.x86_64

EXPOSE 8080

CMD ["./server.x86_64", "--headless"]