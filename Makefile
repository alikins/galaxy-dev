define HELP_MESSAGE =
Make targets:

Common:

  help - Show this message and exit.

Docker commands:
  docker/build                  - Build docker images
  docker/up                     - Start docker environment in detached mode.
  docker/logs                   - Display docker environment logs.
  docker/down                   - Stop and remove containers.
  docker/destroy                - Stop and remove containers and data volumes.
  docker/run-migrations         - Run migrations in docker environment.

Export 'USE_PROM=1' env var to optionally bring up a Prometheus container.

endef
export HELP_MESSAGE

USE_PROM ?=
COMPOSE_FILE ?= docker-compose.yaml
PROM_COMPOSE_FILE ?= docker-compose-prometheus.yaml
COMPOSE_FLAGS += -f $(COMPOSE_FILE)
ifdef USE_PROM
	COMPOSE_FLAGS += -f $(PROM_COMPOSE_FILE)
endif

.PHONY: help
help:
	@echo "$$HELP_MESSAGE"

# Docker commands

.PHONY: docker/build
docker/build:
	docker-compose $(COMPOSE_FLAGS) build

.PHONY: docker/rebuild
docker/rebuild:
	docker-compose $(COMPOSE_FLAGS) build --no-cache

.PHONY: docker/up
docker/up:
	docker-compose $(COMPOSE_FLAGS) up --build -d
	# docker-compose up --build -d

.PHONY: docker/logs
docker/logs:
	docker-compose $(COMPOSE_FLAGS) logs -f

.PHONY: docker/down
docker/down:
	docker-compose $(COMPOSE_FLAGS) down

.PHONY: docker/destroy
docker/destroy:
	docker-compose $(COMPOSE_FLAGS) down --volumes

.PHONY: docker/run-migrations
docker/run-migrations:
	docker-compose $(COMPOSE_FLAGS) run --rm pulp-api manage migrate
	docker-compose $(COMPOSE_FLAGS) run --rm galaxy-api manage migrate
