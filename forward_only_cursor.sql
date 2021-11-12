declare forward_only_cursor cursor
for
select * from [dbo].[lab]

open forward_only_cursor

fetch next from forward_only_cursor

close forward_only_cursor

--for deleting the cursor
deallocate forward_only_cursor
