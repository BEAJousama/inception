NAME=inception
WP=/home/obeaj/data/wordpress
DB=/home/obeaj/data/mariadb
ENVFILE=/home/obeaj/.env
DCOMPOSE=sudo docker-compose
FILE=./srcs/docker-compose.yml


all: $(NAME)

$(NAME): data
	@cd ./srcs && \
	$(DCOMPOSE) up -d --build

data:
	@cp $(ENVFILE) ./srcs/
	@mkdir -p $(WP)
	@mkdir -p $(DB)

clean: down
	@docker stop $$(docker ps -qa);\
	docker rm $$(docker ps -qa);\
	docker rmi -f $$(docker images -qa);\
	docker volume rm $$(docker volume ls -q);\
	docker network rm $$(docker network ls -q);\
	sudo rm -rf $(WP);\
	sudo rm -rf $(DB)

logs:
	@cd ./srcs && \
	$(DCOMPOSE) logs -f

ps:
	@sudo docker ps

up:
	@cd ./srcs && \
	$(DCOMPOSE) up -d

down:
	@cd ./srcs && \
	$(DCOMPOSE) down

fclean: clean
	@cd ./srcs && \
	docker system prune --volumes

re: down fclean all

.PHONY: all re down clean fclean ps up down logs wordpress data