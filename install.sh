#!/usr/bin/env bash
# This script "installs" the yuse wrapper package on your system.

areYouSure() {
    clear
    userprompt=""
    printf "Do you want to install the yuse package wrapper on your system? [y/n]\nIt will be installed in /opt/yuse-crosspkg\n> "
    read userprompt

    installOpt() {
        echo "Installing..."
        copyFiles
        setExectobin
        checkInstalation
    }

    noOpt() {
        echo "You choose not to install, the script will be closed."
    }

    case $userprompt in
    "y")
        installOpt
        ;;
    "yes")
        installOpt
        ;;
    "n")
        noOpt
        ;;
    "no")
        noOpt
        ;;
    *)
        echo "I didn't understand your answer, so I'll take it as no."
        ;;
    esac
}

copyFiles() {
    if [[ -d /opt/yuse-crosspkg ]]; then
        sudo rm -r /opt/yuse-crosspkg
    fi
    
    sudo cp -r $(pwd) /opt/yuse-crosspkg
}

setExectobin() {
    if [[ -e /usr/bin/yuse ]]; then
        sudo rm /usr/bin/yuse
    fi

    sudo ln -s /opt/yuse-crosspkg/yuse.sh /usr/bin
    sudo mv /usr/bin/yuse.sh /usr/bin/yuse
}

checkInstalation() {
    # TODO: Put some conditions here to check if there are all the necessary files.

    # fake, don't trust me
    echo "Nice, it's been installed successfully, trust me."
    printf "use: \"yuse about\" for more information\n"
}

areYouSure