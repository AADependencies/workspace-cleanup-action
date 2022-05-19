#!/bin/bash
function deleteMe() {
  DELETE_ME=$1
  ls -latr $DELETE_ME
  rm -rf $DELETE_ME
  ls -latr $DELETE_ME
  OUTPUT=$?
  if [[ "$?" -eq 0 ]]; then
    echo "Successfully cleared the workspace $DELETE_ME"
  else
    echo "Failed to clear the workspace $DELETE_ME"
  fi
}
set +e

WORKSPACE="/github/workspace"

if [[ $INPUT_DIRECTORY == "NONE" ]]; then
  deleteMe "$WORKSPACE/.*"
  deleteMe "$WORKSPACE/*"
  deleteMe "$RUNNER_TEMP/*"
  deleteMe "$RUNNER_TEMP/.*"
else
  if [[ -d ${WORKSPACE}/${INPUT_DIRECTORY} ]]; then
    deleteMe "${WORKSPACE}/${INPUT_DIRECTORY}"
  else
    echo "${INPUT_DIRECTORY} is not found inside the workspace hence deleting whole workspace"
    deleteMe "$WORKSPACE/.*"
    deleteMe "$WORKSPACE/*"
  fi
fi

set -e
