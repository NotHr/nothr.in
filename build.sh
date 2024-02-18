#!/usr/bin/env bash
clear

echo Genrating blog List
echo "---
title: Blogs | Harshith reddy - nothr
---

# List of Blogs" > blogs.md

for f in "./blogs"/*.md; do
    title=$(cat $f | grep -Po '(").*' | sed 's/"//g')
    link="${f%.md}.html"
    echo "- [$title](/$link)" >> blogs.md
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

