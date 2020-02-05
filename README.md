# Git JSON Server

A docker image based on json-server.

The original functionality is extended by managing the file db.json in a git.
At the start, the given git repo is cloned and the file db.json used.
After each successful POST and GET request, the changes are pushed the git repo.
