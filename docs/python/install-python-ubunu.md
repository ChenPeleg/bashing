# Installing python on Ubuntu

## Part 1 - installing `pyenv`

Goto https://realpython.com/intro-to-pyenv/

```
sudo apt-get install -y make build-essential libssl-dev zlib1g-dev \
libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev \
libncursesw5-dev xz-utils tk-dev libffi-dev liblzma-dev python3-openssl

```

### Add to path
paste thisi in the `./bashrc`:

```

export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

```