FROM python:3.6.6-slim

ENV PYTHONUNBUFFERED 1

RUN apt-get update && apt-get install -y build-essential git

WORKDIR /app

EXPOSE $PORT

# Allows docker to cache installed dependencies between builds
COPY . /app

RUN pip install -r requirements.txt && python manage.py migrate

CMD python manage.py runserver 0.0.0.0:$PORT