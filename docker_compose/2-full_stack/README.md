# Full Stack

The purpose of this small task is to improve the stack created in [1-healthchecks/](1-healthchecks/) by adding a cache and a reverse proxy.

## Stack

The stack is orchestrated over a network of containers (*holberton_net*), and is made of:

- A `PostgreSQL` **Database** on port **5432** internally (*holberton_db*), using the official `postgres:16` image
- A `Redis` **Cache** on port **6379** internally (*holberton_cache*), using the official `redis:7` image
- A minimal `FastAPI` **Backend Application** on port **8080** internally (*holberton_backend*), built from `backend/Dockerfile`
- A simple **Frontend Webpage** served through `Nginx` on port **80** internally (*holberton_frontend*), built from `frontend/Dockerfile`
- A basic `Nginx` **Reverse Proxy** exposed on port **80** (*holberton_reverse_proxy*), using the official `nginx:latest` image

## Build

This stack can be built using the following command:

```bash
$ docker compose up -d
```

## Interact

This section details how to interact with the backend and frontend services (through **Nginx**).

### Backend

Interacting with the backend can be achieved as follows:

```bash
$ curl -s http://0.0.0.0:80/api/ | jq
```

### Frontend

Interacting with the frontend can be achieved as follows:

```bash
$ curl -s http://0.0.0.0:80/
```

## Stop

All three services can be interrupted at once, using the following command:

```bash
$ docker compose down -v
```
