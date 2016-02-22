#Docker Container Starter

This script will check if a Docker container is running and will start it, if it's not running or in a ghost state.

##Configuration

There's a configuration section on the top of the script as below,

```bash
DOCKER_REGISTRY='docker.achinthagunasekara.com.au'
DOCKER_IMAGE='docker-site'
CONTAINER='docker-site-name'
HOST_PORT=80
DOCKER_PORT=80
```

Please configure it to meet your needs.

| Config Item | Description |
| ------------|-------------|
| DOCKER_REGISTRY | FQDN of the Docker registry |
| DOCKER_IMAGE | Name of the docker image to start |
| CONTAINER | Name of container to check |
| HOST_PORT | Port of the host that the container port will be binded to |
| DOCKER_PORT | Port of the Docker container that will be exposed |
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
