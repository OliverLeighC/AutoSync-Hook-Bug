#!/usr/bin/env bash

Version="V`date +"%y%m%d.%H%M%S"`__"
printf $Version | pbcopy
echo "$Version copied to clipboard."