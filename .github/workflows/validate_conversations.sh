#!/bin/bash

set -e

CURRENT_DIR="$(pwd)"

# Function to validate a single file
validate_file() {
    local file="$1"
    if [ -f "$file" ]; then
        echo "Validating: $file"
        docker run -v "$(pwd):/data" 693201755147.dkr.ecr.eu-west-1.amazonaws.com/markdown-academy-cli:latest validate "/data/$file"
    elif [ -d "$file" ]; then
        process_files "$file"
    fi
}

# Recursive function to process files
process_files() {
    local dir="$1"
    while IFS= read -r -d '' file; do
        validate_file "$file"
    done < <(find "$dir" -type f -name "*.md" -print0)
}

# Start processing files in the conversations folder
process_files "$CURRENT_DIR/conversations"
