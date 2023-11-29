## Could not create a preboot volume for APFS install


1. Create a bootable thumbdrive on another computer

Except I needed to change the command to this:

sudo /Applications/Install\ macOS\ High\ Sierra\ Beta.app/Contents/Resources/createinstallmedia --volume /Volumes/HighSierra --applicationpath /Applications/Install\ macOS\ High\ Sierra\ Beta.app --nointeraction &&say Boot drive created
2. Once the drive is created plug into the tanked computer- hold down option and choose to boot from the installer

3. Go to reinstall macOS and choose the internal hard drive for installation. There should not be an error with this method.