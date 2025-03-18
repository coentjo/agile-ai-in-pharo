#!/bin/bash

# Convert all markdown files to qmd
for file in *.md; do
    if [ "$file" != "README.md" ]; then
        # Create the new filename
        new_file="${file%.md}.qmd"
        # Convert spaces to hyphens in the filename
        new_file=$(echo "$new_file" | tr ' ' '-')
        # Copy the content
        cp "$file" "$new_file"
        echo "Converted $file to $new_file"
    fi
done

# Create references.bib if it doesn't exist
touch references.bib 