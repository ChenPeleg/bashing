# Installing python on Ubuntu

## Part 1 - installing `pyenv` dependencies

pyenv is used to switch between different version of python

Goto https://realpython.com/intro-to-pyenv/

```
sudo apt-get install -y make build-essential libssl-dev zlib1g-dev \
libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev \
libncursesw5-dev xz-utils tk-dev libffi-dev liblzma-dev python3-openssl

```
## Part 2 - installing `pyenv`  

```shell
curl https://pyenv.run | bash
```

### Add to path

paste this in the `./bashrc`:

```shell
nano ./bashrc
```

```

export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

```

## Part 3 - Add Python version

run 

```shell
pyenv install --list
```

if you get an error like `Can not proceed with installation. Kindly remove .pyenv from home/` run this command:

```shell
rm -rf ~/.pyenv
```