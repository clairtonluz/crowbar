#!/bin/bash

# removes from all groovy files the java.io.* import

for f in $(find . -type f -name '*.groovy'); do
  mv $f $f.tmp
  sed 's/import java.io.*//g' $f.tmp > $f
  rm -f $f.tmp
done
