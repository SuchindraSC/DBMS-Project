USE [DatabaseProgramming1]
GO
-- ================================================
-- Template generated from Template Explorer using:
-- Create Multi-Statement Function (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the function.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE FUNCTION  fnGetMulCandidate()
RETURNS @candidate TABLE 
(
	id int,
	first_name nvarchar(50),
	email nvarchar(50),
	mobile_num bigint
)
AS
BEGIN
	insert into @candidate select e.id, e.first_name, e.email, e.mobile_num from [dbo].[fellowship_candidates] e;
	update @candidate Set mobile_num = 8985764123 where id = 4;
	RETURN 
END
GO

select * from fnGetMulCandidate()
select * from [dbo].[fellowship_candidates]