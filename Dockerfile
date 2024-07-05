# FROM python:3-slim-bookworm
FROM python:3-alpine

ENV PYTHONDONTWRITEBYTECODE=1
WORKDIR /opt/lib

ARG BDIST

COPY dist/${BDIST} /opt
RUN pip3 install --no-cache-dir --target=/opt/lib /opt/${BDIST}

# マルチステージビルドにしてもwhlファイルの分しか減らない
ENV PYTHONPATH=/opt/lib
CMD ["python3", "-m", "heiwa4126_hello_python"]
