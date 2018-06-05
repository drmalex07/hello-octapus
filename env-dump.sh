#!/bin/bash

#
# Dump
#

echo " -- Env --"
env
echo " --"

#
# Use secret from environment to decode something
#

openssl enc -des-ecb -d -in 1.txt.enc -k ${SECRET_THING}
