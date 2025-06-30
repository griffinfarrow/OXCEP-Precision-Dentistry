#!/bin/bash

# Set environment variables
ENV_NAME="precision-course-env"
ENV_FILE="environment.yml"
ENV_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"  # One directory up
FULL_ENV_PATH="$ENV_DIR/$ENV_FILE"

# Display message
echo "========================================"
echo "Setting up course environment from $FULL_ENV_PATH"
echo "========================================"

# Check if environment.yml exists
if [ ! -f "$FULL_ENV_PATH" ]; then
    echo "ERROR: $ENV_FILE not found at $FULL_ENV_PATH."
    exit 1
fi

# Enable conda in this shell
source "$(conda info --base)/etc/profile.d/conda.sh"

# Delete environment if it already exists
if conda env list | grep -qE "^$ENV_NAME\s"; then
    echo "Environment '$ENV_NAME' exists. Removing it..."
    conda env remove -n "$ENV_NAME" -y
fi

# Create the environment
conda env create -f "$FULL_ENV_PATH" -y

echo ""
echo "========================================"
echo "Environment created."
echo "========================================"
echo ""

# Activate environment and run verification
echo "========================================"
echo "Testing whether environment has been correctly created."
echo "========================================"

# Activate and run test
conda activate "$ENV_NAME"
python "$ENV_DIR/verify_installation.py"
