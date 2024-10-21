#!/bin/bash
. /home/aranorn/my-paths.conf
current_worked_module=confidentiality_agreement

if [ -n "$current_worked_module" ]
then
    command="${bin_path} -c ${conf_path} -u ${current_worked_module}"
else
    command="${bin_path} -c ${conf_path}"
fi

eval $command
