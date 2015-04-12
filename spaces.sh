#!/bin/bash

# fix spaces

for f in $(find . -type f -name '*.groovy'); do
  mv $f $f.tmp
  sed 's/catch(Exception e)/catch (Exception e)/g' $f.tmp > $f
  rm -f $f.tmp

  mv $f $f.tmp
  sed 's/catch(/catch (/g' $f.tmp > $f
  rm -f $f.tmp

  mv $f $f.tmp
  sed 's/for(/for (/g' $f.tmp > $f
  rm -f $f.tmp

  mv $f $f.tmp
  sed 's/if(/if (/g' $f.tmp > $f
  rm -f $f.tmp

  mv $f $f.tmp
  sed 's/else(/else (/g' $f.tmp > $f
  rm -f $f.tmp

  mv $f $f.tmp
  sed 's/while(/while (/g' $f.tmp > $f
  rm -f $f.tmp

  mv $f $f.tmp
  sed 's/;(/; (/g' $f.tmp > $f
  rm -f $f.tmp
done

