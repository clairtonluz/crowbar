#!/bin/bash

# removes all semicolon from groovy files
# this will break all for loops using ;

for f in $(find . -type f -name '*.groovy'); do
  mv $f $f.tmp
  sed 's/\.class//g' $f.tmp > $f
  rm -f $f.tmp
done
