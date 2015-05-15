#!/bin/bash

# add @CompileStatic annotation to tall classes
# this maybe will crash things

for f in $(find . -type f -name '*.groovy'); do
  mv $f $f.tmp
  sed 's/\<class\>/\@groovy\.transform\.CompileStatic class/g' $f.tmp > $f
  rm -f $f.tmp
done
