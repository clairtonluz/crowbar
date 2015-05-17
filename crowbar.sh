#!/bin/bash
#: Title       : crowbar
#: Date        : 2015-04-09
#: Author      : "Helio Frota" <00hf11 at gmail dot com>
#: Version     : 0.1.0
#: Description : A bash shell script to help java --> groovy migration
#: Options     : None

# functions

jpath=""
gpath=""

crowbar_ui_start()
{
  printf "\e[33m"
}

crowbar_ui_end()
{
  printf "\e[0m"
}

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
  read jpath
  if [ -z $jpath ]
  then
    crowbar_ui_end
    exit 1
  fi
}

crowbar_setup()
{
  mkdir $gpath #change java to groovy here.
  # move all .java files to the new directory.
  # change the file extension.
}

trap ctrl_c INT

ctrl_c() {
  crowbar_ui_end
}

crowbar_ui_start
crowbar_info
crowbar_path_validation
crowbar_setup
crowbar_ui_end

