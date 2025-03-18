#!/bin/bash

# Print colorful messages
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m' # No Color

echo "${GREEN}Starting book build process...${NC}"

# Check if quarto is installed
if ! command -v quarto &> /dev/null; then
    echo "${RED}Error: Quarto is not installed. Please install it first.${NC}"
    echo "Visit: https://quarto.org/docs/get-started/"
    exit 1
fi

# Ensure we're in the right directory
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd "$SCRIPT_DIR"

echo "${GREEN}Building book with Quarto...${NC}"

# Run Quarto to build the PDF
quarto render --to pdf

# Check if the build was successful
if [ $? -eq 0 ]; then
    echo "${GREEN}Book build completed successfully!${NC}"
    echo "Output directory: _output"
else
    echo "${RED}Error: Book build failed. Check the error messages above.${NC}"
    exit 1
fi 