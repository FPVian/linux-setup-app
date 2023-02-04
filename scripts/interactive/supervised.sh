#!/bin/bash
ROOT_DIR="$( dirname -- "$( dirname -- "$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )" )" )"
source "$ROOT_DIR"/configs/imports.sh

virtualbox_ext_pack () {
    sudo apt install virtualbox-ext-pack -y &&
    log_success $FUNCNAME || log_failure $FUNCNAME
    }


"$@"
read -p "Press enter to continue"
