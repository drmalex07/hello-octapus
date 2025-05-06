CREATE SCHEMA IF NOT EXISTS "app";

CREATE PUBLICATION app_pub 
   FOR TABLE app.foobar, app.baz
   --FOR TABLES IN SCHEMA "app" 
   WITH (publish = 'insert, update, delete, truncate');

