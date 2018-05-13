#!/bin/bash

do_pull=0
if [[ $# -ge 1 ]] ; then
    if [[ "$1" == "-p" || "$1" == "-pull" ]] ; then
    do_pull=1
    fi
fi

list=$(ls -d */)

while read -r item
do
  cd $item
  rc=$?
  if [[ $rc -eq 0 ]] ; then
    echo "... $item ..."
    git fetch upstream
    gitinfo
    if [[ $do_pull -eq 1 ]] ; then
      git pull
    fi
    cd ..
  fi
done <<< "$list"
