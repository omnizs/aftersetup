#!/bin/bash
echo "Gathering OS Information..."
if [ -f /etc/os-release ]; then
    . /etc/os-release
    echo "OS: $NAME"
    echo "Version: $VERSION"
elif [ -f /usr/bin/sw_vers ]; then
    echo "OS: macOS"
    sw_vers
else
    echo "Unknown OS"
fi
echo "Kernel: $(uname -r)"
echo "Architecture: $(uname -m)"
