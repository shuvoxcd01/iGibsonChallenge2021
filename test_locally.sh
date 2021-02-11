#!/usr/bin/env bash

DOCKER_NAME="my_submission"

while [[ $# -gt 0 ]]
do
key="${1}"

case $key in
      --docker-name)
      shift
      DOCKER_NAME="${1}"
      shift
      ;;
    *) # unknown arg
      echo unkown arg ${1}
      exit
      ;;
esac
done


docker run -v $(pwd)/gibson_challenge_data_2021:/opt/iGibson/gibson2/data \
    --runtime=nvidia \
    ${DOCKER_NAME} \
    /bin/bash -c \
    "export CHALLENGE_TRACK=social; bash submission.sh"
