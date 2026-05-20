#!/bin/bash

/usr/bin/dockerd --storage-driver=vfs &

docker compose up --build