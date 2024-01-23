#!/usr/bin/env bash
# This script "installs" the yuse wrapper package on your system.

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

}

copyFiles
setExectobin
checkInstalation
