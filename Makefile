all:
	@cd ./srcs && sudo docker-compose up -d --build 

down:
	@cd ./srcs && sudo docker-compose down

re:
	@cd ./srcs && sudo docker-compose up -d --build

clean:
	@docker stop $$(docker ps -qa);\
	docker rm $$(docker ps -qa);\
	docker rmi -f $$(docker images -qa);\
	docker volume rm $$(docker volume ls -q);\
	docker network rm $$(docker network ls -q);\

prune:
	@docker system prune -a

.PHONY: all re down clean prune