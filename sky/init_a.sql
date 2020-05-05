drop table if exists ag;
drop table if exists au;

create table ag(
    org varchar(20),
    acc varchar(20),
    primary key (org, acc)
);

create table au(
    org varchar(20),
    acc varchar(20),
    primary key (org, acc)
);

insert into ag values
('G', 'G'),
('G', 'U');

insert into au values
('U', 'U');
