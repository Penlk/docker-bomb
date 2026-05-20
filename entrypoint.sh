#!/bin/bash

/usr/bin/dockerd --storage-driver=vfs --ipv6=false &

docker compose up --build