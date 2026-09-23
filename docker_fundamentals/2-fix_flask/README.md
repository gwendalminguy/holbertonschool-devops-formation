# Fix Flask

The purpose of this small task was to fix an existing broken `Dockerfile`, that was missing the `requirements.txt` installation, the port exposition and used the wrong file name for the application. It consists in a minimal image for a basic `Flask` application that listens on port **5000**, and that returns a simple string:

```
Hello from Flask in Docker!\n
```

## Build

The image can be built using the following command:

```bash
$ docker build -t flask-app .
```

## Run

The container can be run using the following command:

```bash
$ docker run -d -p 5000:5000 --name flask-app flask-app
```

## Use

To interact with the application, use the following command:

```bash
curl -s http://0.0.0.0:5000
```
