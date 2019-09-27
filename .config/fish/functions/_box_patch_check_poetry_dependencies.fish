function _box_patch_check_poetry_dependencies

# Updates the Dockerfile to copy over the poetry.lock file that was used to build
# the docker image.

sed -e "s;COPY pyproject.toml poetry.lock ./;COPY pyproject.toml poetry.lock ./ €COPY poetry.lock /built_with_poetry.lock;g" ~/work/flowbox/flask-app/Dockerfile \
| tr '€' '\n' | sed -e 's/docker-entrypoint/localignore-docker-entrypoint/g' > ~/work/flowbox/flask-app/localignore_Dockerfile

# Updates the docker-entrypoint.sh script to check that the current poetry lock file
# matches the one that was used to build the docker image.

set INSERTED_CODE "#!/bin/bash
echo 'Checking poetry.lock file against poetry.lock file used to build the docker image.'
if diff poetry.lock /built_with_poetry.lock > /dev/null; then
    echo 'The poetry.lock file has not changed. Proceeding.'
else
    echo 'The poetry.lock file does not match the one that was used to build the current docker image.'
    exit
fi"

echo $INSERTED_CODE >> ~/work/flowbox/flask-app/localignore-docker-entrypoint.sh
cat ~/work/flowbox/flask-app/docker-entrypoint.sh >> ~/work/flowbox/flask-app/localignore-docker-entrypoint.sh

end
