-include srcs/.env

up:
	mkdir -p ~/$(shell whoami)/data/website
	mkdir -p ~/$(shell whoami)/data/database
	docker compose -f srcs/docker-compose.yml up --detach --build

down:
	docker compose -f srcs/docker-compose.yml down

rm:
	docker system prune -af
	docker volume prune -f

re: down up

rre: down rm up
