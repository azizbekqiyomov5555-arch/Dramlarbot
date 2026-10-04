FROM python:3.11-slim

ENV PYTHONUNBUFFERED=1 \
    PYTHONDONTWRITEBYTECODE=1 \
    PM2_HOME=/data/.pm2

# ffmpeg (video), shriftlar (rasm/grafik), Node.js + PM2 (bola-botlar uchun)
RUN apt-get update && apt-get install -y --no-install-recommends \
        ffmpeg fonts-dejavu-core fonts-liberation nodejs npm ca-certificates \
    && npm install -g pm2 \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

WORKDIR /app
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY server.py .

EXPOSE 8080
CMD ["python", "server.py"]
