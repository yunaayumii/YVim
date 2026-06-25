#!/bin/bash

MODE="NORMAL"
# TODO: Initialize empty BUFFER
BUFFER=""

echo "Welcome to yvim. Mode: $MODE. (PRESS 'q' in Normal Mode to quit)"

while true; do
    read -rsn1 keypress
    if [[ "$MODE" == "NORMAL" ]]; then
        # NORMAL MODE LOGIC 
        if [[ "$keypress" == "q" ]]; then 
            echo "Exiting..."
            break
        elif [[ "$keypress" == "i" ]]; then
            MODE="INSERT"
            # Printing a newline so we start typing on a fresh line
            echo ""
            echo "-- INSERT --"
        else
            # We will ignore standard normal keys for now unless they are 'q' or 'i'
        fi
    else
        # INSERT MODE LOGIC
        if [[ "$keypress" == $'\e' ]]; then
            MODE="NORMAL"
            echo ""
            echo "-- NORMAL --"
        
        # TODO: Handle Backspace
        elif [[ "$keypress" == $"\b" ]]; then
            if [[ "CHANGE_ME_BUFFER_LENGTH_CHECK" ]]; then
                # 1. Visually erase
                # 2. Logically remove last char from BUFFER
            fi
            
        # TODO: Handle Enter
        elif [[ "$keypress" == $"\r" ]]; then
            # 1. Visually drop to a new line
            # 2. Reset the BUFFER
            
        # TODO: Handle standard typing
        else
            # 1. Logically append $keypress to BUFFER
            # 2. Visually print $keypress (no newline)
        fi
    fi
done

echo "Exited gracefully."