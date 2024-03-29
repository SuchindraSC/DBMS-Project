USE [DatabaseProgramming1]
GO
/****** Object:  StoredProcedure [dbo].[sp_updateTSQL]    Script Date: 11-11-2021 23:41:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[sp_updateTSQL] 
	@id int,
	@name varchar(50),
    @location nvarchar(50),
    @address  nvarchar(255),
    @status int,
    @creator_stamp datetime,
    @creator_user int
AS
BEGIN
	BEGIN TRANSACTION
		BEGIN TRY 
			UPDATE [dbo].[lab] SET name = @name, location = @location, address = @address, status = @status, creator_stamp = @creator_stamp,
			creator_user = @creator_user WHERE id = @id
		END TRY
		BEGIN CATCH
			IF(@@ERROR > 0)
			BEGIN 
				PRINT 'ROLLBACK is working'
				ROLLBACK TRANSACTION
			END
		END CATCH
END
