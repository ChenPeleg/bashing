# enable image password

Open Run command by pressing Windows + R  and type `gpedit.msc` and hit enter. This command will open the Group Policy Editor.

*Computer Configuration>Administrative>Templates>System>Logon*

From the Left-hand side click on Logon and from the Right-hand side Look for Turn on convenience PIN sign-in.

Policy settings allow you to control whether a domain user can sign in using a convenience PIN.

Under the same path Look for Turn off picture password sign-in. This policy setting allows you to control whether a domain user can sign in using a picture password.