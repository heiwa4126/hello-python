# FROM python:3-slim-bookworm
FROM python:3-alpine

ENV PYTHONDONTWRITEBYTECODE=1

ARG BDIST

COPY dist/${BDIST} /opt
RUN pip3 install --no-cache-dir /opt/${BDIST}

# マルチステージビルドにしてもwhlファイルの分しか減らない
CMD ["heiwa4126-hello-python"]
