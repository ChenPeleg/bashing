# Net command

To view the lost of services run

```
NET HELP SERVICES
```


The NET Command is used to manage network resources.

# Usages 

## Ports are occupied

To stop and start the Windows Network Address Translation (NAT) service, which can help resolve issues with occupied ports, you can use the following commands in Command Prompt (run as administrator):

```
net stop winnat
net start winnat
```


