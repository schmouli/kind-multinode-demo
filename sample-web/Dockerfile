FROM python:3.12-slim

ENV PYTHONUNBUFFERED=1

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY app.py /app/app.py
WORKDIR /app

EXPOSE 80
CMD ["python", "app.py"]