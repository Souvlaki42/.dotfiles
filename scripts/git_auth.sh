#!/bin/bash

echo "Do you want to authenticate with Git? (Y/n)"
read answer

# Convert the answer to lowercase for case-insensitive comparison
answer_lowercase=$(echo "$answer" | tr '[:upper:]' '[:lower:]')

if [ "$answer_lowercase" == "y" ]; then
    gh auth login
fi

