#!/bin/bash

echo "Welcome to yvim. Press 'q' to quit."

while true; do
    # TODO: 1. Read a single character instantly and silently into a variable named 'key'
    read -rsn1 keypress

    # TODO: 2. Check if the key is 'q'. If it is, echo "Exiting..." and break the loop.
    if [[ "$keypress" == "q" ]]; then 
        echo "Exiting..."
        break
    # TODO: 3. If it is not 'q', echo "You pressed: $key"
    else 
        echo "You pressed: $keypress" 
    fi
done

echo "Exited gracefully."