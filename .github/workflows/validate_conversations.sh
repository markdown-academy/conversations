#!/bin/bash

# Define the validation command
VALIDATION_COMMAND="docker run -v $(pwd):/data 693201755147.dkr.ecr.eu-west-1.amazonaws.com/markdown-academy-cli:latest validate"

# Function to validate a single file
validate_file() {
    local file="$1"
    echo "Validating: $file"
    $VALIDATION_COMMAND "/data/$file"
}

# Recursive function to process files
process_files() {
    local dir="$1"
    for file in "$dir"/*.md; do
        if [ -f "$file" ]; then
            validate_file "$file"
        elif [ -d "$file" ]; then
            process_files "$file"
        fi
    done
}

# Start processing files in the conversations folder
process_files "conversations"
