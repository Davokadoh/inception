-include srcs/.env

UNAME := $(shell uname)
ifeq ($(UNAME),Linux)
	engine ?= podman
endif
ifeq ($(UNAME),Darwin)
	engine ?= docker
endif

up:
	mkdir -p ~/${LOGIN}/data/website
	mkdir -p ~/${LOGIN}/data/database
	${engine} compose -f srcs/docker-compose.yml up --detach --build
	open http://${LOGIN}.42.ch

down:
	${engine} compose -f srcs/docker-compose.yml down

rm:
	${engine} system prune -af
	${engine} volume prune -f

re: down up

rre: down rm up
