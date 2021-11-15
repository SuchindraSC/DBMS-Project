use [DatabaseProgramming1]
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
ALTER PROCEDURE [sp_getdatastoredprocedure] 
	@id int
	
AS
BEGIN
	BEGIN TRY
		select * from [dbo].[lab]
	END TRY
	BEGIN CATCH
		IF (@@ERROR > 0)
		 PRINT 'Get Data From Table Failed';
	END CATCH
END
GO

execute [sp_getdatastoredprocedure] 1

