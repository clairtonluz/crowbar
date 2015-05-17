#!/bin/bash
#: Title       : crowbar
#: Date        : 2015-04-09
#: Author      : "Helio Frota" <00hf11 at gmail dot com>
#: Version     : 0.1.0
#: Description : A bash shell script to help java --> groovy migration
#: Options     : None

# functions

JPATH

crowbar_info()
{
  printf "%s\n" "crowbar"
  printf "%s\n" "======="
  printf "%s\n" "where java source code is located ?"
  printf "%s\n" "please inform the full path."
  printf "%s\n" "(for instance: /home/user/your_project/src/main/java)"
}

crowbar_path_validation()
{
read JPATH
if [ -z $JPATH ]
then
  echo "no path entered." >&2
  exit 1
fi
}

crowbar_setup()
{
  mkdir $JPATH #change java to groovy here.
  # move all .java files to the new directory.
  # change the file extension.
}


crowbar_info
crowbar_path_validation
crowbar_setup

