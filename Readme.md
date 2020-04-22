# TestTechnique dockorized

## lunch the webservice
Execute the following command:
* git clone https://github.com/pivox/TestTechniqueDockerized.git
* cd TestTechniqueDockerized/source/
* git clone https://github.com/pivox/WebServiceForTechnicalTest.git
* git clone https://github.com/pivox/TechnicalTest.git
* cd ..
* docker-compose build --pull
* docker-compose up -d

## set up the project

> docker exec -ti sf-console php bin/console init-project

## Run unit test 

docker exec -ti sf-console vendor/bin/simple-phpunit

## Run a functional test 

> docker exec -ti php-console bin/behat 




