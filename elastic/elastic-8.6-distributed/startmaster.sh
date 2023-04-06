git pull
docker compose --env-file es-sim0$1/.env up -d
docker logs -f es-sim0$1