#! /bin/bash

find ./public_html -type f | while read file; do
  key="${file#./public_html}"  # strips leading ./
  echo $key
  echo 'wrangler r2 object put --remote "files-1kfa-com/$key" --file="$file"'
  #wrangler r2 object put --remote "files-1kfa-com/$key" --file="$file"
done
