
# Docker build error

## Description

The Docker build failed with this following error message:

```
 => CANCELED [web internal] load build context                                                                                0.1s
 => => transferring context: 362.37kB                                                                                         0.1s
failed to solve: error from sender: context canceled

```

This happend to me on my local windows machine. 
I was trying to build a docker image for my web application.  
 
## Problem

There is no apparent reason for the error message.
Probably the error is related to some bugs in the docker engine (Windows version).

Suggested solutions:
https://stackoverflow.com/questions/77452312/docker-failed-to-solve-canceled-context-canceled-when-loading-build-context


## Solutions I Tried

 

1. Adding node modules and other files to the `.dockerignore` file.
2. Running the docker build command outside WebStorm.
3. restarting did not solve the issue
4. Running as admin didn't work


### References

https://stackoverflow.com/questions/63330590/error-response-from-daemon-open-pipe-docker-engine-linux-the-system-cannot
https://github.com/moby/buildkit/issues/4327


https://forums.docker.com/t/canceled-frontend-internal-load-build-context/138000





Tried to do this

```Use containerd for pulling and storing images Give feedback
Use this if you need support for multi-platform images, image lazy-loading, or Wasm.
Only images and containers in the active image store are visible. All your other containers and images still exist. To see them again, turn off this feature.
```



