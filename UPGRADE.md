# Guide for upgrade your flarum container

### Upgrade to v1.x

:warning: Backup your database, config.php, composer.lock and assets folder  
:warning: Disable all 3rd party extensions prior to upgrading in panel admin.

1 - Update your docker-compose file, see an example [here](https://github.com/mondediefr/docker-flarum/tree/master#2---docker-composeyml)

```yml
version: "3"

services:
  flarum:
    image: mondedie/flarum:latest
    ...
```

2 - Pull the last docker images

```sh
docker build -t dsumon/flarum:latest https://github.com/dsumon/docker-flarum.git
docker-compose stop flarum
docker-compose rm flarum
docker-compose up -d flarum
```

3 - Updating your database and removing old assets & extensions

```sh
docker exec -ti flarum php /flarum/app/ flarum migrate
docker exec -ti flarum php /flarum/app/ flarum cache:clear
or
docker exec -ti flarum sh && cd /flarum/app && php flarum migrate
docker exec -ti flarum sh && cd /flarum/app && php flarum cache:clear
```

After that your upgrade is finish. :tada: :tada:
