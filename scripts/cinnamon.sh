#!/bin/bash
# command to capture settings changes:
# dconf watch /


theme_settings () {
    gsettings set org.cinnamon.desktop.interface gtk-theme "'Adwaita-dark'" &&
    gsettings set org.cinnamon.desktop.interface icon-theme "$icons" &&
    gsettings set org.cinnamon.desktop.interface cursor-theme "$cursor" &&
    gsettings set org.cinnamon.theme name "$theme" &&
    gsettings set org.cinnamon.desktop.background picture-uri ""file://$backround_picture_path"" &&
    log_success $FUNCNAME || log_failure $FUNCNAME
    }

clock_settings () {
    gsettings set org.gnome.desktop.interface clock-format "'12h'" &&
    gsettings set org.cinnamon.desktop.interface clock-show-date "true" &&
    log_success $FUNCNAME || log_failure $FUNCNAME
    }

file_interface_settings () {
    gsettings set org.nemo.window-state side-pane-view "'tree'" &&
    gsettings set org.nemo.desktop home-icon-visible "false" &&
    gsettings set org.nemo.desktop computer-icon-visible "false" &&
    gsettings set org.nemo.preferences show-new-folder-icon-toolbar "true" &&
    gsettings set org.nemo.preferences show-open-in-terminal-toolbar "true" &&
    gsettings set org.nemo.preferences click-double-parent-folder "true" &&
    gsettings set org.nemo.preferences default-folder-viewer "'list-view'" &&
    log_success $FUNCNAME || log_failure $FUNCNAME
    }

misc_settings () {
    gsettings set org.cinnamon hotcorner-layout "['scale:true:0', 'scale:false:0', 'scale:false:0', 'expo:false:0']" &&
    gsettings set org.cinnamon.desktop.notifications remove-old "true" &&
    gsettings set org.cinnamon.desktop.notifications bottom-notifications "true" &&
    gsettings set org.cinnamon.desktop.privacy remember-recent-files "false" &&
    gsettings set org.cinnamon.desktop.wm.preferences action-scroll-titlebar "'opacity'" &&
    gsettings set org.cinnamon panels-autohide "['1:intel']" &&
    log_success $FUNCNAME || log_failure $FUNCNAME
    }

mouse_settings () {
    gsettings set org.cinnamon.desktop.peripherals.mouse locate-pointer "true" &&
    gsettings set org.cinnamon.desktop.peripherals.mouse speed "$mouse_speed" &&
    gsettings set org.cinnamon.desktop.peripherals.touchpad speed "$touchpad_speed" &&
    gsettings set org.cinnamon.desktop.peripherals.touchpad tap-to-click "true" &&
    log_success $FUNCNAME || log_failure $FUNCNAME
    }

keyboard_settings () {
    gsettings set org.cinnamon.desktop.keybindings.wm push-tile-down "@as []" &&
    gsettings set org.cinnamon.desktop.keybindings.wm minimize "['<Super>Down']" &&
    gsettings set org.cinnamon.desktop.keybindings.wm push-tile-up "@as []" &&
    gsettings set org.cinnamon.desktop.keybindings.wm toggle-maximized "['<Super>Up']" &&
    gsettings set org.cinnamon.desktop.keybindings.wm close "['<Alt>F4', '<Alt>Escape']" &&
    log_success $FUNCNAME || log_failure $FUNCNAME
    }

xed_settings () {
    gsettings set org.x.editor.preferences.editor wrap-mode "'none'" &&
    gsettings set org.x.editor.preferences.editor scheme "'cobalt'" &&
    log_success $FUNCNAME || log_failure $FUNCNAME
    }

favorites () {
    gsettings set org.x.apps.favorites list "$favorite_folders_list" &&
    gsettings set org.cinnamon favorite-apps "$favorite_apps_list" &&
    log_success $FUNCNAME || log_failure $FUNCNAME
    }


settings_group () {
    theme_settings &&
    clock_settings &&
    file_interface_settings &&
    misc_settings &&
    mouse_settings &&
    keyboard_settings &&
    xed_settings &&
    favorites &&
    log_success $FUNCNAME || log_failure $FUNCNAME
    }
