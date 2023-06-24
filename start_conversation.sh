#!/bin/bash

set -e

# Get the absolute path of the current working directory
CURRENT_DIR="$(pwd)"

# Function to validate a single file
start_file() {
    local file="$1"
    local relative_path="${file#${CURRENT_DIR}/}"  # Remove the conversations folder path from the file
    echo "Starting conversation from file ${relative_path}"
    docker run -it -v "${CURRENT_DIR}:/data" public.ecr.aws/x4o8p4r2/markdown-academy-cli start "/data/${relative_path}"
}

# Start processing files in the conversations folder
start_file $1
