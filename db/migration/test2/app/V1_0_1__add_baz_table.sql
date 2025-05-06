CREATE SEQUENCE app.baz_seq;

CREATE TABLE app.baz (
    id integer primary key default nextval('app.baz_seq'),
    num float
);
