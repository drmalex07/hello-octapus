#!bin/bash
set -e -u -o pipefail

quote='$q$'
pass=$(cat /secrets/tester1-password)

psql -v ON_ERROR_STOP=1 -U "${POSTGRES_USER}" -d "${POSTGRES_DB}" <<-EOD
CREATE USER tester1 WITH PASSWORD ${quote}${pass}${quote} LOGIN;
CREATE DATABASE test1 OWNER tester1;
EOD
