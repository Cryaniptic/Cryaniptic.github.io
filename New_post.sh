#!/bin/bash

# Check if title is provided
if [ -z "$1" ]; then
    echo "Error: No title provided"
    echo "Usage: $0 \"Post Title\" [category]"
    exit 1
fi

# Get the title and convert to lowercase with hyphens for filename
TITLE="$1"
FILENAME_TITLE=$(echo "$TITLE" | tr '[:upper:]' '[:lower:]' | sed -E 's/[^a-z0-9]+/-/g' | sed -E 's/^-|-$//g')

# Get the category or default to "uncategorised"
CATEGORY=${2:-uncategorised}

# Create the directory if it doesn't exist
POSTS_DIR="Projects/$CATEGORY/_posts"
mkdir -p "$POSTS_DIR"

# Get current date in YYYY-MM-DD format
DATE=$(date +"%Y-%m-%d")

# Create the filename
FILENAME="$POSTS_DIR/$DATE-$FILENAME_TITLE.md"

# Check if file already exists
if [ -f "$FILENAME" ]; then
    echo "Error: File already exists: $FILENAME"
    exit 1
fi

# Create the file with front matter
cat > "$FILENAME" <<EOF
---
layout: post
title: "$TITLE"
date: $(date +"%Y-%m-%d %H:%M:%S %z")
categories: $CATEGORY
---

Your content goes here...
EOF

echo "Created new Jekyll post: $FILENAME"

# open file with nano
nano $FILENAME

