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
  printf "%s\n" "(for instance: /home/user/your_project/src/main/java/)"
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

crowbar_answer()
{
  read a
  if [ "$a" == 'NO' ] || [ "$a" == 'no' ] || [ "$a" == 'No' ] || [ "$a" == 'N' ] || [ "$a" == 'n' ]
  then
    return 1
  elif [ "$a" == 'YES' ] || [ "$a" == 'yes' ] || [ "$a" == 'Yes' ] || [ "$a" == 'Y' ] || [ "$a" == 'y' ]
  then
    return 0
  fi
}

crowbar_rename_source_directory()
{
  gpath="${jpath//java/groovy}"
  mv ${jpath} ${gpath}
}

crowbar_change_file_extension()
{
  for f in $(find $gpath -type f -name '*.java'); do
    mv $f $(echo "$f" | sed 's/java$/groovy/')
  done
}

crowbar_remove_public_keyword()
{
  printf "%s\n" "Remove public keyword ? (y/n)"
  crowbar_answer
  answer=$?
  if [ $answer == 0 ]
  then
    for f in $(find $gpath -type f -name '*.groovy'); do
      mv $f $f.tmp
      sed 's/public//g' $f.tmp > $f
      rm -f $f.tmp
    done
  fi
}

trap ctrl_c INT

ctrl_c() {
  crowbar_ui_end
}

crowbar_ui_start
crowbar_info
crowbar_path_validation
crowbar_rename_source_directory
crowbar_change_file_extension
crowbar_remove_public_keyword
crowbar_ui_end

