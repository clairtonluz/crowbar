#!/bin/bash

for f in $(find . -type f -name '*.groovy'); do
  tmp=${f#'./'}
  tmp=${tmp%'.groovy'}
  tmp=${tmp##*/}
  if [[ $(grep -InH $tmp -R * | wc -l) == 0 ]]; then
    echo ${tmp}
  fi
done

