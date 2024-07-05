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

Hatch を使っているので、`pip install hatch` でインストール。  
もしくは Windows や Mac なら GUI のインストーラ使う (Python 不要)

[Installation - Hatch](https://hatch.pypa.io/latest/install/)

```sh
# プロジェクトをクローンして
git clone https://github.com/heiwa4126/hello-python.git
# ディレクトリに移動して、
cd hello-python
# VSCodeで開く
hatch run code .
```

で、

```sh
hatch run main
# (update something)
hatch fmt
hatch test -a
hatch run bump
rm -rf dist && hatch build
hatch publish -r test
hatch publish
```

### Docker

```sh
hatch run build-docker
hatch run start-docker
```

サイズは

```console
$ hatch run list-docker

REPOSITORY               TAG       IMAGE ID       CREATED                  SIZE
heiwa4126-hello-python   0.2.1     4053e33e2384   Less than a second ago   57.9MB
heiwa4126-hello-python   latest    4053e33e2384   Less than a second ago   57.9MB
heiwa4126-hello-python   0.2.0     587873b24a9a   16 minutes ago           130MB
```

python:3-slim で 130MB、python:3-alpine で 57.9MB。
マルチステージビルドはこのプロジェクトだとサイズがほぼ一緒。
