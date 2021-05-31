DATE=$(shell date)

# for start docker
docker-start:
	@echo "[${DATE}] - starting..."
	@docker-compose -f ./docker-compose.yml up -d --build

# for stop docker
docker-stop:
	@echo "[${DATE}] - shutting down..."
	@docker-compose down

# jump in into nginx container
docker-bash-nginx:
	@docker exec -it docker-playground_play-nginx_1 /bin/bash

# tail nginx log stdout and stderr
docker-logs-nginx:
	@docker logs -f docker-playground_play-nginx_1

# tail BE express stdout and stderr
docker-logs-backend:
	@docker logs -f docker-playground_play-backend_1	