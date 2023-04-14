# Simple script to run docker-compose
source ./.env
docker-compose -f docker-compose.dev.yaml up --build
