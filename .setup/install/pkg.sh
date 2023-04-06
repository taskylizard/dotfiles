#!/bin/bash

# Make sure the script is run as root
if [ "$(id -u)" != "0" ]; then
	echo "This script must be run as root." 1>&2
	exit 1
fi

apt-get update

# begin the fun
while read -r package; do
	apt-get install -y "$package"
done <"pkglist.txt"
