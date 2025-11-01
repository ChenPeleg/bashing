    

---
title: "Reset Network Ports"
slug: reset-ports
tags: ["windows", "network", "troubleshooting"]
description: "Instructions to reset network ports on Windows to resolve connectivity issues."

---
To reset network ports on a Windows machine, you can follow these steps:
1. Open Command Prompt as an administrator. You can do this by searching for "cmd" in the Start menu, right-clicking on "Command Prompt," and selecting "Run as administrator."
2. In the Command Prompt window, type the following commands one by one, pressing Enter after each command:

```

net stop winnat 
net start winnat

```