FIX: Game will not start on modern processors
Due to the way the game has been compiled, it will fail to load on some modern processors which have "too many" cores; well too many for the game to cope with.

A way to fix this without the need for any 3rd party downloads is as follows:

1) Within Steam Client, right-click on the game and select properties.
2) On the General tab, enter in the following in the Launch Options box:

C:\Windows\System32\cmd.exe /C start "" /affinity F "C:\Program Files (x86)\Steam\steamapps\common\Deus Ex Human Revolution Director's Cut\DXHRDC.exe" %command%

3) Press enter to save the Launch Options, and then select X to close the window.
4) Press PLAY!

Note: Update the installation path if different from default!