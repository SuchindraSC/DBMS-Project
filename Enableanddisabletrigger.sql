create trigger demotrigger
on database 
for
create_table,alter_table,drop_table
as
print'you can not create ,drop and alter table in this database'
rollback;


CREATE TABLE Employee(EmpId int, data nvarchar(50));

DISABLE TRIGGER demotrigger on database
GO