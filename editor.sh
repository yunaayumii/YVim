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

        fi
    else
        # INSERT MODE LOGIC                                                                                                                              
        if [[ "$keypress" == $'\e' ]]; then
            MODE="NORMAL"
            echo ""
            echo "-- NORMAL --"
        
        # TODO: Handle Backspace
        elif [[ "$keypress" == $'\x7f' ]]; then
            if [[ ${#BUFFER} -gt 0 ]]; then
                # 1. Visually erase
                echo -ne "\b \b"
                # 2. Logically remove last char from BUFFER
                BUFFER="${BUFFER%?}"
            fi
            
        # TODO: Handle Enter
        elif [[ "$keypress" == "" ]]; then
            # Logically append a newline character to the BUFFER
            BUFFER="${BUFFER}"$'\n'
            echo ""

            
        # TODO: Handle standard typing
        else
            # 1. Logically append $keypress to BUFFER
            BUFFER="${BUFFER}${keypress}"
            # 2. Visually print $keypress (no newline)
            echo -n "$keypress"
        fi
    fi
done

echo "Exited gracefully."