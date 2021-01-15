#!/bin/bash

leave="${1}";
if [[ "${leave}" == "" ]]; then leave="5"; fi

mount_point=$(tmutil destinationinfo | rg "Mount Point" | sed 's/.*://;s/[[:space:]]*//')
backups=($(tmutil listbackups))

length="${#backups[@]}"
to="(("${length}"-"${leave}"))"

i=0; while [[ "${i}" -lt "${to}"  ]]; do
    backup="${backups[i]}"
    echo "deleting ${mount_point}/${backup}"
    sudo tmutil delete -d ${mount_point} -t ${backup}
    ((++i))
done
