#!/bin/bash
# Project 4: Password Generator
# Generates a strong random password.

read -p "Enter password length: " LENGTH

if ! [[ "$LENGTH" =~ ^[0-9]+$ ]] || [ "$LENGTH" -lt 4 ]; then
    echo "Please enter a valid number greater than or equal to 4."
    exit 1
fi

PASSWORD=$(tr -dc 'A-Za-z0-9!@#$%^&*()_+=' < /dev/urandom | head -c "$LENGTH")

echo "Generated Password: $PASSWORD"
