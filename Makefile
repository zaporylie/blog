# HELP
# This will output the help for each task
# thanks to https://marmelab.com/blog/2016/02/29/auto-documented-makefile.html
.PHONY: help

help: ## This help.
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

.DEFAULT_GOAL := help


# DOCKER TASKS

# Build the container
build: pull ## Build the development container.
	docker-compose --project-directory=./ -f .drupal-docker/docker-compose.yml -f .drupal-docker/docker-compose.cli.yml build --no-cache --pull $(services)

# Pull the container
pull: ## Pull the latest versions of all images.
	docker-compose --project-directory=./ -f .drupal-docker/docker-compose.yml -f .drupal-docker/docker-compose.cli.yml pull

# Build and run the container
up: ## Spin up the project [alias = start]
	docker-compose --project-directory=./ -f .drupal-docker/docker-compose.yml up -d

start: up

cli: ## Run interactive CLI
	docker-compose --project-directory=./ -f .drupal-docker/docker-compose.yml -f .drupal-docker/docker-compose.cli.yml run --rm cli

logs: ## Shows you recent logs from all containers and keeps stream of logs open
	docker-compose --project-directory=./ -f .drupal-docker/docker-compose.yml logs --tail=50 -f

down: ## Stop running containers but keep the project data [alias = stop]
	docker-compose --project-directory=./ -f .drupal-docker/docker-compose.yml -f .drupal-docker/docker-compose.cli.yml down

stop: down

rm: stop ## Stop and remove running containers and all associated data (destroy volumes)
	docker-compose --project-directory=./ -f .drupal-docker/docker-compose.yml -f .drupal-docker/docker-compose.cli.yml down -v --rmi local

kill: rm
destroy: rm
