#!/bin/bash
# Script 2: FOSS Package Inspector
# Purpose: Checks if Git is installed and displays package details

PACKAGE="git"

echo "=============================================="
echo "        FOSS Package Inspector"
echo "=============================================="

# Check package manager and inspect package
if command -v dpkg >/dev/null 2>&1; then
    if dpkg -l | grep -qw "$PACKAGE"; then
        echo "$PACKAGE is installed."
        echo ""
        dpkg -s "$PACKAGE" | grep -E 'Package|Version|Maintainer|Description'
    else
        echo "$PACKAGE is NOT installed."
    fi
elif command -v rpm >/dev/null 2>&1; then
    if rpm -q "$PACKAGE" &>/dev/null; then
        echo "$PACKAGE is installed."
        echo ""
        rpm -qi "$PACKAGE" | grep -E 'Name|Version|License|Summary'
    else
        echo "$PACKAGE is NOT installed."
    fi
else
    echo "No supported package manager found (dpkg/rpm)."
fi

echo ""
echo "Philosophy Note:"
case $PACKAGE in
    git) echo "Git: a distributed version control system built to keep software open, trackable, and collaborative." ;;
    apache2|httpd) echo "Apache: the web server that helped build the open internet." ;;
    python3) echo "Python: a community-shaped language powering education, automation, and innovation." ;;
    firefox) echo "Firefox: a browser created to protect openness and user choice on the web." ;;
    vlc) echo "VLC: a media player that proves software can be free, flexible, and universal." ;;
    *) echo "This package represents the practical power of open-source software." ;;
esac
echo "=============================================="
