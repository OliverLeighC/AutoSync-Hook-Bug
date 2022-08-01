#!/usr/bin/env bash

set -e

Filepath=$(cd `dirname "${BASH_SOURCE[0]}"` && pwd -P)

DbHost=$1
DbPort=$2
DbUsername=$3
DbPassword=$4

DbName=${5-"ExampleDb"}

FlywayEnvironment=${6-"local_dev"}

Url="jdbc:postgresql://$DbHost:$DbPort/$DbName" 
Location="filesystem:/scripting/migrations/ExampleDb"

echo "*** Applying migrations to $Url"


flyway \
  -baselineOnMigrate="true" \
  -locations="$Location" \
  -url="$Url" \
  -user="$DbUsername" \
  -password="$DbPassword" \
  -table="flyway_schema_history" \
  -schemas="public" \
  -placeholders.__FlywayEnvironment__="$FlywayEnvironment" \
  -mixed="true" \
  -ignoreMissingMigrations="true" \
  migrate

