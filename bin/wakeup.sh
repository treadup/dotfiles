#!/bin/bash

(spotify 1>/dev/null 2>&1 &) || exit 1
sleep 10 || exit 1
spotify-cli --play

