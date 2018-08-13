#!/bin/bash

#
# Install development environment.
#

# Update apt cache
apt update

# Install PostgreSQL
apt install -y postgresql postgresql-doc postgresql-contrib postgresql-client

# Install Erlang
apt install -y erlang

# Install RabbitMQ
apt install -y rabbitmq-server

# Install Redis
apt install -y redis
apt install -y redis-tools
