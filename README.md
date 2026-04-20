# Serrian Tide Build

Next.js 16 + PostgreSQL (Drizzle) app running on port `3003`.

## Local development

1. Create `.env.local` from `.env.example`.
2. Install dependencies:

```bash
npm ci
```

3. Run migrations + seed:

```bash
npm run db:bootstrap
```

4. Start dev server:

```bash
npm run dev
```

Open `http://localhost:3003`.

## Docker deployment (server-ready)

This repository now includes:

- `Dockerfile` for the app image
- `docker-compose.yml` for app + PostgreSQL
- `.env.docker.example` for server env setup

### First-time server setup

1. Copy env template and edit secrets:

```bash
cp .env.docker.example .env.docker
```

2. Update at minimum:
- `POSTGRES_PASSWORD`
- `DATABASE_URL` (must match the same DB credentials and keep host as `db`)

3. Build and start in detached mode:

```bash
docker compose --env-file .env.docker up -d --build
```

On startup, the app container runs `npm run db:bootstrap` before `npm run start`, so schema + roles are initialized automatically.
Postgres is kept internal to the Docker network by default (not exposed on host port `5432`).

### Useful server commands

View logs:

```bash
docker compose --env-file .env.docker logs -f
```

Restart services:

```bash
docker compose --env-file .env.docker restart
```

Stop services:

```bash
docker compose --env-file .env.docker down
```

Stop and remove DB volume (destructive):

```bash
docker compose --env-file .env.docker down -v
```

## Database workflow (non-Docker)

- `npm run db:generate` generate new SQL migrations from `src/db/schema.ts`
- `npm run db:migrate` apply generated migrations
- `npm run db:push` push schema changes directly (dev only)
- `npm run db:studio` open Drizzle Studio
- `npm run db:seed` seed default roles
- `npm run db:bootstrap` migrate + seed
