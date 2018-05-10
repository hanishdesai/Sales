use master
----create DataBase
---- 1) Check for the Database Exists .If the database is exist then drop and create new DB
--IF EXISTS (SELECT [name] FROM sys.databases WHERE [name] = 'Sales' )
--DROP DATABASE Sales
--GO

CREATE DATABASE Sales
GO

USE Sales
GO

CREATE TABLE [dbo].[User](
	[Id] [nvarchar](128) NOT NULL,
	[Email] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEndDateUtc] [datetime] NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[UserName] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.User] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]


CREATE TABLE [dbo].[ORDERS]
(   
[ORDER_NO] INT IDENTITY PRIMARY KEY,   
[CUSTOMER_ID] [VARCHAR](50) NOT NULL,   
[ORDER_DATE] DATETIME NOT NULL default CURRENT_TIMESTAMP,
[LOCATION_NAME] [VARCHAR](50) NOT NULL,   
[OPENING_DEBT] DECIMAL(18,3) NOT NULL,   
[CURRENCY] [VARCHAR](5) NOT NULL,   
[SALES_INVOICE_NO][VARCHAR](50) NOT NULL
)
  
CREATE TABLE [dbo].[PAYMENTS]
(   
	[PAYMENT_NO] INT IDENTITY PRIMARY KEY,  
	[ORDER_NO] INT NOT NULL FOREIGN KEY REFERENCES dbo.[ORDERS](ORDER_NO),
	[PAYMENT_DATE] DATETIME NOT NULL default CURRENT_TIMESTAMP,
	[PAYMENT_DESCRIPTION] [VARCHAR](50) NOT NULL,   
	[PAYMENT_AMOUNT] DECIMAL(18,3) NOT NULL
)  
