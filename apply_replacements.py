import json
from pathlib import Path

# Load replacements data
with open('replacements_data.json', 'r', encoding='utf-8') as f:
    replacements = json.load(f)

# Group replacements by file
files_to_update = {}
for rep in replacements:
    file_path = rep['full_path']
    if file_path not in files_to_update:
        files_to_update[file_path] = []
    files_to_update[file_path].append(rep)

# Process each file
for file_path, reps in files_to_update.items():
    print(f"Processing: {file_path}")
    
    with open(file_path, 'r', encoding='utf-8') as f:
        content = f.read()
    
    # Apply all replacements for this file
    for rep in reps:
        if rep['old_text'] in content:
            content = content.replace(rep['old_text'], rep['new_text'])
            print(f"  ✓ Replaced: {rep['include_file']}")
        else:
            print(f"  ✗ Not found: {rep['include_file']}")
    
    # Write updated content back
    with open(file_path, 'w', encoding='utf-8') as f:
        f.write(content)

print(f"\n=== Summary ===")
print(f"Updated {len(files_to_update)} files")
print(f"Total replacements: {len(replacements)}")
