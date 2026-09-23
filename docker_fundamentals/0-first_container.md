# First Container

The purpose of this small task is to approach **Docker** and concepts such as *images* and *containers*.

## Interactions

This succession of commands will pull a `nginx` image, to build a container and interact with it:

| Step | Command | Purpose |
|:----:|:--------|:--------|
| 1 | `docker pull nginx:latest` | Pulls the latest `nginx` image. |
| 2 | `docker run -d -p 8080:80 --name hello-world nginx` | Creates a container named **hello-world** in the background, based on the `nginx` image, and maps local port 8080 to container 80 port. |
| 3 | `docker ps -a` | Lists all containers, to check if the one created is fine and running. |
| 4 | `docker inspect hello-world` | Checks the configuration of the container. |
| 5 | `docker exec -it hello-world bash` | Starts an interactive `bash` session in the container. |
| 6 | `CTRL-D` | Exits the container. |
| 7 | `curl http://localhost:8080` | Makes an HTTP request to verify the `nginx` service is working and running on the right port. |
| 8 | `docker logs hello-world` | Reads the logs of the container, that should show the previous request. |
| 9 | `docker stop hello-world` | Stops the container. |
| 10 | `docker rm hello-world` | Removes the container. |

## Observations

1. The image is the base on which the container is built. Multiple containers can be run on the same image.
2. An image can either be pulled from the **Docker Hub**, or created using a custom `Dockerfile`.
3. Defining ports using the `-p` flag maps the local port to the service running in the container.
