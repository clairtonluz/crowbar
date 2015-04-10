#!/bin/bash

# removes all semicolon from groovy files

for f in $(find . -type f -name '*.groovy'); do
  mv $f $f.tmp
  sed 's/;//g' $f.tmp > $f
  rm -f $f.tmp
done
