#!/bin/bash

# removes all public keyword from groovy files

for f in $(find . -type f -name '*.groovy'); do
  mv $f $f.tmp
  sed 's/public//g' $f.tmp > $f
  rm -f $f.tmp
done
