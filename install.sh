#!/bin/bash

set -e

OS="$(uname -s)"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "Detected OS: $OS"

run_scripts() {
    local dir="$1"
    if [ -d "$dir" ]; then
        echo "Running scripts in $dir..."
        shopt -s nullglob
        for script in "$dir"/*; do
            shopt -u nullglob
            if [ -f "$script" ] && [ -x "$script" ]; then
                echo "----------------------------------------"
                echo "Executing $script..."
                "$script"
            elif [ -f "$script" ] && [[ "$script" == *.sh ]]; then
                echo "----------------------------------------"
                echo "Sourcing $script..."
                . "$script"
            elif [ -f "$script" ]; then
                echo "Skipping non-executable file: $script"
            fi
        done
    else
        echo "Directory $dir does not exist, skipping."
    fi
}

# Run common scripts
run_scripts "$SCRIPT_DIR/scripts/common"

if [ "$OS" = "Linux" ]; then
    echo "Running Linux specific scripts..."
    run_scripts "$SCRIPT_DIR/scripts/linux"
elif [ "$OS" = "Darwin" ]; then
    echo "Running macOS specific scripts..."
    run_scripts "$SCRIPT_DIR/scripts/macos"
else
    echo "Unsupported OS: $OS"
    exit 1
fi

echo "Post-install scripts completed successfully!"
