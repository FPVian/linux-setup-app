#!/bin/bash


steam () {
    install_using_apt steam
    cp /usr/share/applications/steam.desktop ~/.local/share/applications/steam.desktop &&
    sed -i 's:Exec=/usr/games/steam %U:Exec=env GDK_SCALE=2 /usr/games/steam %U:' ~/.local/share/applications/steam.desktop &&
    log_success 'steam resizing' || log_failure 'steam resizing'
    }

discord () { install_from_online_deb discord $discord_url ;}

minecraft () { install_from_online_deb minecraft $minecraft_url ;}

openrgb () { download_appimage OpenRGB $openrgb_url ;}

lutris () { install_flatpak net.lutris.Lutris ;}  # deb available


gaming_group () {
    steam &&
    discord &&
    minecraft &&
    openrgb &&
    lutris &&
    log_success $FUNCNAME || log_failure $FUNCNAME
    }
