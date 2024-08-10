COMPOSE_PATH=./srcs/docker-compose.yml

#Arranquem els contenidors amb el .yml
all:
	@docker compose -f $(COMPOSE_PATH) up -d --build

#Aturem i eliminem els contenidors
down:
	@docker compose -f $(COMPOSE_PATH) down

#Reconstruim i reiniciem
re:
	@docker compose -f $(COMPOSE_PATH) up -d --build

#Eliminem tots els contenidors, les imatges, els volums i les xarxes o res si no estaben iniciats
clean:
	@docker stop $$(docker ps -qa) || true; \
	docker rm $$(docker ps -qa) || true; \
	docker rmi -f $$(docker images -qa) || true; \
	docker volume rm $$(docker volume ls -q) || true; \
	docker network rm $$(docker network ls -q) || true;

.PHONY: all re down clean

