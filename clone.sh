#!/usr/bin/env bash

REPOS=(config monthly-report discover arch-ansible telebot ticket-parser)
REPO_DIR="${HOME}/hubrepo/mines"

cd ${REPO_DIR}

for REPO in ${REPOS[@]}
do
    if [[ -d ${REPO} ]]
    then
        echo "Pulling ${REPO}"
        cd ${REPO_DIR}/${REPO}
        git pull &> /dev/null
        cd ${REPO_DIR}
    else
        cd ${REPO_DIR}
        echo "Cloning ${REPO}"
        git clone git@gitlab.com:seintz/${REPO}.git &> /dev/null
    fi
done
