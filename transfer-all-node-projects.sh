#!/bin/bash

for d in */; do
    if [ -f "$d/package.json" ]; then
        echo "package.json found in $d"
        if [ -d "$d/node_modules" ]; then
            echo "deleting node_modules in $d"
            rm -rf "$d/node_modules"
            echo "transferring $d to your VPS"
            scp -r "$d" user@your_vps_ip:~/destination_folder
        fi
    fi
done
