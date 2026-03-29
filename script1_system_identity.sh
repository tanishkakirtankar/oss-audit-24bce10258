#!/bin/bash
# Script 1: System Identity Report
# Author: Tanishka | Course: Open Source Software
# Purpose: Displays important Linux system details for the Open Source Audit project

# -----------------------------
# Variables
# -----------------------------
STUDENT_NAME="Tanishka Kirtankar"
SOFTWARE_CHOICE="Git"

# -----------------------------
# System Information
# -----------------------------
KERNEL=$(uname -r)
USER_NAME=$(whoami)
HOME_DIR=$HOME
UPTIME=$(uptime -p)
CURRENT_DATE=$(date)
DISTRO=$(grep '^PRETTY_NAME=' /etc/os-release | cut -d= -f2 | tr -d '"')

# -----------------------------
# Display Output
# -----------------------------
echo "=============================================="
echo "      Open Source Audit — $STUDENT_NAME"
echo "=============================================="
echo "Chosen Software : $SOFTWARE_CHOICE"
echo "Linux Distro    : $DISTRO"
echo "Kernel Version  : $KERNEL"
echo "Current User    : $USER_NAME"
echo "Home Directory  : $HOME_DIR"
echo "System Uptime   : $UPTIME"
echo "Current Date    : $CURRENT_DATE"
echo "OS License Note : Linux kernel is licensed under GPL v2"
echo "=============================================="
echo "This system runs on open-source foundations."
