USE [DatabaseProgramming1]
GO
/****** Object:  StoredProcedure [dbo].[sp_insertvalues]    Script Date: 12-11-2021 09:25:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[sp_insertvalues]
	-- Add the parameters for the stored procedure here
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
	insert into [dbo].[lab] (name,location,address,status,creator_stamp,creator_user) 
	values (@name,@location,@address,@status,@creator_stamp,@creator_user)
	END TRY 
	BEGIN CATCH
		IF (@@ERROR > 0)
		PRINT 'Insert Values In Table Failed';
	END CATCH
END

EXECUTE [dbo].[sp_insertvalues] 1,Rahul,Bangalore,Karnataka,1,null,null
