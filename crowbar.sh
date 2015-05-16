#!/bin/bash
#: Title       : crowbar
#: Date        : 2015-04-09
#: Author      : "Helio Frota" <00hf11 at gmail dot com>
#: Version     : 0.1.0
#: Description : A bash shell script to help java --> groovy migration
#: Options     : None

# functions

inputinfo() #@ USAGE: java source path
{
  printf "%s\n" "crowbar"
  printf "%s\n" "======="
  printf "%s\n" "where java source code is located ?"
  printf "%s\n" "please inform the full path."
  printf "%s\n" "(for instance: /home/user/your_project/src/main/java)"
}

# executing

inputinfo

# verify the input.
read jpath

if [ -z $jpath ]
then
  echo "no path entered." >&2
  exit 1
fi

# a) creates the directory src/main/groovy
# b) move all to src/main/groovy
# c) changes the file extension

find f in $jpath -type f -name "*.java" -print
