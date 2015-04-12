#!/bin/bash

# change the extension from .java to .groovy for all .java files

for f in $(find . -type f -name '*.java'); do
  mv $f $(echo "$f" | sed 's/java$/groovy/')
done
