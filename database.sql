USE [master]
GO
/****** Object:  Database [WatchShop]    Script Date: 3/24/2021 11:08:17 AM ******/
CREATE DATABASE [WatchShop]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'WatchShop', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\WatchShop.mdf' , SIZE = 3136KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'WatchShop_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\WatchShop_log.ldf' , SIZE = 832KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [WatchShop] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [WatchShop].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [WatchShop] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [WatchShop] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [WatchShop] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [WatchShop] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [WatchShop] SET ARITHABORT OFF 
GO
ALTER DATABASE [WatchShop] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [WatchShop] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [WatchShop] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [WatchShop] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [WatchShop] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [WatchShop] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [WatchShop] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [WatchShop] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [WatchShop] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [WatchShop] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [WatchShop] SET  ENABLE_BROKER 
GO
ALTER DATABASE [WatchShop] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [WatchShop] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [WatchShop] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [WatchShop] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [WatchShop] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [WatchShop] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [WatchShop] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [WatchShop] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [WatchShop] SET  MULTI_USER 
GO
ALTER DATABASE [WatchShop] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [WatchShop] SET DB_CHAINING OFF 
GO
ALTER DATABASE [WatchShop] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [WatchShop] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [WatchShop]
GO
/****** Object:  Table [dbo].[Collection]    Script Date: 3/24/2021 11:08:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Collection](
	[ProductID] [bigint] NOT NULL,
	[UserID] [bigint] NOT NULL,
	[DateAdd] [datetime] NULL,
 CONSTRAINT [PK_Collection] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC,
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Contact]    Script Date: 3/24/2021 11:08:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contact](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Content] [ntext] NOT NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_Contact] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Content]    Script Date: 3/24/2021 11:08:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Content](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NOT NULL,
	[MetaTitle] [varchar](250) NOT NULL,
	[Description] [nvarchar](500) NULL,
	[Image] [nvarchar](250) NULL,
	[Detail] [ntext] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [varchar](50) NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [varchar](50) NULL,
	[MetaKeywords] [nvarchar](250) NULL,
	[MetaDescriptions] [nchar](250) NULL,
	[Status] [bit] NOT NULL,
	[TopHot] [date] NULL,
 CONSTRAINT [PK_News] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Feedback]    Script Date: 3/24/2021 11:08:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Feedback](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Phone] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Address] [nvarchar](50) NOT NULL,
	[Content] [ntext] NOT NULL,
	[CreatedDate] [datetime] NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_Feedback_1] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Footer]    Script Date: 3/24/2021 11:08:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Footer](
	[ID] [int] NOT NULL,
	[Content] [ntext] NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_Footer] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Menu]    Script Date: 3/24/2021 11:08:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Menu](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Text] [nvarchar](50) NOT NULL,
	[Link] [nvarchar](250) NOT NULL,
	[DisplayOrder] [int] NULL,
	[Target] [nvarchar](50) NULL,
	[Status] [bit] NOT NULL,
	[TypeID] [int] NOT NULL,
 CONSTRAINT [PK_Menu] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MenuType]    Script Date: 3/24/2021 11:08:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MenuType](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_MenuType] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Order]    Script Date: 3/24/2021 11:08:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[CreatedDate] [datetime] NULL,
	[CustomerID] [bigint] NULL,
	[ShipName] [nvarchar](50) NULL,
	[ShipMobile] [nvarchar](50) NULL,
	[ShipAddress] [nvarchar](50) NULL,
	[ShipEmail] [nvarchar](50) NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 3/24/2021 11:08:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[ProductID] [bigint] NOT NULL,
	[OrderID] [bigint] NOT NULL,
	[Quantity] [int] NULL,
	[Price] [decimal](18, 0) NULL,
 CONSTRAINT [PK_OrderDetail] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC,
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Product]    Script Date: 3/24/2021 11:08:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Product](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NOT NULL,
	[MetaTitle] [varchar](250) NOT NULL,
	[Description] [nvarchar](500) NULL,
	[Image] [nvarchar](250) NOT NULL,
	[MoreImages] [xml] NULL,
	[Price] [decimal](18, 0) NOT NULL,
	[PromotionPrice] [decimal](18, 0) NOT NULL,
	[Quantity] [int] NOT NULL,
	[CategoryID] [bigint] NOT NULL,
	[Detail] [ntext] NULL,
	[Warranty] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [varchar](50) NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [varchar](50) NULL,
	[MetaKeywords] [nvarchar](250) NULL,
	[MetaDescriptions] [nchar](250) NULL,
	[Status] [bit] NOT NULL,
	[TopHot] [datetime] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ProductCategory]    Script Date: 3/24/2021 11:08:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ProductCategory](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NOT NULL,
	[MetaTitle] [varchar](250) NOT NULL,
	[ParentID] [bigint] NULL,
	[DisplayOrder] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [varchar](50) NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [varchar](50) NULL,
	[MetaKeywords] [nvarchar](250) NULL,
	[MetaDescriptions] [nvarchar](250) NULL,
	[Status] [bit] NOT NULL,
	[ShowOnHome] [bit] NOT NULL,
 CONSTRAINT [PK_ProductCategory] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[User]    Script Date: 3/24/2021 11:08:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[User](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](50) NOT NULL,
	[Password] [varchar](32) NULL,
	[GroupID] [varchar](20) NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Gender] [nvarchar](50) NULL,
	[DateOfBirth] [date] NULL,
	[Address] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Phone] [nvarchar](50) NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [varchar](50) NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [varchar](50) NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UserGroup]    Script Date: 3/24/2021 11:08:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UserGroup](
	[ID] [varchar](20) NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_UserGroup] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Collection] ([ProductID], [UserID], [DateAdd]) VALUES (26, 38, CAST(0x0000ACF400B46F6E AS DateTime))
INSERT [dbo].[Collection] ([ProductID], [UserID], [DateAdd]) VALUES (26, 40, CAST(0x0000ACF400EA1CD7 AS DateTime))
INSERT [dbo].[Collection] ([ProductID], [UserID], [DateAdd]) VALUES (27, 38, CAST(0x0000ACF2010D1452 AS DateTime))
INSERT [dbo].[Collection] ([ProductID], [UserID], [DateAdd]) VALUES (27, 40, CAST(0x0000ACF400EA0A4B AS DateTime))
INSERT [dbo].[Collection] ([ProductID], [UserID], [DateAdd]) VALUES (28, 38, CAST(0x0000ACF200CD7E69 AS DateTime))
INSERT [dbo].[Collection] ([ProductID], [UserID], [DateAdd]) VALUES (28, 40, CAST(0x0000ACF400E9EB7A AS DateTime))
SET IDENTITY_INSERT [dbo].[Contact] ON 

INSERT [dbo].[Contact] ([ID], [Name], [Content], [Status]) VALUES (1, N'FourTeam', N'FourTeam', 1)
INSERT [dbo].[Contact] ([ID], [Name], [Content], [Status]) VALUES (2, N'Địa chỉ', N'TDM, Bình Dương', 1)
INSERT [dbo].[Contact] ([ID], [Name], [Content], [Status]) VALUES (3, N'1234567890', N'1234567890', 1)
INSERT [dbo].[Contact] ([ID], [Name], [Content], [Status]) VALUES (4, N'kiemthuphanmem@gmail.com', N'kiemthuphanmem@gmail.com', 1)
SET IDENTITY_INSERT [dbo].[Contact] OFF
INSERT [dbo].[Footer] ([ID], [Content], [Status]) VALUES (1, N'<footer class="footer_part">
        <div class="container">
            <div class="row justify-content-between">
                <div class="col-sm-6">
                    <div class="single_footer_part">
                        <h4>HỔ TRỢ KHÁCH HÀNG</h4>
                        <ul class="list-unstyled" style="color: white">
                            <li>Hotline: 1234567890 | 0987654321</li>
                            <li>Thời gian: 7h - 20h, Thứ 2 - Thứ 7</li>
                            <li>Địa chỉ: TP. Thủ Dầu Một, Tỉnh Bình Dương</li>
                        </ul>
                    </div>
                </div>
                <div class="col-sm-6">
                    <div class="single_footer_part">
                        <h4>KẾT NỐI VỚI CHÚNG TÔI</h4>
                        <div class="social_icon">
                            <a href="#"><i class="ti-facebook"></i></a>
                            <a href="#"><i class="fab fa-youtube"></i></a>
                            <a href="#"><i class="fab fa-google"></i></a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row justify-content-center">
                <div class="col-lg-12">
                    <div class="copyright_text" >
                        <p style="color: white">
                            Copyright &copy; <script>document.write(new Date().getFullYear());</script> FourTeam - Store Laptop No.1 Việt Nam
                        </p>
                    </div>
                </div>
            </div>
        </div>
</footer>', 1)
SET IDENTITY_INSERT [dbo].[Menu] ON 

INSERT [dbo].[Menu] ([ID], [Text], [Link], [DisplayOrder], [Target], [Status], [TypeID]) VALUES (1, N'Home', N'/', 1, N'_blank', 1, 1)
INSERT [dbo].[Menu] ([ID], [Text], [Link], [DisplayOrder], [Target], [Status], [TypeID]) VALUES (8, N'Tin tức', N'/Tin-tuc', 3, N'_self', 1, 1)
INSERT [dbo].[Menu] ([ID], [Text], [Link], [DisplayOrder], [Target], [Status], [TypeID]) VALUES (10, N'Liên hệ', N'/Lien-he', 5, N'_self', 1, 1)
SET IDENTITY_INSERT [dbo].[Menu] OFF
SET IDENTITY_INSERT [dbo].[MenuType] ON 

INSERT [dbo].[MenuType] ([ID], [Name]) VALUES (1, N'Menu chính')
INSERT [dbo].[MenuType] ([ID], [Name]) VALUES (2, N'Menu Header')
SET IDENTITY_INSERT [dbo].[MenuType] OFF
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([ID], [CreatedDate], [CustomerID], [ShipName], [ShipMobile], [ShipAddress], [ShipEmail], [Status]) VALUES (2, CAST(0x0000ACF200CE5327 AS DateTime), 38, N'Phạm Đức Hiếu', N'0355924968', N'', N'duchieudndh@gmail.com', 3)
INSERT [dbo].[Order] ([ID], [CreatedDate], [CustomerID], [ShipName], [ShipMobile], [ShipAddress], [ShipEmail], [Status]) VALUES (3, CAST(0x0000ACF200D2AAF3 AS DateTime), 38, N'Phạm Đức Hiếu', N'0355924968', N'thu dau mot', N'duchieudndh@gmail.com', 1)
INSERT [dbo].[Order] ([ID], [CreatedDate], [CustomerID], [ShipName], [ShipMobile], [ShipAddress], [ShipEmail], [Status]) VALUES (4, CAST(0x0000ACF200D2D95E AS DateTime), 38, N'Phạm Đức Hiếu', N'0355924968', N'', N'duchieudndh@gmail.com', 3)
INSERT [dbo].[Order] ([ID], [CreatedDate], [CustomerID], [ShipName], [ShipMobile], [ShipAddress], [ShipEmail], [Status]) VALUES (5, CAST(0x0000ACF400C3FD78 AS DateTime), 38, N'Phạm Đức Hiếu', N'0355924968', N'', N'duchieudndh@gmail.com', NULL)
INSERT [dbo].[Order] ([ID], [CreatedDate], [CustomerID], [ShipName], [ShipMobile], [ShipAddress], [ShipEmail], [Status]) VALUES (6, CAST(0x0000ACF400EA4638 AS DateTime), 40, N'CITIZEN', N'0355924968', N'DN', N'hieu@gmailcom', NULL)
SET IDENTITY_INSERT [dbo].[Order] OFF
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Quantity], [Price]) VALUES (24, 5, 1, CAST(8300000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Quantity], [Price]) VALUES (26, 4, 1, CAST(2550000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Quantity], [Price]) VALUES (27, 4, 1, CAST(4019000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Quantity], [Price]) VALUES (28, 2, 1, CAST(2550000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Quantity], [Price]) VALUES (28, 3, 1, CAST(2550000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Quantity], [Price]) VALUES (28, 6, 1, CAST(2550000 AS Decimal(18, 0)))
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([ID], [Name], [MetaTitle], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [Quantity], [CategoryID], [Detail], [Warranty], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot]) VALUES (18, N'DANIEL WELLINGTON 1101DW', N'dw', NULL, N'/Data/images/dong-ho-nam-daniel-wellington-1101dw.jpg', NULL, CAST(4000000 AS Decimal(18, 0)), CAST(3200000 AS Decimal(18, 0)), 32, 14, NULL, 24, CAST(0x0000AB0900D71C7E AS DateTime), N'admin', CAST(0x0000ACDF0107ED20 AS DateTime), N'admin', NULL, NULL, 1, NULL)
INSERT [dbo].[Product] ([ID], [Name], [MetaTitle], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [Quantity], [CategoryID], [Detail], [Warranty], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot]) VALUES (19, N'CITIZEN BM6989-89E – NAM – ECO-DRIVE (NĂNG LƯỢNG ÁNH SÁNG) – DÂY KIM LOẠI', N'citizen', NULL, N'/Data/images/dong-ho-citizen-BM6989-89E.jpg', NULL, CAST(7000000 AS Decimal(18, 0)), CAST(6500000 AS Decimal(18, 0)), 13, 14, NULL, 36, CAST(0x0000AB0900D9197C AS DateTime), N'admin', CAST(0x0000ACDF0107D28F AS DateTime), N'admin', NULL, NULL, 1, CAST(0x0000ACA800000000 AS DateTime))
INSERT [dbo].[Product] ([ID], [Name], [MetaTitle], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [Quantity], [CategoryID], [Detail], [Warranty], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot]) VALUES (20, N'CITIZEN NỮ – KÍNH SAPPHIRE – ECO-DRIVE (NĂNG LƯỢNG ÁNH SÁNG) – DÂY KIM LOẠI', N'citizen', NULL, N'/Data/images/dong-ho-kim-eco-drive-nu-day-kim-loai-citizen-ew15-600x600.jpg', NULL, CAST(6300000 AS Decimal(18, 0)), CAST(6000000 AS Decimal(18, 0)), 8, 14, NULL, 12, CAST(0x0000AB0900D96F5E AS DateTime), N'admin', CAST(0x0000ACDF0107C6A8 AS DateTime), N'admin', NULL, NULL, 1, NULL)
INSERT [dbo].[Product] ([ID], [Name], [MetaTitle], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [Quantity], [CategoryID], [Detail], [Warranty], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot]) VALUES (21, N'CITIZEN BE9182-06E – NAM – QUARTZ (PIN) – DÂY DA', N'citizen', NULL, N'/Data/images/dong_ho_citizen_be9182-06e.jpg', NULL, CAST(4000000 AS Decimal(18, 0)), CAST(3800000 AS Decimal(18, 0)), 5, 14, NULL, 12, CAST(0x0000AB0900DA085E AS DateTime), N'admin', CAST(0x0000ACDF0107B804 AS DateTime), N'admin', NULL, NULL, 1, NULL)
INSERT [dbo].[Product] ([ID], [Name], [MetaTitle], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [Quantity], [CategoryID], [Detail], [Warranty], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot]) VALUES (22, N'CITIZEN NK0001-17X – NAM – AUTOMATIC (TỰ ĐỘNG) – DÂY DA – MẶT SỐ', N'citizen', NULL, N'/Data/images/NK0001-17X.jpg', NULL, CAST(11345000 AS Decimal(18, 0)), CAST(10120000 AS Decimal(18, 0)), 99, 14, NULL, 24, CAST(0x0000AC66018B7081 AS DateTime), N'dung', CAST(0x0000ACDF0107A930 AS DateTime), N'admin', NULL, NULL, 1, NULL)
INSERT [dbo].[Product] ([ID], [Name], [MetaTitle], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [Quantity], [CategoryID], [Detail], [Warranty], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot]) VALUES (23, N'APPLE WATCH SERIES 5 – GPS – 40MM – VIỀN THÉP – DÂY CAO SU', N'apple', NULL, N'/Data/images/2076130625-1-1-1.jpg', NULL, CAST(17000000 AS Decimal(18, 0)), CAST(17000000 AS Decimal(18, 0)), 4, 14, NULL, 36, CAST(0x0000AC67000028B2 AS DateTime), N'dung', CAST(0x0000ACDF01078F0A AS DateTime), N'admin', NULL, NULL, 1, NULL)
INSERT [dbo].[Product] ([ID], [Name], [MetaTitle], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [Quantity], [CategoryID], [Detail], [Warranty], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot]) VALUES (24, N'APPLE WATCH SERIES 3 – GPS – 42MM – VIỀN NHÔM ĐEN – DÂY CAO SU', N'apple', NULL, N'/Data/images/apple-watch-3-phien-ban-38-mm-1-2-org.jpg', NULL, CAST(8500000 AS Decimal(18, 0)), CAST(8300000 AS Decimal(18, 0)), 10, 14, NULL, 12, CAST(0x0000AC670002709E AS DateTime), N'dung', CAST(0x0000ACDF01077F95 AS DateTime), N'admin', NULL, NULL, 1, NULL)
INSERT [dbo].[Product] ([ID], [Name], [MetaTitle], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [Quantity], [CategoryID], [Detail], [Warranty], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot]) VALUES (25, N'CASIO EF-558D-7AVUDF – NAM – QUARTZ', N'casio', NULL, N'/Data/images/casio-edifice-EF-558D-7AVUDF-1200x1400.jpg', NULL, CAST(6000000 AS Decimal(18, 0)), CAST(5880000 AS Decimal(18, 0)), 4, 14, NULL, 12, CAST(0x0000AC670002D45D AS DateTime), N'dung', CAST(0x0000ACDF01076E12 AS DateTime), N'admin', NULL, NULL, 1, CAST(0x0000ACB100000000 AS DateTime))
INSERT [dbo].[Product] ([ID], [Name], [MetaTitle], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [Quantity], [CategoryID], [Detail], [Warranty], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot]) VALUES (26, N'Casio G-Shock GBD-800-1BDR', N'casio', NULL, N'/Data/images/he-lo-top-dong-ho-casio-gshock-duoi-4-trieu-duoc-ua-chuong-nhat-2020-3.jpg', NULL, CAST(2600000 AS Decimal(18, 0)), CAST(2550000 AS Decimal(18, 0)), 9, 14, NULL, 24, CAST(0x0000AC6700031BD7 AS DateTime), N'dung', CAST(0x0000ACDF01075F9D AS DateTime), N'admin', NULL, NULL, 1, NULL)
INSERT [dbo].[Product] ([ID], [Name], [MetaTitle], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [Quantity], [CategoryID], [Detail], [Warranty], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot]) VALUES (27, N'ĐỒNG HỒ CASIO G-SHOCK GBA-800SF-1ADR', N'casio', NULL, N'/Data/images/dong-ho-casio-g-shock-gba-800sf-1adr.jpg', NULL, CAST(4019000 AS Decimal(18, 0)), CAST(4019000 AS Decimal(18, 0)), 46, 14, NULL, 36, CAST(0x0000AC6700034134 AS DateTime), N'dung', CAST(0x0000ACF400D9DBD9 AS DateTime), N'admin', NULL, NULL, 1, CAST(0x0000ACF400000000 AS DateTime))
INSERT [dbo].[Product] ([ID], [Name], [MetaTitle], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [Quantity], [CategoryID], [Detail], [Warranty], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot]) VALUES (28, N'Đồng Hồ Casio Nam Dây Nhựa G-Shock DW-5600BB-1DR', N'casio', NULL, N'/Data/images/casio-g-shock-dw-5600bb-1dr-500x500.jpg', NULL, CAST(2556800 AS Decimal(18, 0)), CAST(2550000 AS Decimal(18, 0)), 19, 14, NULL, 48, CAST(0x0000AC6700036815 AS DateTime), N'dung', CAST(0x0000ACF400DBB2CD AS DateTime), N'admin', NULL, NULL, 1, CAST(0x0000ACF400000000 AS DateTime))
SET IDENTITY_INSERT [dbo].[Product] OFF
SET IDENTITY_INSERT [dbo].[ProductCategory] ON 

INSERT [dbo].[ProductCategory] ([ID], [Name], [MetaTitle], [ParentID], [DisplayOrder], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ShowOnHome]) VALUES (3, N'APPLE', N'apple', NULL, 3, CAST(0x0000AAF2012E0DD6 AS DateTime), N'admin', CAST(0x0000ACDF00E4B6E8 AS DateTime), N'admin', NULL, N'Apple Watch', 1, 1)
INSERT [dbo].[ProductCategory] ([ID], [Name], [MetaTitle], [ParentID], [DisplayOrder], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ShowOnHome]) VALUES (14, N'CITIZEN', N'citizen', NULL, 0, CAST(0x0000AB0800F2CD7A AS DateTime), NULL, CAST(0x0000ACDF00E45FB8 AS DateTime), N'admin', NULL, N'Đông hồ Citizen', 1, 1)
INSERT [dbo].[ProductCategory] ([ID], [Name], [MetaTitle], [ParentID], [DisplayOrder], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ShowOnHome]) VALUES (15, N'CASIO', N'casio', NULL, 1, CAST(0x0000AB0900D89747 AS DateTime), N'admin', CAST(0x0000ACDF00E41EA1 AS DateTime), N'admin', NULL, N'Đồng hồ Casio', 1, 1)
INSERT [dbo].[ProductCategory] ([ID], [Name], [MetaTitle], [ParentID], [DisplayOrder], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ShowOnHome]) VALUES (16, N'DW', N'dw', NULL, 4, CAST(0x0000ACDF00FFF4E6 AS DateTime), N'admin', NULL, NULL, NULL, N'Đồng hồ DW', 1, 1)
SET IDENTITY_INSERT [dbo].[ProductCategory] OFF
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([ID], [Username], [Password], [GroupID], [Name], [Gender], [DateOfBirth], [Address], [Email], [Phone], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (36, N'admin', N'202cb962ac59075b964b07152d234b70', N'ADMIN', N'Admin', N'Nam', CAST(0x76220B00 AS Date), N'Bình Dương', N'kiemthuphanmem@gmail.com', N'1234567890', CAST(0x0000AB110140E3C2 AS DateTime), N'admin', CAST(0x0000AC67000D59BB AS DateTime), N'dung', 1)
INSERT [dbo].[User] ([ID], [Username], [Password], [GroupID], [Name], [Gender], [DateOfBirth], [Address], [Email], [Phone], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (38, N'Hieu', N'202cb962ac59075b964b07152d234b70', N'MEMBER', N'Phạm Đức Hiếu', N'Nam', CAST(0x10230B00 AS Date), NULL, N'duchieudndh@gmail.com', N'0355924968', CAST(0x0000ACDF0108C63C AS DateTime), N'admin', NULL, NULL, 1)
INSERT [dbo].[User] ([ID], [Username], [Password], [GroupID], [Name], [Gender], [DateOfBirth], [Address], [Email], [Phone], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (39, N'duchieu', N'4297f44b13955235245b2497399d7a93', NULL, N'Naruto', NULL, NULL, N'DN', N'emem@gmail.com', N'0355924968', CAST(0x0000ACF400C4DEE3 AS DateTime), NULL, NULL, NULL, 1)
INSERT [dbo].[User] ([ID], [Username], [Password], [GroupID], [Name], [Gender], [DateOfBirth], [Address], [Email], [Phone], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (40, N'hieu2', N'7b4a64c637f74d3cfd9bcaf37e4545f5', N'MEMBER', N'CITIZEN', N'Nam', NULL, N'DN', N'hieu@gmailcom', N'0355924968', CAST(0x0000ACF400C554A4 AS DateTime), NULL, CAST(0x0000ACF400E1FCA6 AS DateTime), N'admin', 1)
INSERT [dbo].[User] ([ID], [Username], [Password], [GroupID], [Name], [Gender], [DateOfBirth], [Address], [Email], [Phone], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (41, N'hieupc', N'4297f44b13955235245b2497399d7a93', N'MEMBER', N'Naruto', NULL, NULL, N'DN', N'hieu06@gmail.com', N'0355924968', CAST(0x0000ACF400D23F3B AS DateTime), NULL, NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[User] OFF
INSERT [dbo].[UserGroup] ([ID], [Name]) VALUES (N'ADMIN', N'Quản trị viên')
INSERT [dbo].[UserGroup] ([ID], [Name]) VALUES (N'MEMBER', N'Thành viên')
INSERT [dbo].[UserGroup] ([ID], [Name]) VALUES (N'MOD', N'Moderatior')
ALTER TABLE [dbo].[Content] ADD  CONSTRAINT [DF_News_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Content] ADD  CONSTRAINT [DF_News_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[Feedback] ADD  CONSTRAINT [DF_Feedback_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Order] ADD  CONSTRAINT [DF_Order_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[OrderDetail] ADD  CONSTRAINT [DF_OrderDetail_Quantity]  DEFAULT ((1)) FOR [Quantity]
GO
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF_Product_Price]  DEFAULT ((0)) FOR [Price]
GO
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF_Product_Quantity]  DEFAULT ((0)) FOR [Quantity]
GO
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF_Product_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF_Product_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[ProductCategory] ADD  CONSTRAINT [DF_ProductCategory_DisplayOrder]  DEFAULT ((0)) FOR [DisplayOrder]
GO
ALTER TABLE [dbo].[ProductCategory] ADD  CONSTRAINT [DF_ProductCategory_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[ProductCategory] ADD  CONSTRAINT [DF_ProductCategory_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[ProductCategory] ADD  CONSTRAINT [DF_ProductCategory_ShowOnHome]  DEFAULT ((0)) FOR [ShowOnHome]
GO
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_User_GroupID]  DEFAULT ('MEMBER') FOR [Gender]
GO
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_User_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Collection]  WITH CHECK ADD  CONSTRAINT [FK_Collection_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[Collection] CHECK CONSTRAINT [FK_Collection_Product]
GO
ALTER TABLE [dbo].[Collection]  WITH CHECK ADD  CONSTRAINT [FK_Collection_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([ID])
GO
ALTER TABLE [dbo].[Collection] CHECK CONSTRAINT [FK_Collection_User]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_User] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[User] ([ID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_User]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Order] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Order] ([ID])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Order]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Product]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_ProductCategory] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[ProductCategory] ([ID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_ProductCategory]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_UserGroup] FOREIGN KEY([GroupID])
REFERENCES [dbo].[UserGroup] ([ID])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_UserGroup]
GO
USE [master]
GO
ALTER DATABASE [WatchShop] SET  READ_WRITE 
GO
