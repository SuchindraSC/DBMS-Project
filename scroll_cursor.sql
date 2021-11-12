declare scroll_cursor cursor
scroll for
select * from [dbo].[lab]

--Opening the Scroll Cursor
open scroll_cursor

--Fetching the first data
fetch first from scroll_cursor

--Fetching the next data
fetch last from scroll_cursor

--Fetching previous data
fetch prior from scroll_cursor

--Fetching absolute data
fetch absolute 4 from scroll_cursor

--Fetching relative data
fetch relative 2 from scroll_cursor

--Closing the Scroll Cursor
close scroll_cursor

--Deallocating the Scroll Cursor
deallocate scroll_cursor

