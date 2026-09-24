# First Stack

The point of this task is to build a small stack with an minimal API, a simple frontend and a database, in order to orchestrate them.

## Stack

The stack is orchestrated over a network of containers (*holberton_net*), and is made of:

- A **Database** on port **5432** (*osmium_db*), using the official `postgres:16` image
- A minimal `FastAPI` **Backend Application** served on port **8080** (*holberton_backend*), built from `backend/Dockerfile`
- A simple **Frontend Webpage** served through `Nginx` on port **5050** (*holberton_frontend*), built from `frontend/Dockerfile`

## Build

This stack can be built using the following command:

```bash
$ docker compose up -d
```

## Interact

This section details how to interact with each of the three services.

### Backend

Interacting with the backend can be achieved as follows:

```bash
$ curl -s http://0.0.0.0:8080 | jq
```

To enter the frontend container, please run:

```bash
$ docker exec -it holberton_backend bash
```

### Frontend

Interacting with the frontend can be achieved as follows:

```bash
$ curl -s http://0.0.0.0:5050
```

To enter the frontend container, please run:

```bash
$ docker exec -it holberton_frontend bash
```

### Database

To enter the database container, please run:

```bash
$ docker exec -it holberton_db psql -U holberton
```

## Stop

All three services can be interrupted at once, using the following command:

```bash
$ docker compose down
```
