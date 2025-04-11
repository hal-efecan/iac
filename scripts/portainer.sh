#!/bin/bash

# This script runs INSIDE the Multipass VM
multipass exec single -- bash << 'END'
    docker volume create portainer_data

    docker run -d \
    -p 8000:8000 \
    -p 9443:9443 \
    --name portainer \
    --restart=always \
    -v /var/run/docker.sock:/var/run/docker.sock \
    -v portainer_data:/data portainer/portainer-ce:lts

    # Login to GUI via VM IP
    # https://<your-vm-ip>:9443/
    # Set user credentials
END