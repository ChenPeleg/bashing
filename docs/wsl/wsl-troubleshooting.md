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


### Things I tried

#### Installing linux with command line
```powershell
wsl --install
```

I got this error
```
WslRegisterDistribution failed with error: 0x80370114
Error: 0x80370114 The operation could not be started because a required feature is not installed.
```

Found this 

https://answers.microsoft.com/en-us/insider/forum/all/wsl-2-installing-linux-failed-error-code/bae391d1-4215-4d93-b0c4-3d96404a7c74

Followed instructions and then ran

```
net start vmcompute
```

got this error:

`The Hyper-V Host Compute Service service could not be started.`

Tried running the command `optionalfeatures`

haven't seen hyper-v.

Followed [these](https://www.makeuseof.com/windows-feature-name-microsoft-hyper-v-unknown-error/) instruction:
Privacy and Security > Windows security > Device security

> Toggle core isolation off

Hyper -v might not be needed for the wsl:

> You don't need a mega-powerful PC to run WSL 2 nor do you need the "Pro" version of Windows as you traditionally do to use the Hyper-V VM tool. WSL 2 does utilize the Hyper-V architecture but you don't need to pay extra for it.

[source](https://www.xda-developers.com/how-to-install-wsl-2-windows/)


### Enabling wsl
Needs to be powershell with admin rights

```powershell
Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux
```

### Launching linux and docker - Solution

It seems that vmcompute.exe must be strictly Code flow guard (CFG) enabled, otherwise it will not work.

Here is reproduce of workaround
===>
1. Open "Window Security"
2. Open "App & Browser control"
3. Click "Exploit protection settings" at the bottom
4. Switch to "Program settings" tab
5. Add/Locate "C:\WINDOWS\System32\vmcompute.exe" in the list and expand it
6. Click "Edit"
7. Scroll down to "Code flow guard (CFG)" and uncheck/check "Override system settings" (CFG must be ON for this app!)
Reboot