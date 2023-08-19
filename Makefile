include .env

cp-dotenv:
	cp .env ./docker/.env

down:
	cd docker && docker-compose down

up:
	make cp-dotenv && \
	cd docker && docker-compose up -d

up-build:
	make cp-dotenv && \
	cd docker && docker-compose build && \
	docker-compose up -d

new-laravel:
	cd docker && \
	docker-compose build && \
	docker-compose up -d && \
	docker-compose exec app composer create-project --prefer-dist laravel/laravel ./

install-octane-swoole:
	cd docker && \
	docker-compose exec app composer require laravel/octane

octane-start:
	cd docker && \
	docker-compose exec app php artisan octane:start --host ${OCTANE_HOST} --port ${OCTANE_PORT}
