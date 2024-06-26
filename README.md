# heiwa4126-hello-python

[![PyPI - Version](https://img.shields.io/pypi/v/heiwa4126-hello-python.svg)](https://pypi.org/project/heiwa4126-hello-python)
[![PyPI - Python Version](https://img.shields.io/pypi/pyversions/heiwa4126-hello-python.svg)](https://pypi.org/project/heiwa4126-hello-python)

---

Just another useless repository for drill.

Python 練習用の意味のないレポジトリ。

## Installation

```sh
pip install heiwa4126-hello-python
```

## Usage

```sh
heiwa4126-hello-python
# or
python -c "from heiwa4126_hello_python import hello; hello()"
```

or

```python
from heiwa4126_hello_python import hello

hello()
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
hatch version patch
hatch build
hatch publish -r test
hatch publish
```
