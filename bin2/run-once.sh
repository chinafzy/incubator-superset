#!/bin/bash

function run_once(){
  [[ -z $1 ]] && \
    echo "Usage: $FUNCNAME <shell_file>" && \
    return 111

  local log1="/tmp/run-once/$1.run1.log"

  [[ -f "$log1" ]] && \
    echo "Has run before: $log1" && \
    return 0

  mkdir -p "$(dirname $log1)"
  echo "log file can be found here: $(dirname $log1)"

  local log2="/tmp/run-once/$1.run2.log"

  2>"$log2" bash "$1" | tee "$log1"

  local ret=$?

  cat "$log2" >&2

  return $ret
}

run_once $1
