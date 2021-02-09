#!/bin/bash

file=The-Pragmatic-Programmer/readme.md

read () {
  less $file
}

toc () {
  sed -n '/# Table of Contents/,/\[Quick Reference\]/p' ${file} |
  remove "\[Table of Contents\]" |
  remove "\[Quick Reference\]" |
  grep -E -w "\t|-\s\[.*\]" |
  cut -d'(' -f1 |
  sed -e 's/\[//g' -e 's/\]//g' -e 's/-\s//g'
}

tips () {
  sed -n '/## Tips/,/## CheckList/p' ${file} |
  sed -e 's/**//g' |
  remove "## CheckList"
}

checklist () {
  sed -n '/## CheckList/,/Content from The Pragmatic Programmer/p' ${file}
}

print_usage () {
  echo 'Usage:'
  echo -e '\thelp \tHelp'
  echo -e "\tread \tRead $file"
  echo -e '\ttoc \tPrint the table of contents, used to find chapters and sections.'
  echo -e "\tx \tPrint a chapter. E.g. chapter 1 'A Pragmatic Philosophy'; 1"
  echo -e "\tx.y \tPrint a section of a chapter. E.g. chapter 1, section 2 'Software Entropy'; 1.2"
  echo -e '\ttips \tPrint tips'
  echo -e '\tls \tPrint checklist'
}

get_chapter () {
  sed -n "/# Chapter $1./,/# Chapter $2./p" ${file} | remove "# Chapter $2."
}

get_section () {
  sed -n "/## $1./,/## $2./p" | remove "## $2."
}

remove () {
  sed "/$1/d"
}

remove_hashes () {
  sed -E 's/#+\s//g'
}

if [[ $# == 0 ]] || [[ $@ =~ 'help' ]]; then
  print_usage
  exit 0
fi

if [[ $@ =~ 'read' ]]; then
  read
  exit 0
fi

if [[ $@ =~ 'toc' ]]; then
  toc
  exit 0
fi

if [[ $@ =~ 'tips' ]]; then
  tips
  exit 0
fi

if [[ $@ =~ 'ls' ]]; then
  checklist
  exit 0
fi

# parse arguments in form of Chapter.Section e.g. 1.2
arg=$1
IFS='.' read -ra args <<< "$arg"

tips=$2

if [ ${#args[@]} == 1 ]; then
  # print chapter, e.g. 1 for 'A Pragmatic Philosophy'
  chapter=${args[0]}
  next_chapter=$((chapter+1))

  get_chapter $chapter $next_chapter
elif [ ${#args[@]} == 2 ]; then
  # print section from a chapter, e.g. 1.2 for 'Software Entropy'
	chapter=${args[0]}
	section=${args[1]}
  next_chapter=$((chapter+1))
  next_section=$((section+1))

  get_chapter $chapter $next_chapter |
  get_section $section $next_section
else
  echo 'Invalid arguments.'
  print_usage
	exit 1
fi

exit 0
