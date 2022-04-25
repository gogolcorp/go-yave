help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(firstword $(MAKEFILE_LIST)) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

setup: ## Copy sample files 
	bash scripts/setup.sh

start: ## Up the docker-compose without cache or orphans
	docker-compose up \
		--build \
		--detach
  

hstart: ## Up the docker-compose without cache or orphans
	docker-compose up \
		--detach \
		--build \
		--remove-orphans \
		--force-recreate \
		--renew-anon-volumes \
		--always-recreate-deps


stop: ## Down the docker-compose 
	docker-compose down

logs: ## Display logs of your containers 
	docker-compose logs --follow

lint:
	gofmt -e -l -s -w .

init:
	make setup lint start logs

reload:
	make stop lint start logs

hreload:
	make stop lint start logs
	
.PHONY: help

