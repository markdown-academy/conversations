#!/bin/bash

set -e

# Get the absolute path of the current working directory
CURRENT_DIR="$(pwd)"

# Determine the conversations folder path relative to the script's directory
CONVERSATIONS_DIR="${CURRENT_DIR}/conversations"

# Function to validate a single file
validate_file() {
    local file="$1"
    local relative_path="${file#${CURRENT_DIR}/}"  # Remove the conversations folder path from the file
    echo "Validating: ${relative_path}"
    docker run -v "${CURRENT_DIR}:/data" public.ecr.aws/x4o8p4r2/markdown-academy-cli validate "/data/${relative_path}"
}

# Recursive function to process files
process_files() {
    local dir="$1"
    while IFS= read -r -d '' file; do
        validate_file "$file"
    done < <(find "$dir" -type f -name "*.md" -print0)
}

# Start processing files in the conversations folder
process_files "${CONVERSATIONS_DIR}"
