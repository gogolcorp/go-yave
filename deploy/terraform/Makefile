help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(firstword $(MAKEFILE_LIST)) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

setup: ## Copy sample files 
	cp terraform.tfvars.sample terraform.tfvars
	terraform init

apply: ## Up the docker-compose without cache or orphans
	terraform plan -out out.tfplan
	terraform apply "out.tfplan"
  
.PHONY: help

