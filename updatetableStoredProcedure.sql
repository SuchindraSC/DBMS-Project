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
ALTER PROCEDURE [updatetableStoredProcedure]
	@id int,
	@name varchar(50),
    @location nvarchar(50),
    @address  nvarchar(255),
    @status int,
    @creator_stamp datetime,
    @creator_user int
AS
BEGIN
	BEGIN TRY
		UPDATE [dbo].[lab] SET name = @name, location = @location, address = @address, status = @status, creator_stamp = @creator_stamp,
		creator_user = @creator_user WHERE id = @id
	END TRY
	BEGIN CATCH
		IF (@@ERROR > 0)
			PRINT 'Update Data In Table Failed';
	END CATCH
END
GO

SELECT * FROM [dbo].[lab]

EXECUTE [updatetableStoredProcedure] 1,Suchindra, Mumbai, Maharashtra, 1, NULL, NULL
