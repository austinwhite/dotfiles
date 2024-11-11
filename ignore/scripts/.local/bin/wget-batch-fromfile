#!/usr/bin/env bash

if [ -z "$1" ]; then
  echo "error: must pass in a URL file"
  exit 1
fi
if [ $1 -gt 1 ]; then
  echo "error: too many arguments."
  exit 1
fi

dirPath=~/Downloads/Download_`date "+%m%d%Y_%s"`
mkdir $dirPath

wget robots=off -P $dirPath -i $1 
