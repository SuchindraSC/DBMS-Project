CREATE VIEW DetailsView AS
SELECT name, address
FROM [dbo].[lab]
WHERE id < 5;

select * from DetailsView

select * from [dbo].[lab];