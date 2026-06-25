#!/bin/bash

# TODO: Initialize the MODE variable to "NORMAL"
MODE="NORMAL"

echo "Welcome to yvim. Mode: $MODE. (PRESS 'q' in Normal Mode to quit)"

while true; do
    read -rsn1 keypress

    # TODO: Check if MODE is "NORMAL"
    if [[ "$MODE" == "NORMAL" ]]; then
        if [[ "$keypress" == "q" ]]; then 
            echo "Exiting..."
            break
        elif [[ "$keypress" == "i" ]]; then
            # TODO: Switch mode to INSERT and print a visual indicator
            MODE="INSERT"
            echo "Switched to Insert Mode"
        else
            echo "Normal command: $keypress"
        fi
    # TODO: Handle the "INSERT" mode logic
    else
        if [[ "$keypress" == $'\e' ]]; then
            # TODO: Switch mode back to NORMAL and print a visual indicator
            MODE="NORMAL"
            echo "Switched to Normal Mode" 
        else
            echo "Typing: $keypress"
        fi
    fi
done

echo "Exited gracefully."