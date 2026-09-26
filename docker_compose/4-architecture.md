# Architecture

...

## Stack

The stack is orchestrated over a network of containers (*holberton_net*), and is made of:

- A `PostgreSQL` **Database** on port **5432** internally (*holberton_db*), using the official `postgres:16` image
- A `Redis` **Cache** on port **6379** internally (*holberton_cache*), using the official `redis:7` image
- A minimal `FastAPI` **Backend Application** on port **8080** internally (*holberton_backend*), built from `backend/Dockerfile`
- A simple **Frontend Webpage** served through `Nginx` on port **80** internally (*holberton_frontend*), built from `frontend/Dockerfile`
- A basic `Nginx` **Reverse Proxy** exposed on port **80** (*holberton_reverse_proxy*), using the official `nginx:latest` image

## Diagram

The following diagram illustrates the stack orchestration:

```mermaid
---
config:
  layout: dagre
  theme: redux
  look: neo
---

flowchart LR
  subgraph C["CLIENT"]
    direction TB
    B(["BROWSER"])
  end

  subgraph A["APPLICATION"]
    direction TB
    RP["REVERSE PROXY <br> Nginx <br><br> Port 80 <br> (Exposed)"]
    BA["BACKEND <br> FastAPI <br><br> Port 8080 <br> (Internal)"]
    FA["FRONTEND <br> Nginx <br><br> Port 80 <br> (Internal)"]
  end

  subgraph DATA["DATA"]
    DB[("DATABASE <br> PostgreSQL <br><br> Port 5432 <br> (Internal)")]
    CACHE[("CACHE <br> Redis <br><br> Port 6379 <br> (Internal)")]
  end

  B -->|HTTP| RP

  RP -->|/api/| BA
  RP -->|/| FA

  BA -->|Write / Read| DB
  BA -->|Write / Read| CACHE
```
