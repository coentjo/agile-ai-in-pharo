#!/bin/bash

# Fix image paths in all qmd files
for file in *.qmd; do
    # Create a temporary file
    temp_file=$(mktemp)
    
    # Replace image paths
    sed 's|!\[\](workshop-AI/agile-ai-as-markdownpages/attach/|![](attach/|g' "$file" > "$temp_file"
    
    # Replace the original file
    mv "$temp_file" "$file"
    echo "Fixed image paths in $file"
done 