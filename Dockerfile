FROM python:3-slim-bookworm

ENV PYTHONDONTWRITEBYTECODE=1
WORKDIR /opt/app

ARG BDIST

COPY dist/${BDIST} /opt
RUN pip3 install --no-cache-dir /opt/${BDIST}

CMD ["heiwa4126-hello-python"]
