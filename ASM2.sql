USE [master]
GO
/****** Object:  Database [FStoreManagementDB]    Script Date: 7/2/2022 8:36:21 PM ******/
CREATE DATABASE [FStoreManagementDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'FStoreManagementDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.TTQA\MSSQL\DATA\FStoreManagementDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'FStoreManagementDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.TTQA\MSSQL\DATA\FStoreManagementDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [FStoreManagementDB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [FStoreManagementDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [FStoreManagementDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [FStoreManagementDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [FStoreManagementDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [FStoreManagementDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [FStoreManagementDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [FStoreManagementDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [FStoreManagementDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [FStoreManagementDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [FStoreManagementDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [FStoreManagementDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [FStoreManagementDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [FStoreManagementDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [FStoreManagementDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [FStoreManagementDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [FStoreManagementDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [FStoreManagementDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [FStoreManagementDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [FStoreManagementDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [FStoreManagementDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [FStoreManagementDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [FStoreManagementDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [FStoreManagementDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [FStoreManagementDB] SET RECOVERY FULL 
GO
ALTER DATABASE [FStoreManagementDB] SET  MULTI_USER 
GO
ALTER DATABASE [FStoreManagementDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [FStoreManagementDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [FStoreManagementDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [FStoreManagementDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [FStoreManagementDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [FStoreManagementDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'FStoreManagementDB', N'ON'
GO
ALTER DATABASE [FStoreManagementDB] SET QUERY_STORE = OFF
GO
USE [FStoreManagementDB]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 7/2/2022 8:36:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[CategoryId] [int] NOT NULL,
	[CategoryName] [varchar](40) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Member]    Script Date: 7/2/2022 8:36:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Member](
	[MemberId] [int] NOT NULL,
	[Email] [varchar](100) NOT NULL,
	[CompanyName] [varchar](40) NOT NULL,
	[City] [varchar](15) NOT NULL,
	[Country] [varchar](15) NOT NULL,
	[Password] [varchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MemberId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 7/2/2022 8:36:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[OrderId] [int] NOT NULL,
	[MemberId] [int] NULL,
	[OrderDate] [datetime] NOT NULL,
	[RequiredDate] [datetime] NULL,
	[ShippedDate] [datetime] NULL,
	[Freight] [money] NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 7/2/2022 8:36:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[OrderId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[UnitPrice] [money] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Discount] [float] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC,
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 7/2/2022 8:36:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProductId] [int] NOT NULL,
	[CategoryId] [int] NULL,
	[ProductName] [varchar](40) NOT NULL,
	[Weight] [varchar](20) NOT NULL,
	[UnitPrice] [money] NOT NULL,
	[UnitsInStock] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Category] ([CategoryId], [CategoryName]) VALUES (1, N'Food')
INSERT [dbo].[Category] ([CategoryId], [CategoryName]) VALUES (2, N'Drink')
GO
INSERT [dbo].[Member] ([MemberId], [Email], [CompanyName], [City], [Country], [Password]) VALUES (1, N'member1@fstore.com', N'KMS', N'HCM', N'Viet nam', N'1')
INSERT [dbo].[Member] ([MemberId], [Email], [CompanyName], [City], [Country], [Password]) VALUES (2, N'member2@fstore.com', N'CyberSoft', N'HCM', N'Viet nam', N'1')
INSERT [dbo].[Member] ([MemberId], [Email], [CompanyName], [City], [Country], [Password]) VALUES (31, N'abc', N'fptSoft', N'hn', N'vn', N'123')
INSERT [dbo].[Member] ([MemberId], [Email], [CompanyName], [City], [Country], [Password]) VALUES (41, N'congnt@fstore.com', N'CyberSoft', N'HCM', N'Thai Lan', N'333')
INSERT [dbo].[Member] ([MemberId], [Email], [CompanyName], [City], [Country], [Password]) VALUES (45, N'phunt@fstore.com', N'Momo', N'Nha Trang', N'Singapore', N'111')
INSERT [dbo].[Member] ([MemberId], [Email], [CompanyName], [City], [Country], [Password]) VALUES (48, N'toanntb@fstore.com', N'TGDD', N'DN', N'Campodia', N'123')
INSERT [dbo].[Member] ([MemberId], [Email], [CompanyName], [City], [Country], [Password]) VALUES (58, N'anhttq@fstore.com', N'VNG', N'Tan An', N'Viet Nam', N'0508')
GO
INSERT [dbo].[Order] ([OrderId], [MemberId], [OrderDate], [RequiredDate], [ShippedDate], [Freight]) VALUES (12, 2, CAST(N'2022-10-11T00:00:00.000' AS DateTime), CAST(N'2022-10-19T00:00:00.000' AS DateTime), CAST(N'2022-10-16T00:00:00.000' AS DateTime), 11111.0000)
INSERT [dbo].[Order] ([OrderId], [MemberId], [OrderDate], [RequiredDate], [ShippedDate], [Freight]) VALUES (13, 1, CAST(N'2022-06-27T00:00:00.000' AS DateTime), CAST(N'2022-06-29T00:00:00.000' AS DateTime), CAST(N'2022-06-28T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Order] ([OrderId], [MemberId], [OrderDate], [RequiredDate], [ShippedDate], [Freight]) VALUES (15, 58, CAST(N'2015-08-04T00:00:00.000' AS DateTime), CAST(N'2018-08-05T00:00:00.000' AS DateTime), CAST(N'2022-06-15T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Order] ([OrderId], [MemberId], [OrderDate], [RequiredDate], [ShippedDate], [Freight]) VALUES (123, 2, CAST(N'2022-01-12T00:00:00.000' AS DateTime), CAST(N'2022-01-12T00:00:00.000' AS DateTime), CAST(N'2022-01-12T00:00:00.000' AS DateTime), 22222.0000)
INSERT [dbo].[Order] ([OrderId], [MemberId], [OrderDate], [RequiredDate], [ShippedDate], [Freight]) VALUES (4665, 1, CAST(N'2021-11-05T12:05:07.677' AS DateTime), CAST(N'2021-11-04T00:00:00.000' AS DateTime), CAST(N'2021-11-05T00:00:00.000' AS DateTime), 10000.0000)
INSERT [dbo].[Order] ([OrderId], [MemberId], [OrderDate], [RequiredDate], [ShippedDate], [Freight]) VALUES (6113, 2, CAST(N'2021-11-05T14:04:07.950' AS DateTime), CAST(N'2021-11-04T00:00:00.000' AS DateTime), CAST(N'2021-11-05T00:00:00.000' AS DateTime), 20000.0000)
INSERT [dbo].[Order] ([OrderId], [MemberId], [OrderDate], [RequiredDate], [ShippedDate], [Freight]) VALUES (6259, 1, CAST(N'2021-11-05T14:02:50.557' AS DateTime), CAST(N'2021-11-06T00:00:00.000' AS DateTime), CAST(N'2021-11-07T00:00:00.000' AS DateTime), 15000.0000)
GO
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (12, 4, 999.0000, 2, 5)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (13, 5, 1221.0000, 5, 9)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (123, 3, 333333.0000, 4, 11)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (4665, 1, 20000.0000, 1, 5)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (6113, 4, 10000.0000, 3, 10)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (6113, 5, 15000.0000, 4, 15)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (6259, 2, 300000.0000, 2, 5)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (6259, 4, 10000.0000, 2, 5)
GO
INSERT [dbo].[Product] ([ProductId], [CategoryId], [ProductName], [Weight], [UnitPrice], [UnitsInStock]) VALUES (1, 1, N'Candy', N'500g', 20000.0000, 19)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [ProductName], [Weight], [UnitPrice], [UnitsInStock]) VALUES (2, 1, N'Mixed Candy', N'300g', 300000.0000, 18)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [ProductName], [Weight], [UnitPrice], [UnitsInStock]) VALUES (3, 1, N'Cake', N'250g', 15000.0000, 40)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [ProductName], [Weight], [UnitPrice], [UnitsInStock]) VALUES (4, 2, N'Pepsi', N'250ml', 10000.0000, 45)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [ProductName], [Weight], [UnitPrice], [UnitsInStock]) VALUES (5, 1, N'Snack Oshi''s', N'100g', 15000.0000, 31)
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD FOREIGN KEY([MemberId])
REFERENCES [dbo].[Member] ([MemberId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD FOREIGN KEY([OrderId])
REFERENCES [dbo].[Order] ([OrderId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([ProductId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([CategoryId])
ON DELETE CASCADE
GO
USE [master]
GO
ALTER DATABASE [FStoreManagementDB] SET  READ_WRITE 
GO
