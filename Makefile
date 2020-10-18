MAKEFLAGS += --warn-undefined-variables --no-builtin-rules
SHELL := bash
.SHELLFLAGS := -eu -o pipefail -c

dc-run := docker-compose run --rm --no-deps
dc-run-user := $(dc-run) --user "1000:1000"
php-sf-container := $(dc-run-user) --workdir="/var/www" php-fpm
php-console-container := $(dc-run-user) --workdir="/var/www" php-webservice
php-sf := $(php-sf-container) php
sf-command := $(php-sf-container) php bin/console
php-console := $(php-console-container) php
xdebug-console := $(php-console-container) xdebug
xdebug-sf := $(php-sf-container) xdebug


git-get-all: docker git-get-sf-project git-get-web-service-project  vendor init-sf-project


docker:
	docker-compose build --parallel;docker-compose up -d

git-get-sf-project:
	rm -rf source/TechnicalTest/
	cd source;git clone https://github.com/pivox/TechnicalTest.git

git-get-web-service-project:
	rm -rf source/WebServiceForTechnicalTest/
	cd source;git clone https://github.com/pivox/WebServiceForTechnicalTest.git

vendor: vendor-console vendor-sf

vendor-console: source/WebServiceForTechnicalTest/composer.json
	$(php-console-container) composer install --prefer-dist --no-suggest
	@touch source/WebServiceForTechnicalTest

vendor-sf: source/TechnicalTest/composer.json
	$(php-sf-container) composer install --prefer-dist --no-suggest
	@touch source/TechnicalTest

vendor-update: vendor-console-update vendor-sf-update

vendor-console-update: source/WebServiceForTechnicalTest/composer.json
	$(php-console-container) composer update --prefer-dist --no-suggest
	@touch source/WebServiceForTechnicalTest

vendor-sf-update: source/TechnicalTest/composer.json
	$(php-sf-container) composer update --prefer-dist --no-suggest
	@touch source/TechnicalTest

autoload: source/WebServiceForTechnicalTest/vendor/autoload.php
	$(php-console-container) composer dump-autoload -o

init-sf-project:
	$(sf-command) doctrine:database:drop --force --if-exists
	$(sf-command) doctrine:database:create -n
#	$(sf-command) doctrine:migration:migrate --no-interaction
#	$(sf-command) doctrine:fixtures:load --no-interaction

console-get-all:
	$(php-console) main.php GET

console-get-id-1:
	$(php-console) main.php GET --id_question=1

console-update-id-1:
	$(php-console) main.php UPDATE --id=1

inside-sf:
	docker-compose exec php-fpm sh

inside-webservice:
	docker-compose exec php-webservice sh
