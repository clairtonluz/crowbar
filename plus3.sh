#!/bin/bash

# remove blank space for situations like String a += 'foo'

for f in $(find . -type f -name '*.groovy'); do
  mv $f $f.tmp
  sed -r 's/ \+ \=/\+\=/g' $f.tmp > $f
  rm -f $f.tmp
done
