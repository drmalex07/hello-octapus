CREATE SEQUENCE baz_seq;

CREATE TABLE eosc.baz (
    id integer primary key default nextval('baz_seq'),
    num float
);
