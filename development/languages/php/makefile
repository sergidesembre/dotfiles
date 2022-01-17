current-dir := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))
project-name :=
docker-image-php := $(project-name).php-fpm

## DOCKER
start:
	@docker-compose -f docker-compose.yml pull
	@docker-compose -f docker-compose.yml up --build -d
	@echo "-- Project started"

stop:
	@docker-compose -f docker-compose.yml down --remove-orphans -v --rmi local
	@echo "-- Project stopped"

list:
	@docker ps --filter "name=$(project-name)"

exec:
	@docker exec -it $(docker-image-php) $(ACTION)

## DEPS
deps/install: DEPS_ACTION=install
deps/require: DEPS_ACTION=require $(package) --no-dev
deps/require/dev: DEPS_ACTION=require $(package) --dev

deps/install deps/require deps/require/dev:
	@docker run --rm --volume $(current-dir):/app --user $(id -u):$(id -g) \
		composer:latest $(DEPS_ACTION) $(DEPS_REQUIRE_DEV) \
			--ignore-platform-reqs

deps/upgrade: ACTION=composer deps/upgrade

## TEST
.PHONY: test/unit test/functional
test/unit: ACTION=composer test/unit
test/unit/debug: ACTION=composer test/unit/debug
test/functional: ACTION=composer test/functional
test/functional/debug: ACTION=composer test/functional/debug
test: test/unit test/unit/debug test/functional test/functional/debug

## QUALITY
.PHONY: quality
quality/beautify: ACTION=composer quality/beautify
	FOLDER=build/quality/beautify
quality/sniffer: ACTION=composer quality/sniffer
	FOLDER=build/quality/sniffer
quality/metrics: ACTION=composer quality/metrics
	FOLDER=build/quality/metrics
quality/mess: ACTION=composer quality/mess
	FOLDER=build/quality/mess
quality: quality/beautify quality/sniffer quality/metrics quality/mess

## OTHERS
clean: ACTION=composer clear-cache

test/unit test/lunit/debug test/functional test/functional/debug \
quality/beautify quality/sniffer quality/metrics quality/mess \
clean: start _create_folder exec stop

_create_folder:
	@if [ ! -d "$(FOLDER)" ]; then mkdir -p $(FOLDER); fi