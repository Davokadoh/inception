-include srcs/.env

up:
	@mkdir -p /home/${LOGIN}/data/website
	@mkdir -p /home/${LOGIN}/data/database
	@sudo docker compose -f srcs/docker-compose.yml up --detach
	@#open http://${LOGIN}.42.ch

down:
	@sudo docker compose -f srcs/docker-compose.yml down -v --remove-orphans --rmi all

rm:
	@sudo docker system prune -af
	@sudo docker volume prune -f

re:
	@mkdir -p /home/${LOGIN}/data/website
	@mkdir -p /home/${LOGIN}/data/database
	@sudo docker compose -f srcs/docker-compose.yml up --detach --build

rre: down rm up
