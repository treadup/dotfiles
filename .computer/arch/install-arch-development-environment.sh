#!/bin/bash

# Install PostgreSQL
pacman --needed --noconfirm -S postgresql

# Install Erlang
pacman --needed --noconfirm -S erlang

# Install RabbitMQ
pacman --needed --noconfirm -S rabbitmq
