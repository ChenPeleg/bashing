# Use pycharm in windows

## steps

1. install pyenv from here: https://github.com/pyenv-win/pyenv-win
```
powershell
Invoke-WebRequest -UseBasicParsing -Uri "https://raw.githubusercontent.com/pyenv-win/pyenv-win/master/pyenv-win/install-pyenv-win.ps1" -OutFile "./install-pyenv-win.ps1"; &"./install-pyenv-win.ps1"
```
3. add pyenv to path
%USERPROFILE%\.pyenv\pyenv-win\bin
%USERPROFILE%\.pyenv\pyenv-win\shims
4. install poetry
The better way, after setting up pyenv, is to use the following command to 

```
pipx install poetry

```
> The second less recommended way is to use the following command:

```
powershell
(Invoke-WebRequest -Uri https://install.python-poetry.org -UseBasicParsing).Content | py -
```
5. install python
```shell
pyenv install %the version you want%
```
6. add python to path
```shell
C:\Users\%user%\AppData\Roaming\Python\Scripts
```

 