#!/usr/bin/env bash

# Requires robot to be installed
command -v robot 1> /dev/null 2>&1 || \
  { echo >&2 "robot required but it's not installed.  Aborting."; exit 1; }

# Requires robot to be installed
command -v aspell 1> /dev/null 2>&1 || \
  { echo >&2 "aspell required but it's not installed.  Aborting."; exit 1; }

# Start by assuming it was the path invoked.
THIS_SCRIPT="$0"

# Handle resolving symlinks to this script.
# Using ls instead of readlink, because bsd and gnu flavors
# have different behavior.
while [ -h "$THIS_SCRIPT" ] ; do
  ls=`ls -ld "$THIS_SCRIPT"`
  # Drop everything prior to ->
  link=`expr "$ls" : '.*-> \(.*\)$'`
  if expr "$link" : '/.*' > /dev/null; then
    THIS_SCRIPT="$link"
  else
    THIS_SCRIPT=`dirname "$THIS_SCRIPT"`/"$link"
  fi
done

# Get path to the scripts directory.
SCRIPT_DIR=$(dirname "${THIS_SCRIPT}")

CPO="${SCRIPT_DIR}/../cpo.owl"
LOG="${SCRIPT_DIR}/cpo_log.txt"

# add date to IRI version
robot annotate \
  --input ${CPO} \
  --ontology-iri "http://purl.obolibrary.org/obo/cpo.owl" \
  --version-iri "http://purl.obolibrary.org/obo/`date '+%Y-%m-%d'`/cpo.owl" \
  --output cpo-updated.owl

# run robot report, results to stdout and some to file
robot report --input ${CPO} --output ${LOG} | head -n 5

echo "Robot results can be seen here: ${LOG}"

# update dictionary as part of release process
${SCRIPT_DIR}/make-dict.sh

echo ""
echo "The following lines contain misspelled words in the ontology, please fix them in ${CPO}:"
echo ""

# spell checker
< ${SCRIPT_DIR}/../DICTIONARY.md aspell list | grep -f /dev/stdin -C 1 ${SCRIPT_DIR}/../DICTIONARY.md

echo ""

# clean up
while true; do
    read -p "Are you ready to release this version?" yn
    case $yn in
        [Yy]* ) rm cpo.owl; mv cpo-updated.owl cpo.owl; rm catalog-v001.xml; echo 'RELEASE COMPLETE.'; break;;
        [Nn]* ) rm cpo-updated.owl; exit;;
        * ) echo "Please answer yes or no.";;
    esac
done
