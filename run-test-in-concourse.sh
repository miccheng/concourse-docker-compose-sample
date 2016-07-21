#!/bin/bash

WORKDIR=`pwd`

echo $WORKDIR

cd compose-sample-git

service docker start

docker-compose build
docker-compose up -d

docker-compose run web rake db:create db:migrate RAILS_ENV=test

docker-compose run web bundle exec rspec spec
