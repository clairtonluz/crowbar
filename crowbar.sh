#!/bin/bash
#: Title       : crowbar
#: Date        : 2015-04-09
#: Author      : "Helio Frota" <00hf11 at gmail dot com>
#: Version     : 0.3.0
#: Description : A bash shell script to help java --> groovy migration
#: Options     : None

# functions

jpath=""
gpath=""

crowbar_info()
{
  printf "\e[33m"
  printf "%s\n" "crowbar"
  printf "%s\n" "======="
  printf "\n"
  printf "\e[31m"
  printf "%s\n" "=================================="
  printf "%s\n" "WARNING: this will break the code."
  printf "%s\n" "=================================="
  printf "\n"
  printf "\e[33m"
  printf "%s\n" "where java source code is located ?"
  printf "%s\n" "(for instance: /home/user/your_project/src/main/java/)"
}

crowbar_path_validation()
{
  read jpath
  if [ -z $jpath ]
  then
    printf "\e[0m"
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

crowbar_remove_default_imports()
{
  printf "%s\n" "Remove default imports ? (y/n)"
  crowbar_answer
  answer=$?
  if [ $answer == 0 ]
  then
    for f in $(find $gpath -type f -name '*.groovy'); do
      mv $f $f.tmp
      sed 's/import java.io.*//g' $f.tmp > $f
      rm -f $f.tmp

      mv $f $f.tmp
      sed 's/import java.util.*//g' $f.tmp > $f
      rm -f $f.tmp
    done
  fi
}

crowbar_remove_dot_class()
{
  printf "%s\n" "Remove .class ? (y/n)"
  crowbar_answer
  answer=$?
  if [ $answer == 0 ]
  then
    for f in $(find $gpath -type f -name '*.groovy'); do
      mv $f $f.tmp
      sed 's/\.class//g' $f.tmp > $f
      rm -f $f.tmp
    done
  fi
}

crowbar_all_single_quotes()
{
  printf "%s\n" "All single quotes ? (y/n)"
  crowbar_answer
  answer=$?
  if [ $answer == 0 ]
  then
    for f in $(find $gpath -type f -name '*.groovy'); do
      mv $f $f.tmp
      sed "s/\"/'/g" $f.tmp > $f
      rm -f $f.tmp
    done
  fi
}

crowbar_remove_all_semicolon()
{
  printf "%s\n" "Remove all semilocons ? (y/n)"
  crowbar_answer
  answer=$?
  if [ $answer == 0 ]
  then
    for f in $(find $gpath -type f -name '*.groovy'); do
      mv $f $f.tmp
      sed 's/;//g' $f.tmp > $f
      rm -f $f.tmp
    done
  fi
}

crowbar_compile_static()
{
  printf "%s\n" "Add @CompileStatic to all classes ? (y/n)"
  crowbar_answer
  answer=$?
  if [ $answer == 0 ]
  then
    for f in $(find $gpath -type f -name '*.groovy'); do
      mv $f $f.tmp
      sed 's/\<class\>/\@groovy\.transform\.CompileStatic class/g' $f.tmp > $f
      rm -f $f.tmp
    done
  fi
}

trap ctrl_c INT

ctrl_c() {
  printf "\e[0m"
}

crowbar_info
crowbar_path_validation
crowbar_rename_source_directory
crowbar_change_file_extension
crowbar_remove_public_keyword
crowbar_remove_default_imports
crowbar_remove_dot_class
crowbar_all_single_quotes
crowbar_remove_all_semicolon
crowbar_compile_static
printf "\e[0m"

