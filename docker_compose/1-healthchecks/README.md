# Healthchecks

The purpose of this small task is to improve the stack created in [0-first_stack/](0-first_stack/) by adding a healthcheck.

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

## Healthcheck

Using a healthcheck, the backend service now waits for the database service to be ready before starting. The logs show that the backend service indeed waits for a healthy database to start:

```
...
holberton_db  | 2026-09-26 10:00:12.872 UTC [1] LOG:  database system is ready to accept connections
...
Container holberton_db Healthy
...
holberton_backend   |  ⚡️ Starting FastAPI in production mode
...
```

## Stop

All three services can be interrupted at once, using the following command:

```bash
$ docker compose down
```
