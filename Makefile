-include srcs/.env

up:
	mkdir -p /home/${LOGIN}/data/website
	mkdir -p /home/${LOGIN}/data/database
	sudo docker compose -f srcs/docker-compose.yml up --detach --build
	open http://${LOGIN}.42.ch

down:
	sudo docker compose -f srcs/docker-compose.yml down

rm:
	sudo docker system prune -af
	sudo docker volume prune -f

re: down up

rre: down rm up
