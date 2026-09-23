# Interact

The purpose of this small task is to take a look at how to handle environment variables with **Docker**.

## Application

The application created in [1-first_image/](1-first_image/) can be changed to read an environment variable, and dynamically update the response to use it, as follows:

```python
from fastapi import FastAPI

import os

SCHOOL = os.getenv("SCHOOL", "World")           # Retrieving the environment variable.

app = FastAPI()


@app.get("/")
async def root():
    return {"message": f"Hello {SCHOOL}"}       # Using it in the response.
```

## Interactions

This succession of commands will build the container based on a custom image to illustrate the use of an environment variable with **Docker**:

| Step | Command | Purpose |
|:----:|:--------|:--------|
| 1 | `docker build -t hello-world .` | Builds an image based on the `Dockerfile`. |
| 2 | `docker run -d -e SCHOOL='Holberton' -p 8080:8080 --name hello-world hello-world` | Creates a container named **hello-world** in the background listening on port **8080**, based on the `hello-world` image, and sets an environement variable named `SCHOOL`. |
| 3 | `docker inspect hello-world \| jq '.[].Config.Env'` | Retrieves the environment variables of the container from its configuration, to check if `SCHOOL` is present. |
| 4 | `docker exec hello-world bash -c 'env \| grep SCHOOL'` | Search for `SCHOOL` by reading it directly from the container itself (can also be done in interactive mode, in two steps, using the flag `-it`). |
| 5 | `curl -s http://0.0.0.0:8080 \| jq` | Makes an HTTP request to verify the `FastAPI` application is correctly retrieving and using the environment variable. |
| 6 | `docker logs hello-world` | Reads the logs of the container, that should show the previous request. |
| 7 | `docker stop hello-world` | Stops the container. |
| 8 | `docker rm hello-world` | Removes the container. |

## Observations

1. Once defined with the flag `-e`, an environment variable is accessible in the container.
2. It can be used by any application that runs inside, as long as its name is correctly defined.
3. Several environment variables can be set by using the `-e` flag as many times as needed.
