DATE=$(shell date)

# cleanup
clean:
	@echo "[${DATE}] - cleaning..."
ifneq (,$(wildcard nginx/conf.d/upstream.*.conf))
	@rm nginx/conf.d/upstream.*.conf
endif
	
# start
start: docker-start
	@echo "[${DATE}] - started"
	@open http://localhost:8500

# stop
stop: docker-stop clean 
	@echo "[${DATE}] - all stopped"

# for start docker
docker-start: clean
	@echo "[${DATE}] - start docker..."
	@docker-compose -f ./docker-compose.yml up -d --build

# for stop docker
docker-stop:
	@echo "[${DATE}] - shutting down docker..."
	@docker-compose down

# jump in into nginx container
docker-bash-nginx:
	@docker exec -it play-nginx /bin/bash

# tail nginx log stdout and stderr
docker-logs-nginx:
	@docker logs -f play-nginx

# tail BE express stdout and stderr
docker-logs-backend:
	@docker logs -f play-backend	

# run consul template nginx
docker-run-ctmpl:
	@docker exec -it play-nginx consul-template -config=/var/consul/config/service.play-nginx.config