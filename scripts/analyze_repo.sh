#!/bin/bash

# Define the URL of the Git repository to analyze
repo_url="https://github.com/shuklamaneesh23/otamoz_gdsc"

tmp_dir=$(mktemp -d)
echo "Cloning repository from $repo_url to $tmp_dir ..."

git clone "$repo_url" "$tmp_dir" > /dev/null 2>&1

cd "$tmp_dir" || { echo "Failed to change directory."; exit 1; }

echo "Analyzing lines of code in the repository ..."
cloc_output_file="cloc_output.txt"
cloc . --exclude-dir=vendor,node_modules,build,dist --csv > "$cloc_output_file"

echo "Summary of lines of code by language:"
cat "$cloc_output_file"

permanent_dir="/Users/pranjaysingh/Desktop/cloc"
mv "$cloc_output_file" "$permanent_dir"

echo "Cleaning up temporary directory ..."
rm -rf "$tmp_dir"

echo "Done."
