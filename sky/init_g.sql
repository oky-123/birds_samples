drop table if exists tid_g;
drop table if exists base_g;

/*
create table base_g(
    i integer primary key,
    c integer,
    n integer
);

insert into base_g values
(1, 4, 5),
(3, 5, 2);

create table tid_g(
    tid serial primary key,
    i integer,
    org varchar(255)
);
*/

-- insert into tid_g(i, org) (select i, 'g' as org from base_g);

create table base_g(
    i integer primary key
);

-- create table tid_g(
--     i integer,
--     org varchar(255)
-- );

insert into base_g values (1), (2);
-- insert into tid_g(i, org) (select i, 'g' from base_g);
