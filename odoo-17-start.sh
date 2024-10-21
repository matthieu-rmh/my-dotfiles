#!/bin/bash
. /home/aranorn/my-paths.conf
current_worked_module=capvi_catalog

if [ -n "$current_worked_module" ]
then
    command="${o17_bin_path} -c ${o17_conf_path} -u ${current_worked_module}"
else
    command="${o17_bin_path} -c ${o17_conf_path}"
fi

eval $command
