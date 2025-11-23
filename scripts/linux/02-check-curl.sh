#!/bin/bash
echo "Checking for curl..."
if command -v curl &> /dev/null; then
    echo "curl is installed: $(curl --version | head -n 1)"
else
    echo "curl is not installed."
    # echo "To install: sudo apt-get install curl -y"
fi
