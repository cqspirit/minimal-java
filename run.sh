#!/bin/bash -x

docker build -t build-img -f Dockerfile.build . 


ID=$(docker create -it build-img bash)
docker cp src ${ID}:/app
docker start -i ${ID} mvn package
docker cp ${ID}:/app/target/app.war ./target/app.war

# build container with app
#docker build -t img .

