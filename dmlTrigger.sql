create trigger dml
on [dbo].[lab]
for
insert,update,delete
as
print'you can not insert,update and delete this table i'
rollback;

insert into [dbo].[lab] values ('Vinod', 'Bangalore', 'Karnataka', 1, null, null)


DISABLE TRIGGER dml on [dbo].[lab]

select * from [dbo].[lab]