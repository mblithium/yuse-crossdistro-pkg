#!/usr/bin/env bash
# This script "uninstalls" the yuse wrapper package on your system.
set -e 

areYouSure() {
    userprompt=""
    clear
    printf "Are you sure you want to uninstall yuse? [y/n]\n> "
    read userprompt

    if [[ $userprompt == "y" ]]; then 
        userprompt=""
        printf "This poor kitten will be very sad if you do that, do you really want to make this cute creature suffer?"
        printf "
            |\---/|      ´
            | o o | -----
        "
        printf "If you really want to commit this atrocity, type \"yes\". [yes]\n> "
        read userprompt
      
        if [[ $userprompt == "yes" ]]; then 
            echo "YES?? Ok, you'll have to live with it. You've traded the happiness of that little kitten for the uninstallation of a small script of less than 1mb. I hope you can sleep tonight thinking about it."
            uninstall
        else 
            printf "I didn't understand your answer, so I'll take it as no.\nThank you for making this kitten happy. \n"
        fi 

    fi
}

uninstall() {
    if [[ -L /usr/bin/yuse ]]; then
        sudo rm /usr/bin/yuse
    fi
    if [[ -d /opt/yuse-crosspkg ]]; then
        local files="install.sh LICENSE README.md yuse.sh"
        for item in $files 
        do
            sudo rm "/opt/yuse-crosspkg/$item"
        done

        echo "Yuse has been successfully uninstalled"
        sudo rm -r /opt/yuse-crosspkg
    fi
}

areYouSure