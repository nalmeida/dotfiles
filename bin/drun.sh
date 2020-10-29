#!/bin/bash

# @source: https://gist.github.com/bahmutov/448f73b49914d1981643

DOCKER_NODE=$1;
PARAM="${@:2}";

B1="\033[1m";
B2="\033[0m";

if [ "$#" -lt 2 ];
	then
		echo -e "${B1}ERROR${B2}";
		echo -e " You must pass the FIRST parameter as the Docker image.";
		echo -e " You must pass the SECOND parameter as the node command. E.g.:";
		echo -e " $ drun node:latest node --version";
		exit 1;
fi

if [[ "$(docker images -q ${DOCKER_NODE} 2> /dev/null)" == "" ]];
	then
		echo -e "${B1}ERROR${B2}";
		echo -e "The Docker image: ${DOCKER_NODE} does not exists."
		echo -e "\n${B1}Check the available images from your machine${B2}";
		docker images
		echo -e "";
		exit 1;
fi

docker run -it --rm --name docker-node -v "$PWD":/usr/src/app -w /usr/src/app ${DOCKER_NODE} ${PARAM}