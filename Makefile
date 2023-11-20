include .env

down:
	cd docker && docker compose down
up:
	cd docker && docker compose up -d
up-build:
	cd docker && docker compose build && \
	docker-compose up -d
new-laravel:
	cd docker && \
	docker compose exec app composer create-project --prefer-dist laravel/laravel ./
install-octane:
	cd docker && \
	docker compose exec app composer require laravel/octane
octane-start:
	cd docker && \
	docker compose exec app php artisan octane:start --server=swoole --host ${OCTANE_HOST} --port ${OCTANE_PORT}
init:
	@if [ ! -e "./docker/.env" ]; then \
		cp .env ./docker/.env; \
	fi \

	@if [ ! -d "./src" ]; then \
		mkdir ./src; \
	fi \

	@make up-build && \
	make new-laravel && \
	make install-octane
