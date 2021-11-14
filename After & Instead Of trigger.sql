--AFTER TRIGGER
create table emp (id int Primary Key, name varchar(50))
create table empstatus(status varchar(50))

select * from emp
select * from empstatus

create trigger insertt
on emp
after insert
as
begin
insert into empstatus values('active')
end

insert into emp  values (1, 'Suchindra')

DISABLE TRIGGER insertt on emp


--INSTEAD OF TRIGGER
create table example (id int primary key, names varchar(50), name1 varchar(50))
alter table example add id1 int 
create table emp1values (id1 int primary key, name1 varchar(50))
CREATE TRIGGER instoftr
ON example
INSTEAD OF INSERT
AS
BEGIN
INSERT INTO emp
SELECT I.id, I.names
FROM INSERTED I

INSERT INTO emp1values
SELECT I.id1, I.name1
FROM INSERTED I
END

insert into example values(2, 'd','dd', 1)

select * from emp
select * from emp1values