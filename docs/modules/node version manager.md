# Node version managers
## nvs vs nvm
- nvm is the main and most popular version manager
- nvs is more suitable for Windows

## nvm
### Installation
```bash
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash
```
### Usage
```bash
nvm install node
nvm install 6.14.4
nvm use 6.14.4
nvm ls
nvm ls-remote
nvm uninstall 6.14.4
```
## nvs
### Installation
```bash
curl -o- https://raw.githubusercontent.com/jasongin/nvs/master/nvs.sh | bash
```
### Usage
```bash
nvs add lts
nvs add 6.14.4
nvs use 6.14.4
