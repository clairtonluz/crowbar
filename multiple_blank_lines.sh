#!/bin/bash

for f in $(find . -type f -name '*.groovy'); do
  FILE=$(cat -s "$f");
  echo "$FILE" > "$f";
done
