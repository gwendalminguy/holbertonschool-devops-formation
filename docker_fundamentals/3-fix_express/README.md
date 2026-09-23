# Fix Express

The purpose of this small task was to fix an existing broken `Dockerfile`, that was missing the copy of `package.json`, and documented the wrong port exposition. It consists in a minimal image for a basic `Express` application that listens on port **3000**, and that returns a simple string:

```
Hello from Express in Docker!\n
```

## Build

The image can be built using the following command:

```bash
$ docker build -t express-app .
```

## Run

The container can be run using the following command:

```bash
$ docker run -d -p 3000:3000 --name express-app express-app
```

## Use

To interact with the application, use the following command:

```bash
curl -s http://0.0.0.0:3000
```
