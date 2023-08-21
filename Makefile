-include srcs/.env

up:
	mkdir -p ~/${LOGIN}/data/website
	mkdir -p ~/${LOGIN}/data/database
	docker compose -f srcs/docker-compose.yml up --detach --build
	open http://${LOGIN}.42.ch

down:
	docker compose -f srcs/docker-compose.yml down

rm:
	docker system prune -af
	docker volume prune -f

re: down up

rre: down rm up
