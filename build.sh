#!/usr/bin/env bash
clear

echo Genrating blog List
echo "---
title: Blogs | Harshith reddy - nothr
---

# List of Blogs" > blogs.md

for f in "./blogs"/*.md; do
    title=$(cat $f | grep -Po '(").*' | sed 's/"//g' | head -n 1)
    date=$(cat $f | grep -Po '(").*' | sed 's/"//g' | head -n 2 | tail -n 1)    
    link="${f%.md}.html"
    echo "- \`$date\` - [$title](/$link)" >> blogs.md
done

echo Building Index

for f in "./"/*.md; do
    pandoc -s \
    --template template.html \
    -f markdown \
    -t html \
    $f > "${f%.md}.html"
done



echo Building blogs

for f in "./blogs"/*.md; do
    pandoc -s \
    --template template.html \
    -f markdown \
    -t html \
    $f > "${f%.md}.html"
done

echo Moving to site 

find . -maxdepth 1 -type f ! -name 'template.html' -name '*.html' -exec mv {} site/ \;
mv blogs/*.html site/blogs/
