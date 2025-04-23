#!/bin/bash

# Usage of this script:
# find-and-replace-in-file.sh path/to/file regex

get_sed() {
  if [[ "$(uname)" == "Darwin" ]]; then
    echo "sed -E -i ''"  # BSD/macOS needs '' after -i
  else
    echo "sed -E -i"
  fi
}

file_sed_cmd=$(get_sed)

validate_regex_with_sed() {
  local r="$1"
  local sed_cmd="sed -E"

  # Use dummy input just to parse regex; discard output
  echo "___" | $sed_cmd "$r" >/dev/null 2>&1
  return $?  # Return the exit code of sed
}

filepath=$(eval echo "$1")
regex="$2"

if [[ $# != 2 ]]; then
  echo "invalid number of arguments passed. exiting"
  exit 1
fi

if [[ ! -f "$(realpath "$filepath")" ]]; then
  echo "invalid filepath passed. exiting"
  exit 1
fi

if ! validate_regex_with_sed "$regex"; then
  echo "invalid regex passed. exiting"
  exit 1
fi

$file_sed_cmd "$regex" "$filepath" 
