#!/bin/bash

# Function to install syslog-ng on Debian-based systems (e.g., Ubuntu)
install_debian() {
    sudo apt update -y
    sudo apt install -y syslog-ng
}

# Function to install syslog-ng on Red Hat-based systems (e.g., CentOS, Fedora)
install_redhat() {
    sudo yum update -y
    sudo yum install -y syslog-ng
}

# Function to install syslog-ng on Arch-based systems (e.g., Arch Linux)
install_arch() {
    sudo pacman -Syu --noconfirm syslog-ng
}

# Function to install syslog-ng on other systems (unsupported)
install_other() {
    echo "Unsupported operating system. Please manually install syslog-ng."
}

# Detect the operating system
os=$(uname -s)

# Perform installation based on the detected OS
case "$os" in
    Linux*)
        if [ -x "$(command -v apt)" ]; then
            install_debian
        elif [ -x "$(command -v yum)" ]; then
            install_redhat
        elif [ -x "$(command -v pacman)" ]; then
            install_arch
        else
            install_other
        fi
        ;;
    *)
        install_other
        ;;
esac

echo "syslog-ng installation completed!"
