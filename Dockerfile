# FROM python:3-slim-bookworm
FROM python:3-alpine

ENV PYTHONDONTWRITEBYTECODE=1

ARG BDIST
ARG USER=appuser
ARG UID=1000
ARG GID=1000

RUN addgroup -g $GID $USER && adduser -D -u $UID -G $USER $USER

# COPY dist/${BDIST} /tmp
# RUN pip3 install --no-cache-dir /tmp/${BDIST} && rm /tmp/${BDIST}

# RUN --mount=type=bind,source=./dist,target=/tmp/dist \
#     pip3 install --no-cache-dir /tmp/dist/${BDIST}

RUN --mount=type=bind,source=./dist,target=/tmp/dist \
    --mount=type=cache,target=/root/.cache/pip,sharing=locked \
    pip3 install /tmp/dist/${BDIST}

# マルチステージビルドにしてもwhlファイルの分しか減らない
USER $USER
CMD ["heiwa4126-hello-python"]
