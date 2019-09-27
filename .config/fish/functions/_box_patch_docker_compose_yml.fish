function _box_patch_docker_compose_yml

# Update the docker-compose.yml file to use the custom Dockerfile to build the flask-app image

set INSERTED_CODE "
    build:
      context: ./flask-app
      dockerfile: localignore_Dockerfile
"

sed "s;build: [.]/flask-app;build:€      context: ./flask-app€      dockerfile: localignore_Dockerfile;g" ~/work/flowbox/docker-compose.yml \
| tr '€' '\n' > ~/work/flowbox/localignore-docker-compose.yml

end
