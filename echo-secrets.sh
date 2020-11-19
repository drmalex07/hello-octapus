#!/bin/sh
echo DB_USER=${DB_USER}

echo DB_PASS=${DB_PASS}
echo DB_PASS=$(echo ${DB_PASS} | tr '[[:lower:]]' '[[:upper:]]')

echo REGISTRY_PASSWORD=$(echo -n "<<${REGISTRY_PASSWORD}>>" | tr '[[:lower:]]' '[[:upper:]]')
