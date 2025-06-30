#!/bin/bash

# Go to parent directory (relative to this script)
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PARENT_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
COURSE_DIR="$PARENT_DIR/course_content"

# Load Conda
source "$(conda info --base)/etc/profile.d/conda.sh"

# Activate Conda environment
ENV_NAME="precision-course-env"
echo "Activating environment: $ENV_NAME"
if ! conda activate "$ENV_NAME"; then
    echo "ERROR: Failed to activate Conda environment '$ENV_NAME'."
    exit 1
fi

# Start Jupyter notebook
echo "Starting Jupyter Notebook in: $COURSE_DIR"
jupyter notebook --notebook-dir="$COURSE_DIR"
