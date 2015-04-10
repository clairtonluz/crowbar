#!/bin/bash

# add blank space before and after all + chars ( groovy codenarc )

for f in $(find . -type f -name '*.groovy'); do
  mv $f $f.tmp
  sed -r 's/\+/ & /' $f.tmp > $f
  rm -f $f.tmp
done
