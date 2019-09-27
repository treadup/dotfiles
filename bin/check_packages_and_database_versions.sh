#!/bin/bash

echo 'Checking poetry.lock file against poetry.lock file used to build the docker image.'
if diff poetry.lock /built_with_poetry.lock > /dev/null; then
    echo 'The poetry.lock file has not changed. Proceeding.'
else
    echo 'The poetry.lock file does not match the one that was used to build the current docker image.'
    exit
fi

echo Performing database schema migrations consistency check

SCRIPT_REVISION=$(python manage.py db history | head -n 1 | cut -f 3 -d' ')
echo "SCRIPT_REVISION: $SCRIPT_REVISION"

MARIADB_POSTGRES_REVISIONS=$(python manage.py db current 2>/dev/null | tr '\n' ' ')
MARIADB_REVISION=$(echo $MARIADB_POSTGRES_REVISIONS | cut -f 1 -d' ')
POSTGRES_REVISION=$(echo $MARIADB_POSTGRES_REVISIONS | cut -f 2 -d' ')
echo "MARIADB_REVISION: $MARIADB_REVISION"
echo "POSTGRES_REVISION: $POSTGRES_REVISION"

if [ "${MARIADB_REVISION}${POSTGRES_REVISION}" != "${SCRIPT_REVISION}${SCRIPT_REVISION}" ]; then
    echo Something is wrong with the database revisions

    if [ "${MARIADB_REVISION}" != "${POSTGRES_REVISION}" ]; then
        echo "MariaDB and Postgres are not on the same Alembic database schema revision."
    fi

    if [ "${POSTGRES_REVISION}" != "${SCRIPT_REVISION}" ]; then
        echo "The current database schema in Postgres does not match"
        echo "the latest schema in the migrations/ folder"
    fi

    if [ "${MARIADB_REVISION}" != "${SCRIPT_REVISION}" ]; then
        echo "The current database schema in Mariadb does not match"
        echo "the latest schema in the migrations/ folder"
    fi

    echo "Exiting due to issues with the database schemas"
    exit
fi
