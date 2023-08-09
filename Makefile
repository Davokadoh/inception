include srcs/.env

up:
	docker compose -f srcs/docker-compose.yml up --detach --build

down:
	docker compose -f srcs/docker-compose.yml down

rm:
	docker system prune --volumes -a -f

re: down up

rre: down rm up
