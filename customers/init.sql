drop view if exists jcustomer;
drop table if exists customer;
drop table if exists nation;

create table nation (
    key serial primary key,
    name character varying(100),
    description text
);

create table customer (
    key serial primary key,
    name character varying(50),
    address character varying(50),
    phone integer,
    nationkey integer,
    foreign key(nationkey) references nation(key)
);
