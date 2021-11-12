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
ALTER PROCEDURE  [dbo].[sp_transactSaveSQL] 
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
			INSERT INTO [dbo].[lab](id, name, location, address, status, creator_stamp, creator_user) values (@id, @name, @location, @address, @status ,@creator_stamp, @creator_user)
			SAVE TRANSACTION FirstInsert
			INSERT INTO [dbo].[mentor](id, name, mentor_type, lab_id, status, creator_stamp, creator_user) values ( @id, @name, @mentor_type, @lab_id, @status, @creator_stamp, @creator_user)
			COMMIT TRANSACTION
		END TRY
		BEGIN CATCH
			IF(@@ERROR > 0)
			BEGIN 
				PRINT 'ROLLBACK is working'
				ROLLBACK TRANSACTION FIrstInsert
			END
		END CATCH
END


select * from [dbo].[lab]

EXECUTE [dbo].[sp_transactSaveSQL]  9, Rahul, Bangalore, Karnataka, 1, null, null
