FROM python:3.12-slim

WORKDIR /app

COPY . /app

RUN pip install --no-cache-dir -r req.txt

CMD ["flask", "run", "--host=0.0.0.0"]