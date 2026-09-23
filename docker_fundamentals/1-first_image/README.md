# First Image

Minimal image for a basic `FastAPI` application that listens on port **8080**, and that returns a simple JSON:

```json
{
    "message": "Hello World"
}
```

## Build

The image can be built using the following command:

```bash
$ docker build -t hello-world .
```

## Run

The container can be run using the following command:

```bash
$ docker run -d -p 8080:8080 --name hello-world hello-world
```

## Use

To interact with the application, use the following command (`jq` is optional):

```bash
curl -s http://0.0.0.0:8080 | jq
```
