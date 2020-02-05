#!/bin/sh
if [ ! -z "$SSH_KEY_URL" ]; then
  echo "Saving ssh key from $SSH_KEY_URL"
  curl -k $SSH_KEY_URL --output ~/.ssh/id_rsa
  chmod 400 ~/.ssh/id_rsa
fi

DATA=~/data
DB_FILE=$DATA/db.json
if [ ! -z "$GIT_REPOSITORY" ]; then
  echo "[INFO] Cloning git repository $GIT_REPOSITORY"
  git clone $GIT_REPOSITORY $DATA
  echo "[INFO] Cloned with the following content"
  ls -la $DATA
  cd $DATA && git config user.name "Git JSON Server" && git config user.email "git-json-server@example.com"
else
  echo "[ERROR] No git repository was specified"
  exit 1
fi

if [ ! -f $DB_FILE ]; then
  echo "[ERROR] Cannot find $DB_FILE in $DATA"
  ls -la $DATA
  exit 1
fi

cd ~ && node server.js
