#!/usr/bin/env bash
# Yuse - Crossdistro Package Wrapper.

# 1: command; 2: arguments; 3: arguments (...)
param1=$1
param2=$2

# ------ Meta ------
# Version
yuse_version="0.2"
yuse_version_channel="alpha"
yuse_location=$0

callName="yuse" 
packageManager="pacman"
nativePKGUpdate="enabled"
flatpakUpdate="disabled" # [enabled/disabled]
snapUpdate="disabled" # [enabled/disabled]
distroID="DetectDistro"
afterUpdateDo=""

# Yuse config Path
# Here is the user configurations.
yuse_config_path="/opt/yuse-crosspkg/config/yuse.config"

# Configuration file
# Please change your settings in the "./yuse.config" file.
# (this changes the default settings).

function loadConfig() {
    if [[ -e $yuse_config_path ]]; then
        source "${yuse_config_path}"
    fi
}

# . yuse.config
loadConfig


function detectDistro() {
    local distID=$(cat /etc/os-release | grep -w "NAME=")
    local distID=${distID:6:-1}
    if ! [[ -z distID ]]; then distroID=$distID; fi
}

function setNativePKGManager() {
    IFS=$'\n\t'
    local distroPacman=("Arch Linux" "Manjaro")
    for distro in ${distroPacman[@]}; do
        if [[ $distro == $distroID ]]; then packageManager="pacman"; fi
    done

    local distroAPT=("Debian" "Debian GNU/Linux" "Ubuntu" "Mint")
    for distro in ${distroAPT[@]}; do
        if [[ $distro == $distroID ]]; then packageManager="apt"; fi
    done

    local distroDNF=("Fedora" "Red Hat")
    for distro in ${distroDNF[@]}; do
        if [[ $distro == $distroID ]]; then packageManager="dnf"; fi
    done
}

function commandHelp() {
    echo -e "
\e[34mHelp about the Yuse Package Wrapper.\e[0m

Version: $yuse_version ($yuse_version_channel)
Distro: $distroID
Shell: $SHELL

Yuse is a simple, bash centric, cross distro, wrapper for manager packages with the same commands. Its syntax is simple and focusing on being more human. Check out some of the commands below:

    \e[1;4mInstall a package\e[0m
    $callName install [package]

    \e[1;4mRemove a package\e[0m
    $callName install [package]

    \e[1;4mUpdate your packages\e[0m
    $callName update 

    \e[1;4mClear cache from package manager\e[0m
    $callName clear

    \e[1;4mConfigure yuse\e[0m
    $callName config
"
}

function commandCredits() {
echo -e "
\e[34mCREDITS\e[0m

Yuse is a simple, bash centric, cross distro, wrapper for manager packages with the same commands.

Created by: mblithium.
Download or contribute here: https://github.com/mblithium/yuse-crossdistro-pkg
"
}

function clearPKGCache() {
    if [[ $packageManager == pacman ]]; then
        sudo pacman -Sc
    fi
}

function commandUpdate() {
    case $packageManager in 
        "pacman")
            echo -e "Updating pacman packages...\n"
            sudo pacman -Syu
        ;;
        "apt")
            echo -e "Updating apt packages...\n"
            sudo apt update
            sudo apt upgrade
        ;;
        "dnf")
            echo -e "Updating apt packages...\n"
            sudo dnf upgrade
        ;;
        "yum")
            echo -e "Updating YUM packages...\n"
            yum update
    esac
  
    if [[ $flatpakUpdate == "enabled" ]]; then
        echo -e "Updating flatpak packages...\n"
        flatpak update
    fi
    if [[ $snapUpdate == "enabled" ]]; then 
        echo -e "Updating snap packages...\n"
        snap update
    fi
}

function commandInstall() {
    if ! [[ -z $param2 ]]; then
        echo "Installing package with the your package manager..."
        case $packageManager in 
            "pacman") 
                sudo pacman -S $param2 
            ;;
            "apt")
                sudo apt install $param2
            ;;
            "dnf")
                sudo dnf install $param2
            ;;
            *) 
                echo "The script couldn't identify your package manager."
            ;;
        esac
    fi
}

function commandRemove() {
    if ! [[ -z $param2 ]]; then
        echo "Removing package with the your package manager..."
        case $packageManager in
            "pacman")
                 sudo pacman -R $param2 
            ;;
            "apt")
                sudo apt remove $param2
            ;;
            "dnf")
                sudo dnf remove $param2
            ;;
            "flatpak")
                flatpak remove $param2
            ;;
        esac
    fi
}

function commandListPKG() {
    if ! [[ -z $param1 ]]; then
        echo "listing installed packages..."
        case $packageManager in
            "pacman")
                echo "Pacman Packages: " > packageslist.txt
                sudo pacman -Q >> packageslist.txt 
                echo "Your pacman packages: "
                while read line; do echo $line; done < packageslist.txt | less
            ;;
            "apt")
                echo ""
            ;;
            "dnf")
                echo ""
            ;;
            "flatpak")
                flatpak list | less
            ;;
        esac
    fi
}


function configCommand() {
    echo "Configurations..."
    echo "Yuse config path: $yuse_config_path"
    sudo vim $yuse_config_path
    loadConfig
}

function chooseCommand() {
    if [[ -z $param1 ]]; then
        echo -e "\e[1;31mYuse doesn't work without some argument,\nyou can try \"$callName help\" for help.\nI will do it for you...\e[0m"
        commandHelp
    fi

    case $param1 in
    "install")
        commandInstall
        ;;
    "update")
        commandUpdate
        ;;
    "remove")
        commandRemove
        ;;
    "clear")
        clearPKGCache
        ;;
    "config")
        configCommand
        ;;
    "list")
        commandListPKG
        ;;
    "help")
        commandHelp
        ;;
    "credits")
        commandCredits
        ;;
    *)
        printf "Invalid argument, try using \"yuse help\" to find out what options are available.\n"
        ;;
    esac
}


function afterUpdate() {
    # Scripts that run after update
    if [[ $param2 == "--flatpak" ]]; then
        $flatpakUpdate = "enabled"
        flatpak update
    fi
   return 0
}

function log() {
    echo "TESTANDO $1"
}

function init() {
    if [[ $distroID == "DetectDistro" ]]; then detectDistro; fi
    if [[ $nativePKGUpdate == "enabled" ]]; then setNativePKGManager; fi
    chooseCommand
    afterUpdate
}

init

# By: mblithium
# https://github.com/mblithium