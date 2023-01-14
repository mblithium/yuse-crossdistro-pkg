#!/usr/bin/env bash

# 1: command; 2: arguments; 3: arguments (...)
param1=$1
param2=$2

# Configure your options here.
packageManager="pacman"
nativePKGUpdate="enable"
flatpakUpdate="enabled"
snapUpdate="disabled"
callName="yuse"

function commandHelp() {
    echo -e "
\e[34mHelp about de Yuse Package Wrapper.\e[0m\n

Yuse is a simple, bash centric, cross distro, wrapper for manager packages with the same commands. Check out some of the commands below:

    \e[1;4mUpdate your packages\e[0m
    $callName update 

    \e[1;4mInstall a package\e[0m
    $callName install [package]

    \e[1;4mConfigure for yuse\e[0m
    $callName config
"
}

function commandCredits() {
echo -e "
\e[34mCREDITS\e[0m\n

Yuse is a simple, bash centric, cross distro, wrapper for manager packages with the same commands.\n

Created by: mblithium.
"
}

function commandUpdate() {
    if [[ $packageManager == "pacman" ]]; then
        echo -e "Updating pacman packages...\n"
        sudo pacman -Syu
    fi
    if [[ $packageManager == "apt" ]]; then
        echo -e "Updating apt packages...\n"
        sudo apt update
    fi
    if [[ $flatpakUpdate == "enable" ]]; then
        echo -e "Updating flatpak packages...\n"
        flatpak update
    fi
    if [[ $snapUpdate == "enable" ]]; then 
        echo -e "Updating snap packages...\n"
        snap update
    fi
}

function commandInstall() {
    if ! [[ -z $param2 ]]; then
        echo "Installing package with the your package manager..."
        sudo pacman -S $param2
    fi
}

function commandRemove() {
    if ! [[ -z $param2 ]]; then
        echo "Removing package with the your package manager..."
        sudo pacman -R $param2
    fi
}

function chooseCommand() {
    if [[ -z $param1 ]]; then
        echo -e "\e[1;4mYuse doesn't work without some argument,\nyou can try \"$callName help\" for help.\nI will do it for you...\e[0m"
        commandHelp
    fi

    if [[ $param1 == "install" ]]; then commandInstall; fi

    if [[ $param1 == "remove" ]]; then commandRemove; fi

    if [[ $param1 == "credits" ]]; then commandCredits; fi

    if [[ $param1 == "update" ]]; then commandUpdate; fi

    if [[ $param1 == "help" ]]; then commandHelp; fi
}

function init() {
    chooseCommand
}

init




