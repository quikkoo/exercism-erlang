#!/bin/sh

set -e

MODULES="      \
  anagram      \
  bob          \
  etl          \
  hello-world  \
  word-count   \
"

task_check() {
  rebar3 dialyzer
}

task_test() {
  task_check

  rebar3 eunit
  rebar3 cover
}

task_all() {
  task_test
}

task_clean() {
  rm -rf _build *.lock
}

if [ -z $1 ]
then
  TASK=all
else
  TASK=$1
fi

for MODULE in $MODULES
do
  cd $MODULE
  case $TASK in
    check)
      task_check
      ;;
    test)
      task_test
      ;;
    all)
      task_all
      ;;
    clean)
      task_clean
      ;;
  esac
  cd ../
done
