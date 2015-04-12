#!/bin/bash

for f in $(find . -type f -name '*.groovy'); do
  mv $f $f.tmp
  sed 's/catch(Exception e)/catch (Exception e)/g' $f.tmp > $f
  rm -f $f.tmp
done

for f in $(find . -type f -name '*.groovy'); do
  mv $f $f.tmp
  sed 's/catch (Exception e)/catch (e)/g' $f.tmp > $f
  rm -f $f.tmp
done

for f in $(find . -type f -name '*.groovy'); do
  mv $f $f.tmp
  sed 's/catch(/catch (/g' $f.tmp > $f
  rm -f $f.tmp
done
