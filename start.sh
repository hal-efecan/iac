#!/bin/bash

for vm in my-vm1 my-vm2; do
    if ! multipass info $vm &> /dev/null; then
        multipass launch --name $vm --cpus 1 --memory 2G --disk 3G
        multipass launch --name $vm --cpus 1 --memory 2G --disk 3G
    else
    echo "VM '$vm' already exists."
    fi
done