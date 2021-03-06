USE [Proje]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 9/20/2021 10:15:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProductID] [int] IDENTITY(1,2000) NOT NULL,
	[ProductName] [varchar](50) NOT NULL,
	[ProductPrice] [float] NOT NULL,
	[ProductStock] [int] NOT NULL,
	[ProductDetails] [varchar](max) NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user_table]    Script Date: 9/20/2021 10:16:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user_table](
	[UserID] [int] IDENTITY(1,1000) NOT NULL,
	[UserName] [varchar](50) NOT NULL,
	[UserPassword] [varchar](50) NOT NULL,
	[UserMail] [varchar](50) NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[Add_Product]    Script Date: 9/20/2021 10:16:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Add_Product]
@ProductName varchar(50),
@ProductPrice float,
@ProductStock int,
@ProductDetails varchar(max)

AS
BEGIN
	insert into Product values(@ProductName,@ProductPrice,@ProductStock,@ProductDetails)
END
GO
/****** Object:  StoredProcedure [dbo].[Delete_Product]    Script Date: 9/20/2021 10:16:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Delete_Product]
@ProductID int
AS
BEGIN
delete from Product where ProductID=@ProductID
END

GO
/****** Object:  StoredProcedure [dbo].[Get_Product]    Script Date: 9/20/2021 10:16:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Get_Product]
	
AS
BEGIN
	select * from  Product
END
GO
/****** Object:  StoredProcedure [dbo].[Get_Product_byID]    Script Date: 9/20/2021 10:16:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Get_Product_byID]
@ProductID int
AS
BEGIN
	
	SELECT * FROM Product where ProductID=@ProductID
END
GO
/****** Object:  StoredProcedure [dbo].[Update_Product]    Script Date: 9/20/2021 10:16:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Update_Product]
@ProductID int,
@ProductName nvarchar(200),
@ProductPrice float,
@ProductStock int,
@ProductDetails varchar(max)
AS
BEGIN
update Product set
ProductPrice=@ProductPrice,
ProductStock=@ProductStock,
ProductDetails=@ProductDetails,
ProductName =@ProductName where ProductID=@ProductID

END

GO
/****** Object:  StoredProcedure [dbo].[User_Login]    Script Date: 9/20/2021 10:16:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[User_Login]
@UserMail varchar(50),
@UserPassword varchar(50),
@Isvalid bit out
AS
BEGIN
Set @Isvalid=(select count(@UserMail) from user_table where UserMail=@UserMail and UserPassword= @UserPassword)
END

select * from user_table
GO
/****** Object:  StoredProcedure [dbo].[User_Register]    Script Date: 9/20/2021 10:16:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[User_Register]
@UserName varchar(50),
@UserPassword varchar(50),
@UserMail varchar(50)

AS
BEGIN
	
	insert into user_table values(@UserName,@UserPassword,@UserMail)
END
GO
