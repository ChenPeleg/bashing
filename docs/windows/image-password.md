# Enable image password

1. Press the Windows key + R to open the Run box. Type regedit and press Enter. This will open the Registry Editor.
2. Next, navigate to following entry:
```shell
HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\System 
```

If the System subkey doesn’t exist, you’ll have to create it.

In right pane, look for an entry named BlockDomainPicturePassword. If it doesn’t exist, right-click on empty space and create a DWORD value and assign name as `BlockDomainPicturePassword`.

set it to 0

[source](https://www.top-password.com/blog/disable-windows-picture-password-sign-in/)