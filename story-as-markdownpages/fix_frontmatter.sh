#!/bin/bash

for file in *.qmd; do
    # Get the title from the first line that starts with #
    title=$(grep -m 1 '^# ' "$file" | sed 's/^# //')
    
    if [ -z "$title" ]; then
        # If no title found, use the filename
        title=$(basename "$file" .qmd)
    fi
    
    # Create a temporary file
    temp_file=$(mktemp)
    
    # Add clean YAML frontmatter
    echo "---" > "$temp_file"
    echo "title: \"$title\"" >> "$temp_file"
    echo "---" >> "$temp_file"
    echo "" >> "$temp_file"
    
    # Add the content, skipping any existing YAML frontmatter
    awk '
        BEGIN { in_yaml=0; found_first_yaml=0 }
        /^---$/ {
            if (!found_first_yaml) {
                in_yaml=1;
                found_first_yaml=1;
            } else if (in_yaml) {
                in_yaml=0;
            }
            next;
        }
        !in_yaml && !/^title:/ { print }
    ' "$file" >> "$temp_file"
    
    # Replace the original file with the new content
    mv "$temp_file" "$file"
    
    echo "Fixed frontmatter in $file"
done 