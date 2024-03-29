USE [DatabaseProgramming1]
GO
/****** Object:  StoredProcedure [dbo].[sp_transactSQL]    Script Date: 12-11-2021 09:14:47 ******/
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
			INSERT INTO [dbo].[lab] values (@name, @location, @address,@status,@creator_stamp,@creator_user)
			COMMIT TRANSACTION
		END TRY
		BEGIN CATCH
			IF(@@ERROR > 0)
			BEGIN 
				PRINT 'Roll Back is working'
				ROLLBACK TRANSACTION
			END
		END CATCH
END

select * from [dbo].[lab]
EXECUTE [dbo].[sp_transactSQL] 10,Rahul,Bangalore,Karnataka,1,null,null
EXECUTE [dbo].[sp_transactSQL] 10,Suchindra,Mumbai,Maharashtra,1,null,null