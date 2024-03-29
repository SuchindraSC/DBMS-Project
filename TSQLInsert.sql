USE [DatabaseProgramming1]
GO
/****** Object:  StoredProcedure [dbo].[sp_transactSQL]    Script Date: 11-11-2021 22:44:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[sp_transactSQL] 
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
			INSERT INTO [dbo].[lab](id, name, location, address, status, creator_stamp, creator_user) values (@id, @name, @location, @address,@status,@creator_stamp,@creator_user)
			COMMIT TRANSACTION
		END TRY
		BEGIN CATCH
			IF(@@ERROR > 0)
			BEGIN 
				PRINT 'ROLLBACK is working'
				ROLLBACK TRANSACTION
			END
		END CATCH
END

EXECUTE [dbo].[sp_transactSQL] 9,Suchindra, Mumbai, Maharashtra, 1, NULL, NULL
EXECUTE [dbo].[sp_transactSQL] 9,Suchindra, Mumbai, Maharashtra, 1, NULL, NULL
