USE [DatabaseProgramming1]
GO
/****** Object:  StoredProcedure [dbo].[sp_insertvalues]    Script Date: 11-11-2021 20:05:50 ******/
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
	insert into [dbo].[lab] (name,location,address,status,creator_stamp,creator_user) 
	values (@name,@location,@address,@status,@creator_stamp,@creator_user)
END

select * from [dbo].[lab]

execute [dbo].[sp_insertvalues] 1,Suchindra,Dombivli,Thane,1,null,null

