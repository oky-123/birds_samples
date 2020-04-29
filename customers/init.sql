create table if not exists nation (
    key integer primary key,
    name character varying(100),
    description text
);

create table if not exists customer (
    key integer primary key,
    name character varying(50),
    address character varying(50),
    phone integer,
    nationkey integer,
    foreign key(nationkey) references nation(key)
);
