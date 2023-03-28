#!/bin/bash
docker exec -it mariadb bash -c "mysqldump -uroot -ppassword flarum > /root/backupflarumsql.txt"
docker cp mariadb:/root/backupflarumsql.txt ~/docker/flarum/backupflarumsql_$(date +%Y-%m-%d).txt
