#!/bin/bash

# This script demonstrates a race condition in shell scripting.
# It attempts to create a file and then immediately read from it,
# leading to potential errors if the file creation isn't atomic.

# Create a file and immediately try to read it
my_file="/tmp/my_file.txt"
touch "$my_file"
file_contents=$(cat "$my_file")

echo "File Contents: $file_contents"

# Cleanup (ensure file is deleted even if error occurs)
rm -f "$my_file"