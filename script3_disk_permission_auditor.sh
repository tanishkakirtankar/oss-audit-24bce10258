#!/bin/bash
# Script 3: Disk and Permission Auditor
# Purpose: Audits important Linux directories and checks Git-related config locations

DIRS=("/etc" "/var/log" "/home" "/usr/bin" "/tmp")
GIT_CONFIG_DIR="$HOME/.config/git"

echo "=============================================="
echo "         Directory Audit Report"
echo "=============================================="

for DIR in "${DIRS[@]}"; do
    if [ -d "$DIR" ]; then
        PERMS=$(ls -ld "$DIR" | awk '{print $1, $3, $4}')
        SIZE=$(du -sh "$DIR" 2>/dev/null | cut -f1)
        echo "$DIR => Permissions: $PERMS | Size: $SIZE"
    else
        echo "$DIR does not exist on this system."
    fi
done

echo ""
echo "----------------------------------------------"
echo " Git Configuration Directory Check"
echo "----------------------------------------------"

if [ -d "$GIT_CONFIG_DIR" ]; then
    GIT_PERMS=$(ls -ld "$GIT_CONFIG_DIR" | awk '{print $1, $3, $4}')
    echo "$GIT_CONFIG_DIR exists."
    echo "Permissions: $GIT_PERMS"
else
    echo "$GIT_CONFIG_DIR does not exist."
    echo "Git may still use ~/.gitconfig instead."
fi

if [ -f "$HOME/.gitconfig" ]; then
    FILE_PERMS=$(ls -l "$HOME/.gitconfig" | awk '{print $1, $3, $4}')
    echo "~/.gitconfig found with permissions: $FILE_PERMS"
else
    echo "~/.gitconfig file not found."
fi

echo "=============================================="
