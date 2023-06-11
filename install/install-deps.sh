#!/bin/bash

function install_os_packages() {

    apt update -y && apt upgrade -y


    apt install -y \
        apt-transport-https \
        binutils \
        build-essential \
        bzip2 \
        ca-certificates \
        curl \
        git \
        gzip \
        jq \
        libffi-dev \
        libssl-dev \
        nano \
        p7zip-full \
        software-properties-common \
        tar \
        unrar \
        unzip \
        wget \
        zstd

}

function install_exa() {
    if [ ! -f /usr/local/bin/exa ] && [ ! -f /usr/bin/exa ]; then

        echo "Installing exa..."

        LATEST_RELEASE_EXA="$(curl -s https://api.github.com/repos/ogham/exa/releases/latest | jq -r '.tag_name')"

        wget -q -O /tmp/exa-linux-x86_64-$LATEST_RELEASE_EXA.zip https://github.com/ogham/exa/releases/download/$LATEST_RELEASE_EXA/exa-linux-x86_64-$LATEST_RELEASE_EXA.zip
        unzip /tmp/exa-linux-x86_64-$LATEST_RELEASE_EXA.zip -d /tmp/exa
        mv /tmp/exa/bin/exa /usr/local/bin/exa

        chmod 777 /usr/local/bin/exa

        rm -rf /tmp/exa*

        echo "Finished installing exa."

    else
        echo "'exa' already installed. Skipping..."
    fi
}

function install_starship() {

    if [ ! -f /usr/local/bin/starship ]; then

        echo "Installing starship..."

        curl -sS https://starship.rs/install.sh | sh

        mkdir -p ~/.config

        echo "Finished installing starship."

    else
        echo "'starship' already installed. Skipping..."
    fi

}

function install_atuin() {

    if [ ! -f /usr/bin/atuin ]; then

        echo "Installing atuin..."

        mkdir -p ~/.config/atuin

        bash <(curl https://raw.githubusercontent.com/ellie/atuin/main/install.sh)

        atuin import auto

        echo "Finished installing atuin."

    else
        echo "'atuin' already installed. Skipping..."
    fi

}

function install_blesh() {

    if [ ! -f ~/.local/share/blesh/ble.sh ]; then

        ECHO "Installing ble.sh..."

        mkdir -p ~/.local/share/blesh

        wget -O - https://github.com/akinomyoga/ble.sh/releases/download/nightly/ble-nightly.tar.xz | tar xJf -
        
        cp -Rf ble-nightly/* ~/.local/share/blesh/
        rm -rf ble-nightly

        echo "Finished installing ble.sh."

    else
        echo "'ble.sh' already installed. Skipping..."
    fi

}

install_os_packages
install_starship
install_exa
install_atuin
install_blesh