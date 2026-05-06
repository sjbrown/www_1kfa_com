#! /bin/bash

find ./public_html -type f | while read file; do
  key="${file#./public_html}"
  echo $key

  # set mime type based on extension
  case "$file" in
    *.svg)  mime="image/svg+xml" ;;
    *.html) mime="text/html" ;;
    *.css)  mime="text/css" ;;
    *.js)   mime="application/javascript" ;;
    *.png)  mime="image/png" ;;
    *.jpg|*.jpeg) mime="image/jpeg" ;;
    *.pdf)  mime="application/pdf" ;;
    *.gz|*.tgz)   mime="application/gzip" ;;
    *.json) mime="application/json" ;;
    *)      mime="application/octet-stream" ;;
  esac

  echo "wrangler r2 object put --remote 'www-1kfa-com/$key' --file='$file' --content-type='$mime'"
  wrangler r2 object put --remote "www-1kfa-com/latest/$key" --file="$file" --content-type="$mime"
done

