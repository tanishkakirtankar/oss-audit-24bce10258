#!/bin/bash
# Script 4: Log File Analyzer
# Purpose: Reads a log file, counts keyword occurrences, and shows recent matches

LOGFILE=$1
KEYWORD=${2:-"error"}
COUNT=0

# Check if filename is provided
if [ -z "$LOGFILE" ]; then
    echo "Usage: ./script4_log_analyzer.sh <logfile> [keyword]"
    exit 1
fi

# Check if file exists
if [ ! -f "$LOGFILE" ]; then
    echo "Error: File $LOGFILE not found."
    exit 1
fi

# Check if file is empty
if [ ! -s "$LOGFILE" ]; then
    echo "Warning: File $LOGFILE is empty."
    echo "Please provide a non-empty log file."
    exit 1
fi

# Read file line by line
while IFS= read -r LINE; do
    if echo "$LINE" | grep -iq "$KEYWORD"; then
        COUNT=$((COUNT + 1))
    fi
done < "$LOGFILE"

echo "=============================================="
echo "           Log File Analyzer"
echo "=============================================="
echo "Log File : $LOGFILE"
echo "Keyword  : $KEYWORD"
echo "Matches  : $COUNT"
echo "=============================================="

echo ""
echo "Last 5 matching lines:"
grep -i "$KEYWORD" "$LOGFILE" | tail -5
