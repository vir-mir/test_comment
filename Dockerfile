FROM python:3.5

USER root

COPY . /src
WORKDIR /src

RUN pip install -r requirements.txt

EXPOSE 8007

CMD alembic upgrade head && gunicorn comment:app --bind 0.0.0.0:8888 --worker-class aiohttp.worker.GunicornWebWorker