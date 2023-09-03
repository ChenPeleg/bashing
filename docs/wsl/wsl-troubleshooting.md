Wsl Troubleshooting

# Problem 1 - can't open linux distribution installed

How It started:

## Docker desktop problem

The problem started when docker desktop stopped working as described [here](https://stackoverflow.com/questions/43041331/docker-forever-in-docker-is-starting-at-windows-task).

### Wsl problem

When I dug deeper I can see that there is a general problem with wsl. When i type
```powershell
wsl -l
```

The screen just freezes. 

I've posted [this](https://stackoverflow.com/questions/77031196/wsl-commands-not-responding-on-windows-cmd-and-powershell) question in Stack Overflow. 