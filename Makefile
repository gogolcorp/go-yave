help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(firstword $(MAKEFILE_LIST)) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

start: ## Up the docker-compose without cache or orphans
	docker-compose up \
	--detach \
	--build \
	--remove-orphans \
	--force-recreate

restart: ## down, then up the docker-compose
	make stop
	make start

stop: ## Down the docker-compose 
	docker-compose down

logs: ## Display logs of your containers 
	docker-compose logs --follow

.PHONY: help

