
--STATIC CURSOR
DECLARE static_cursor CURSOR
STATIC FOR 
SELECT * from [dbo].[lab]
OPEN static_cur
 fetch first from static_cursor
 fetch next from static_cursor 
 fetch last from static_cursor 
 fetch absolute 2 from static_cursor 
 fetch relative 2 from static_cursor
CLOSE static_cursor
DEALLOCATE static_cursor




--DYNAMIC CURSOR FOR
declare dynamic_cursor cursor  
dynamic for   
select * from lab
open dynamic_cursor 
fetch First from dynamic_cursor 
fetch next from dynamic_cursor
close dynamic_cursor 
deallocate dynamic_cursor


--KEYSET-DRIVEN CURSOR  
declare key_cursor cursor  
keyset for   
select * from lab
open key_cursor  
fetch First from key_cursor
fetch next from key_cursor
close key_cursor  
deallocate key_cursor