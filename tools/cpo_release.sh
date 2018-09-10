#!/usr/bin/env bash

# Requires xmllint to be installed
command -v robot 1> /dev/null 2>&1 || \
  { echo >&2 "robot required but it's not installed.  Aborting."; exit 1; }

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

# add date to IRI version
robot annotate \
  --input ${CPO} \
  --ontology-iri "http://purl.obolibrary.org/obo/cpo.owl" \
  --version-iri "http://purl.obolibrary.org/obo/`date '+%Y-%m-%d'`/cpo.owl" \
  --output cpo-updated.owl

RELEASE_LOG=${SCRIPT_DIR}/cpo_release_log.txt

# format release log
echo "#########################" >> ${RELEASE_LOG}
echo "RELEASE DATE '+%Y-%m-%d'" >> ${RELEASE_LOG}

# run robot report
robot report --input ${CPO} | tee -a ${RELEASE_LOG}
echo "" >> ${RELEASE_LOG}

# print success back to CLI
echo "New Release Created. Check cpo_release_log.txt for logging and report."

# update dictionary as part of release process
${SCRIPT_DIR}/make-dict.sh

# clean up
rm cpo.owl
mv cpo-updated.owl cpo.owl
