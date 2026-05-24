#!/bin/bash

cd ~/Documents/obsidian-site || exit

echo "Syncing from Obsidian Public folder..."
rm -rf content/*
rsync -av --delete "/home/pai/Documents/2pai/Public/" ./content/

echo "Building Quartz..."
npx quartz build

echo "Committing changes..."
git add .

if git diff --cached --quiet; then
  echo "No changes to publish."
else
  git commit -m "Update public notes"
  git push
  echo "Published to https://2pai.pages.dev/"
fi