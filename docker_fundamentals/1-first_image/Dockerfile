FROM python:3.13-slim
WORKDIR /usr/local/app

COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

COPY app.py ./app.py
EXPOSE 8080

RUN useradd holberton
USER holberton

CMD ["fastapi", "run", "app.py", "--host", "0.0.0.0", "--port", "8080"]
