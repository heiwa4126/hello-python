# heiwa4126-hello-python

[![PyPI - Version](https://img.shields.io/pypi/v/heiwa4126-hello-python.svg)](https://pypi.org/project/heiwa4126-hello-python)
[![PyPI - Python Version](https://img.shields.io/pypi/pyversions/heiwa4126-hello-python.svg)](https://pypi.org/project/heiwa4126-hello-python)

---

Just another useless repository for drill.

Python 練習用の意味のないレポジトリ。実態は `cowsay.cow(f"Hello {msg}")` だけ。

## Installation

```sh
pip install heiwa4126-hello-python
```

## Usage

```sh
heiwa4126-hello-python
heiwa4126-hello-python Dolly
heiwa4126-hello-python -h
# or
python -m heiwa4126_hello_python
python -m heiwa4126_hello_python "Mr. Monkey"
python -m heiwa4126_hello_python -h
# or
python -c "from heiwa4126_hello_python import hello; hello()"
python -c "from heiwa4126_hello_python import hello; hello('world')"
```

or

```python
from heiwa4126_hello_python import hello

hello()
hello("goodbye")
```

## 開発のしかた

uv を使っています。
[Installing uv](https://docs.astral.sh/uv/getting-started/installation/)

```sh
# プロジェクトをクローンして
git clone https://github.com/heiwa4126/hello-python.git
# ディレクトリに移動して、
cd hello-python
# 依存関係をインストール
uv sync
# VS Codeで開く
code .
```

開発コマンド:

```sh
uv run heiwa4126-hello-python
uv run heiwa4126-hello-python test
uv run heiwa4126-hello-python -h
uv run python examples/ex1.py
uv run ruff check .
uv run ruff format .
uv run pytest --cov
uv run mypy src/heiwa4126_hello_python tests
```

リリースでは、まずバージョンを更新してタグを作成します。

```sh
uv version --bump patch
VERSION=$(uv version --short)
git add --all
git commit -m "v$VERSION"
git tag -a "v$VERSION" -m "v$VERSION"
```

ビルドと公開:

```sh
uv build
uv publish --publish-url https://test.pypi.org/legacy/
uv publish
```

### Docker

```sh
uv build
VERSION=$(uv version --short)
docker buildx build . \
  --build-arg BDIST="heiwa4126_hello_python-${VERSION}-py3-none-any.whl" \
  -t "heiwa4126-hello-python:$VERSION"
docker tag "heiwa4126-hello-python:$VERSION" heiwa4126-hello-python:latest
# 実行
docker run --rm heiwa4126-hello-python:latest
# or
docker run --rm heiwa4126-hello-python:latest heiwa4126-hello-python -h
```

サイズは

```console
$ docker images heiwa4126-hello-python

REPOSITORY               TAG       IMAGE ID       CREATED                  SIZE
heiwa4126-hello-python   0.2.1     4053e33e2384   Less than a second ago   57.9MB
heiwa4126-hello-python   latest    4053e33e2384   Less than a second ago   57.9MB
heiwa4126-hello-python   0.2.0     587873b24a9a   16 minutes ago           130MB
```

python:3-slim で 130MB、python:3-alpine で 57.9MB。
マルチステージビルドはこのプロジェクトだとサイズがほぼ一緒なので止めました。

### セキュリティチェック

```sh
trivy config .
trivy fs .
trivy fs --scanners license --severity HIGH,CRITICAL .
trivy image "heiwa4126-hello-python:$(uv version --short)" --ignore-unfixed
```
