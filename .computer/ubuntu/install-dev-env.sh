#!/bin/bash

#
# Install development environment.
#

# Update apt cache
apt-get update

# Install PostgreSQL
apt-get install -y postgresql postgresql-doc postgresql-contrib postgresql-client

# Install Erlang
apt-get install -y erlang

# Install RabbitMQ
apt-get install -y rabbitmq-server

# Install Redis
apt-get install -y redis
apt-get install -y redis-tools

# Install MariaDB
apt-get install -y mariadb-server mariadb-client
