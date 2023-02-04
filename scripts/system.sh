#!/bin/bash


firewall () {
    sudo ufw enable &&
    log_success $FUNCNAME || log_failure $FUNCNAME
    }

app_menu () {  # https://specifications.freedesktop.org/menu-spec/menu-spec-latest.html
    cp "$ROOT_DIR"/assets/app-menu/applications/* ~/.local/share/applications &&
    # system examples at /usr/share/applications
    cp "$ROOT_DIR"/assets/app-menu/applications-merged/* ~/.config/menus/applications-merged &&
    # system examples at /etc/xdg/menus/applications-merged
    cp "$ROOT_DIR"/assets/app-menu/desktop-directories/* ~/.local/share/desktop-directories &&
    # system examples at /usr/share/desktop-directories
    cp "$ROOT_DIR"/assets/app-menu/icons/* ~/.local/share/ice/icons &&
    cp -r "$ROOT_DIR"/assets/app-menu/firefox/* ~/.local/share/ice/firefox &&
    log_success $FUNCNAME || log_failure $FUNCNAME
    }

remove_unused_packages () {
    sudo apt remove thunderbird -y &&
    sudo apt remove hexchat -y &&
    log_success $FUNCNAME || log_failure $FUNCNAME
    }


system_group () {
    firewall &&
    app_menu &&
    remove_unused_packages &&
    log_success $FUNCNAME || log_failure $FUNCNAME
}
