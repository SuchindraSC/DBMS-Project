USE [DatabaseProgramming1]
GO
-- ================================================
-- Template generated from Template Explorer using:
-- Create Procedure (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the procedure.
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
CREATE PROCEDURE [sp_deleteStoredProcedure]
	@id int
	
AS
BEGIN
	DELETE FROM [dbo].[lab] Where id = @id
END
GO

Execute [sp_deleteStoredProcedure] 1

select * from [dbo].[lab]