drop table if exists tg;
drop table if exists g;

create table g(
    i integer primary key,
    c integer,
    n integer
);

insert into g values
(1, 4, 5),
(3, 5, 2);

create table tg(
    i integer,
    tid varchar(255) primary key,
    org varchar(255)
);

insert into tg (select i, format('g.%s', i), format('g.%s', i) from g);
