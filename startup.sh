#!/usr/bin/env bash

LOG_FILE="startup_unix.log"

# Recreate venv
echo "Setting up venv"
python3 -m venv .venv > "$LOG_FILE" 2>&1

# Enter venv
source .venv/bin/activate >> "$LOG_FILE" 2>&1

# Install packages from requirements file
REQ_FILE="requirements.txt"

if [[ -f "$REQ_FILE" ]]; then
    echo "Installing packages from $REQ_FILE..."
    pip install --upgrade pip >> "$LOG_FILE" 2>&1
    pip install -r "$REQ_FILE" >> "$LOG_FILE" 2>&1
else
    echo "No $REQ_FILE found. Skipping package install."
fi

# Run program
echo "Running dataCapture.py"
python3 dataCapture.py


