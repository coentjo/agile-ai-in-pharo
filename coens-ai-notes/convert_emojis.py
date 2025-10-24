import os
import re
import emoji
import unicodedata

def get_emoji_latex_name(char):
    """Converts an emoji character to its LaTeX command name using its Unicode name."""
    try:
        # Get the official Unicode name
        unicode_name = unicodedata.name(char)
        # Format for LaTeX: lowercase, spaces to hyphens, and clean up
        latex_name = unicode_name.lower().replace(' ', '-')
        # Remove any lingering problematic characters, just in case
        return re.sub(r'[^a-z0-9-]', '', latex_name)
    except ValueError:
        # Fallback for characters without a name (though unlikely for emojis)
        return None

def convert_emojis_in_file(filepath):
    """Reads a file, replaces all emojis with LaTeX commands, and saves it."""
    try:
        with open(filepath, 'r', encoding='utf-8') as file:
            content = file.read()
    except FileNotFoundError:
        print(f"Error: Could not find file {filepath}")
        return

    new_content = ""
    for char in content:
        if emoji.is_emoji(char):
            latex_name = get_emoji_latex_name(char)
            if latex_name:
                new_content += f"\\emoji{{{latex_name}}}"
            else:
                new_content += char # Keep the original character if we can't find a name
        else:
            new_content += char

    if new_content != content:
        print(f"Found and replaced emojis in {filepath}")
        with open(filepath, 'w', encoding='utf-8') as file:
            file.write(new_content)
    else:
        print(f"No emojis found in {filepath}")

def main():
    """Main function to scan for .qmd files and convert emojis."""
    print("Starting emoji conversion process...")
    for root, _, files in os.walk('.'):
        for file in files:
            if file.endswith('.qmd'):
                filepath = os.path.join(root, file)
                convert_emojis_in_file(filepath)
    print("Emoji conversion process completed!")

if __name__ == "__main__":
    main()
