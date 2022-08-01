#!/usr/bin/env bash
FILEPATH=$(cd `dirname "${BASH_SOURCE[0]}"` && pwd -P)

DbHost=$1
DbPort=$2
DbUsername=$3
DbPassword=$4

echo "*** Baselining ..."

node $FILEPATH/schema-baselining/index.js $DbHost $DbPort $DbUsername $DbPassword

echo "*** Done"