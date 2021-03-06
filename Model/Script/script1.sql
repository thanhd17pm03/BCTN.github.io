USE [master]
GO
/****** Object:  Database [doantotnghiep_webbangiay]    Script Date: 18-Apr-21 12:09:07 AM ******/
CREATE DATABASE [doantotnghiep_webbangiay]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'doantotnghiep_webbangiay', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\doantotnghiep_webbangiay.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'doantotnghiep_webbangiay_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\doantotnghiep_webbangiay_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [doantotnghiep_webbangiay] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [doantotnghiep_webbangiay].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [doantotnghiep_webbangiay] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [doantotnghiep_webbangiay] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [doantotnghiep_webbangiay] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [doantotnghiep_webbangiay] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [doantotnghiep_webbangiay] SET ARITHABORT OFF 
GO
ALTER DATABASE [doantotnghiep_webbangiay] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [doantotnghiep_webbangiay] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [doantotnghiep_webbangiay] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [doantotnghiep_webbangiay] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [doantotnghiep_webbangiay] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [doantotnghiep_webbangiay] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [doantotnghiep_webbangiay] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [doantotnghiep_webbangiay] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [doantotnghiep_webbangiay] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [doantotnghiep_webbangiay] SET  ENABLE_BROKER 
GO
ALTER DATABASE [doantotnghiep_webbangiay] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [doantotnghiep_webbangiay] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [doantotnghiep_webbangiay] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [doantotnghiep_webbangiay] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [doantotnghiep_webbangiay] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [doantotnghiep_webbangiay] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [doantotnghiep_webbangiay] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [doantotnghiep_webbangiay] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [doantotnghiep_webbangiay] SET  MULTI_USER 
GO
ALTER DATABASE [doantotnghiep_webbangiay] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [doantotnghiep_webbangiay] SET DB_CHAINING OFF 
GO
ALTER DATABASE [doantotnghiep_webbangiay] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [doantotnghiep_webbangiay] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [doantotnghiep_webbangiay] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [doantotnghiep_webbangiay] SET QUERY_STORE = OFF
GO
USE [doantotnghiep_webbangiay]
GO
/****** Object:  Table [dbo].[CHITIETDONHANG]    Script Date: 18-Apr-21 12:09:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CHITIETDONHANG](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[IDCo] [bigint] NULL,
	[IDDonHang] [bigint] NULL,
	[SoLuong] [int] NULL,
	[Gia] [decimal](18, 0) NULL,
	[IDSP] [bigint] NULL,
 CONSTRAINT [PK_CHITIETDONHANG] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[COGIAY]    Script Date: 18-Apr-21 12:09:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[COGIAY](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[IDSP] [bigint] NULL,
	[Co] [int] NULL,
	[SoLuong] [int] NULL,
 CONSTRAINT [PK_CO] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DANHGIASANPHAM]    Script Date: 18-Apr-21 12:09:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DANHGIASANPHAM](
	[SanPhamId] [bigint] NOT NULL,
	[TaiKhoanId] [bigint] NOT NULL,
	[DanhGia] [int] NULL,
 CONSTRAINT [PK_DANHGIASANPHAM] PRIMARY KEY CLUSTERED 
(
	[SanPhamId] ASC,
	[TaiKhoanId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DANHMUCSANPHAM]    Script Date: 18-Apr-21 12:09:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DANHMUCSANPHAM](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[TenDanhMuc] [nvarchar](50) NULL,
	[Metatitle] [nvarchar](150) NULL,
	[IDCha] [int] NULL,
	[NgayTao] [datetime] NULL,
	[NguoiTao] [nvarchar](50) NULL,
	[TrangThai] [int] NULL,
 CONSTRAINT [PK_DANHMUCSANPHAM] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DONHANG]    Script Date: 18-Apr-21 12:09:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DONHANG](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[NgayTao] [datetime] NULL,
	[TenKhachHang] [nvarchar](100) NULL,
	[DienThoaiKhachHang] [nvarchar](50) NULL,
	[DiaChiKhachHang] [nvarchar](200) NULL,
	[EmailKhachHang] [nvarchar](50) NULL,
	[TrangThai] [int] NULL,
	[TaiKhoanId] [bigint] NULL,
 CONSTRAINT [PK_DONHANG] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HANG]    Script Date: 18-Apr-21 12:09:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HANG](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[TenHang] [nvarchar](50) NULL,
	[ThongTinHang] [ntext] NULL,
	[TrangThai] [int] NULL,
 CONSTRAINT [PK_HANG] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LIENHE]    Script Date: 18-Apr-21 12:09:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LIENHE](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Phone] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[Address] [nvarchar](200) NULL,
	[Content] [nvarchar](500) NULL,
	[DateCreate] [datetime] NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK_LIENHE] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MENU]    Script Date: 18-Apr-21 12:09:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MENU](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Ten] [nvarchar](50) NULL,
	[IDCha] [int] NULL,
	[Link] [nvarchar](200) NULL,
	[NgayTao] [datetime] NULL,
	[NguoiTao] [nvarchar](50) NULL,
	[TrangThai] [int] NULL,
 CONSTRAINT [PK_MENU] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SANPHAM]    Script Date: 18-Apr-21 12:09:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SANPHAM](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[TenSP] [nvarchar](100) NULL,
	[Code] [varchar](30) NULL,
	[Metatitle] [nvarchar](150) NULL,
	[MoTaSP] [nvarchar](500) NULL,
	[AnhDaiDien] [nvarchar](500) NULL,
	[Gia] [decimal](18, 0) NULL,
	[GiaKhuyenMai] [decimal](18, 0) NULL,
	[ChiTietSP] [ntext] NULL,
	[BaoHanh] [int] NULL,
	[NgayTao] [datetime] NULL,
	[NgaySuaDoi] [datetime] NULL,
	[LuotXem] [int] NULL,
	[TrangThai] [int] NULL,
	[IDDanhMuc] [bigint] NULL,
	[NguoiTao] [bigint] NULL,
	[IDHang] [bigint] NULL,
	[MauGiay] [nvarchar](max) NOT NULL,
	[DanhGia] [float] NULL,
 CONSTRAINT [PK_SANPHAM] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SANPHAMDETAIl]    Script Date: 18-Apr-21 12:09:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SANPHAMDETAIl](
	[IDDetail] [int] IDENTITY(1,1) NOT NULL,
	[IDSanPham] [int] NOT NULL,
	[Size] [int] NULL,
	[Count] [int] NULL,
	[Color] [nvarchar](50) NULL,
	[ColorCode] [char](6) NULL,
 CONSTRAINT [PK_SANPHAMDETAIl] PRIMARY KEY CLUSTERED 
(
	[IDDetail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SLIDE]    Script Date: 18-Apr-21 12:09:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SLIDE](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[TenSlide] [nvarchar](100) NULL,
	[Metatitle] [nvarchar](100) NULL,
	[Anh] [nvarchar](500) NULL,
	[Link] [nvarchar](150) NULL,
	[NgayTao] [datetime] NULL,
	[TrangThai] [int] NULL,
 CONSTRAINT [PK_SLIDE] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TAIKHOAN]    Script Date: 18-Apr-21 12:09:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TAIKHOAN](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[TenTaiKhoan] [nvarchar](50) NULL,
	[MatKhau] [nvarchar](250) NULL,
	[HoTen] [nvarchar](50) NULL,
	[DiaChi] [nvarchar](200) NULL,
	[Email] [nvarchar](50) NULL,
	[SoDienThoai] [nvarchar](50) NULL,
	[QuyenHan] [int] NULL,
	[NgayTao] [datetime] NULL,
	[TrangThai] [int] NULL,
 CONSTRAINT [PK_TAIKHOAN] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[YeuThich]    Script Date: 18-Apr-21 12:09:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[YeuThich](
	[SanPhamId] [bigint] NOT NULL,
	[NguoiDungId] [bigint] NOT NULL,
	[NgayThem] [datetime] NULL,
 CONSTRAINT [PK_YeuThich] PRIMARY KEY CLUSTERED 
(
	[SanPhamId] ASC,
	[NguoiDungId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[CHITIETDONHANG] ON 

INSERT [dbo].[CHITIETDONHANG] ([ID], [IDCo], [IDDonHang], [SoLuong], [Gia], [IDSP]) VALUES (3, 16, 3, 2, CAST(1098000 AS Decimal(18, 0)), 1)
INSERT [dbo].[CHITIETDONHANG] ([ID], [IDCo], [IDDonHang], [SoLuong], [Gia], [IDSP]) VALUES (4, 18, 4, 1, CAST(549000 AS Decimal(18, 0)), 2)
INSERT [dbo].[CHITIETDONHANG] ([ID], [IDCo], [IDDonHang], [SoLuong], [Gia], [IDSP]) VALUES (5, 13, 5, 2, CAST(700000 AS Decimal(18, 0)), 3)
INSERT [dbo].[CHITIETDONHANG] ([ID], [IDCo], [IDDonHang], [SoLuong], [Gia], [IDSP]) VALUES (6, 15, 5, 3, CAST(579000 AS Decimal(18, 0)), 4)
INSERT [dbo].[CHITIETDONHANG] ([ID], [IDCo], [IDDonHang], [SoLuong], [Gia], [IDSP]) VALUES (8, 16, 7, 1, CAST(549000 AS Decimal(18, 0)), 5)
INSERT [dbo].[CHITIETDONHANG] ([ID], [IDCo], [IDDonHang], [SoLuong], [Gia], [IDSP]) VALUES (9, 14, 8, 4, CAST(772000 AS Decimal(18, 0)), 6)
INSERT [dbo].[CHITIETDONHANG] ([ID], [IDCo], [IDDonHang], [SoLuong], [Gia], [IDSP]) VALUES (10, 5, 9, 3, CAST(891000 AS Decimal(18, 0)), 7)
INSERT [dbo].[CHITIETDONHANG] ([ID], [IDCo], [IDDonHang], [SoLuong], [Gia], [IDSP]) VALUES (11, 5, 10, 1, CAST(297000 AS Decimal(18, 0)), 8)
INSERT [dbo].[CHITIETDONHANG] ([ID], [IDCo], [IDDonHang], [SoLuong], [Gia], [IDSP]) VALUES (12, 14, 11, 1, CAST(193000 AS Decimal(18, 0)), 8)
INSERT [dbo].[CHITIETDONHANG] ([ID], [IDCo], [IDDonHang], [SoLuong], [Gia], [IDSP]) VALUES (13, 16, 12, 2, CAST(1098000 AS Decimal(18, 0)), 9)
INSERT [dbo].[CHITIETDONHANG] ([ID], [IDCo], [IDDonHang], [SoLuong], [Gia], [IDSP]) VALUES (14, 16, 13, 1, CAST(549000 AS Decimal(18, 0)), 12)
INSERT [dbo].[CHITIETDONHANG] ([ID], [IDCo], [IDDonHang], [SoLuong], [Gia], [IDSP]) VALUES (15, 14, 13, 1, CAST(193000 AS Decimal(18, 0)), 1)
INSERT [dbo].[CHITIETDONHANG] ([ID], [IDCo], [IDDonHang], [SoLuong], [Gia], [IDSP]) VALUES (16, 18, 13, 1, CAST(549000 AS Decimal(18, 0)), 3)
INSERT [dbo].[CHITIETDONHANG] ([ID], [IDCo], [IDDonHang], [SoLuong], [Gia], [IDSP]) VALUES (17, 9, 14, 1, CAST(640000 AS Decimal(18, 0)), 1)
INSERT [dbo].[CHITIETDONHANG] ([ID], [IDCo], [IDDonHang], [SoLuong], [Gia], [IDSP]) VALUES (18, 14, 15, 1, CAST(193000 AS Decimal(18, 0)), 3)
INSERT [dbo].[CHITIETDONHANG] ([ID], [IDCo], [IDDonHang], [SoLuong], [Gia], [IDSP]) VALUES (19, 14, 16, 1, CAST(193000 AS Decimal(18, 0)), 1)
INSERT [dbo].[CHITIETDONHANG] ([ID], [IDCo], [IDDonHang], [SoLuong], [Gia], [IDSP]) VALUES (20, 14, 17, 1, CAST(193000 AS Decimal(18, 0)), 3)
INSERT [dbo].[CHITIETDONHANG] ([ID], [IDCo], [IDDonHang], [SoLuong], [Gia], [IDSP]) VALUES (21, 16, 17, 1, CAST(549000 AS Decimal(18, 0)), 1)
INSERT [dbo].[CHITIETDONHANG] ([ID], [IDCo], [IDDonHang], [SoLuong], [Gia], [IDSP]) VALUES (22, 14, 18, 1, CAST(193000 AS Decimal(18, 0)), 2)
INSERT [dbo].[CHITIETDONHANG] ([ID], [IDCo], [IDDonHang], [SoLuong], [Gia], [IDSP]) VALUES (23, 16, 18, 1, CAST(549000 AS Decimal(18, 0)), 4)
INSERT [dbo].[CHITIETDONHANG] ([ID], [IDCo], [IDDonHang], [SoLuong], [Gia], [IDSP]) VALUES (24, 17, 19, 1, CAST(549000 AS Decimal(18, 0)), 1)
INSERT [dbo].[CHITIETDONHANG] ([ID], [IDCo], [IDDonHang], [SoLuong], [Gia], [IDSP]) VALUES (25, 17, 20, 1, CAST(549000 AS Decimal(18, 0)), 2)
INSERT [dbo].[CHITIETDONHANG] ([ID], [IDCo], [IDDonHang], [SoLuong], [Gia], [IDSP]) VALUES (26, 17, 21, 1, CAST(549000 AS Decimal(18, 0)), 4)
INSERT [dbo].[CHITIETDONHANG] ([ID], [IDCo], [IDDonHang], [SoLuong], [Gia], [IDSP]) VALUES (27, 17, 22, 1, CAST(549000 AS Decimal(18, 0)), 1)
INSERT [dbo].[CHITIETDONHANG] ([ID], [IDCo], [IDDonHang], [SoLuong], [Gia], [IDSP]) VALUES (28, 19, 22, 1, CAST(549000 AS Decimal(18, 0)), 2)
INSERT [dbo].[CHITIETDONHANG] ([ID], [IDCo], [IDDonHang], [SoLuong], [Gia], [IDSP]) VALUES (29, 23, 23, 1, CAST(23 AS Decimal(18, 0)), 4)
INSERT [dbo].[CHITIETDONHANG] ([ID], [IDCo], [IDDonHang], [SoLuong], [Gia], [IDSP]) VALUES (30, 23, 24, 1, CAST(23 AS Decimal(18, 0)), 1)
INSERT [dbo].[CHITIETDONHANG] ([ID], [IDCo], [IDDonHang], [SoLuong], [Gia], [IDSP]) VALUES (31, 209, 25, 1, CAST(1700000 AS Decimal(18, 0)), 4)
INSERT [dbo].[CHITIETDONHANG] ([ID], [IDCo], [IDDonHang], [SoLuong], [Gia], [IDSP]) VALUES (32, 207, 26, 1, CAST(1000000 AS Decimal(18, 0)), 1)
INSERT [dbo].[CHITIETDONHANG] ([ID], [IDCo], [IDDonHang], [SoLuong], [Gia], [IDSP]) VALUES (33, 54, 27, 1, CAST(714000 AS Decimal(18, 0)), 2)
INSERT [dbo].[CHITIETDONHANG] ([ID], [IDCo], [IDDonHang], [SoLuong], [Gia], [IDSP]) VALUES (34, 43, 28, 1, CAST(970000 AS Decimal(18, 0)), 4)
INSERT [dbo].[CHITIETDONHANG] ([ID], [IDCo], [IDDonHang], [SoLuong], [Gia], [IDSP]) VALUES (35, 193, 29, 1, CAST(2100000 AS Decimal(18, 0)), 5)
INSERT [dbo].[CHITIETDONHANG] ([ID], [IDCo], [IDDonHang], [SoLuong], [Gia], [IDSP]) VALUES (36, 191, 30, 1, CAST(2100000 AS Decimal(18, 0)), 6)
INSERT [dbo].[CHITIETDONHANG] ([ID], [IDCo], [IDDonHang], [SoLuong], [Gia], [IDSP]) VALUES (37, 191, 31, 1, CAST(2100000 AS Decimal(18, 0)), 7)
INSERT [dbo].[CHITIETDONHANG] ([ID], [IDCo], [IDDonHang], [SoLuong], [Gia], [IDSP]) VALUES (38, 191, 32, 1, CAST(2100000 AS Decimal(18, 0)), 9)
INSERT [dbo].[CHITIETDONHANG] ([ID], [IDCo], [IDDonHang], [SoLuong], [Gia], [IDSP]) VALUES (39, 191, 33, 1, CAST(2100000 AS Decimal(18, 0)), 8)
INSERT [dbo].[CHITIETDONHANG] ([ID], [IDCo], [IDDonHang], [SoLuong], [Gia], [IDSP]) VALUES (40, 191, 34, 1, CAST(2100000 AS Decimal(18, 0)), 13)
INSERT [dbo].[CHITIETDONHANG] ([ID], [IDCo], [IDDonHang], [SoLuong], [Gia], [IDSP]) VALUES (41, 191, 35, 1, CAST(2100000 AS Decimal(18, 0)), 11)
INSERT [dbo].[CHITIETDONHANG] ([ID], [IDCo], [IDDonHang], [SoLuong], [Gia], [IDSP]) VALUES (42, 193, 35, 1, CAST(2100000 AS Decimal(18, 0)), 11)
INSERT [dbo].[CHITIETDONHANG] ([ID], [IDCo], [IDDonHang], [SoLuong], [Gia], [IDSP]) VALUES (43, 191, 36, 1, CAST(2100000 AS Decimal(18, 0)), 13)
INSERT [dbo].[CHITIETDONHANG] ([ID], [IDCo], [IDDonHang], [SoLuong], [Gia], [IDSP]) VALUES (44, 186, 37, 1, CAST(2400000 AS Decimal(18, 0)), 12)
INSERT [dbo].[CHITIETDONHANG] ([ID], [IDCo], [IDDonHang], [SoLuong], [Gia], [IDSP]) VALUES (45, 191, 38, 1, CAST(2100000 AS Decimal(18, 0)), 13)
INSERT [dbo].[CHITIETDONHANG] ([ID], [IDCo], [IDDonHang], [SoLuong], [Gia], [IDSP]) VALUES (46, 191, 39, 1, CAST(2100000 AS Decimal(18, 0)), 12)
INSERT [dbo].[CHITIETDONHANG] ([ID], [IDCo], [IDDonHang], [SoLuong], [Gia], [IDSP]) VALUES (47, 191, 40, 1, CAST(2100000 AS Decimal(18, 0)), 25)
INSERT [dbo].[CHITIETDONHANG] ([ID], [IDCo], [IDDonHang], [SoLuong], [Gia], [IDSP]) VALUES (48, 191, 41, 1, CAST(2100000 AS Decimal(18, 0)), 12)
INSERT [dbo].[CHITIETDONHANG] ([ID], [IDCo], [IDDonHang], [SoLuong], [Gia], [IDSP]) VALUES (49, 191, 42, 1, CAST(2100000 AS Decimal(18, 0)), 12)
INSERT [dbo].[CHITIETDONHANG] ([ID], [IDCo], [IDDonHang], [SoLuong], [Gia], [IDSP]) VALUES (50, 191, 43, 1, CAST(2100000 AS Decimal(18, 0)), 1)
INSERT [dbo].[CHITIETDONHANG] ([ID], [IDCo], [IDDonHang], [SoLuong], [Gia], [IDSP]) VALUES (51, 191, 44, 1, CAST(2100000 AS Decimal(18, 0)), 4)
INSERT [dbo].[CHITIETDONHANG] ([ID], [IDCo], [IDDonHang], [SoLuong], [Gia], [IDSP]) VALUES (52, 189, 45, 1, CAST(2400000 AS Decimal(18, 0)), 1)
INSERT [dbo].[CHITIETDONHANG] ([ID], [IDCo], [IDDonHang], [SoLuong], [Gia], [IDSP]) VALUES (53, 192, 46, 3, CAST(6300000 AS Decimal(18, 0)), 4)
INSERT [dbo].[CHITIETDONHANG] ([ID], [IDCo], [IDDonHang], [SoLuong], [Gia], [IDSP]) VALUES (54, 192, 47, 3, CAST(6300000 AS Decimal(18, 0)), 1)
INSERT [dbo].[CHITIETDONHANG] ([ID], [IDCo], [IDDonHang], [SoLuong], [Gia], [IDSP]) VALUES (55, 188, 47, 1, CAST(2400000 AS Decimal(18, 0)), 4)
INSERT [dbo].[CHITIETDONHANG] ([ID], [IDCo], [IDDonHang], [SoLuong], [Gia], [IDSP]) VALUES (56, 193, 48, 1, CAST(2100000 AS Decimal(18, 0)), 1)
INSERT [dbo].[CHITIETDONHANG] ([ID], [IDCo], [IDDonHang], [SoLuong], [Gia], [IDSP]) VALUES (57, 98, 49, 1, CAST(600000 AS Decimal(18, 0)), 2)
INSERT [dbo].[CHITIETDONHANG] ([ID], [IDCo], [IDDonHang], [SoLuong], [Gia], [IDSP]) VALUES (58, 194, 50, 1, CAST(2100000 AS Decimal(18, 0)), 4)
INSERT [dbo].[CHITIETDONHANG] ([ID], [IDCo], [IDDonHang], [SoLuong], [Gia], [IDSP]) VALUES (59, 194, 51, 1, CAST(2100000 AS Decimal(18, 0)), 1)
INSERT [dbo].[CHITIETDONHANG] ([ID], [IDCo], [IDDonHang], [SoLuong], [Gia], [IDSP]) VALUES (60, 195, 52, 1, CAST(2100000 AS Decimal(18, 0)), 2)
INSERT [dbo].[CHITIETDONHANG] ([ID], [IDCo], [IDDonHang], [SoLuong], [Gia], [IDSP]) VALUES (61, 191, 53, 1, CAST(2100000 AS Decimal(18, 0)), 4)
INSERT [dbo].[CHITIETDONHANG] ([ID], [IDCo], [IDDonHang], [SoLuong], [Gia], [IDSP]) VALUES (62, 193, 54, 1, CAST(2100000 AS Decimal(18, 0)), 1)
INSERT [dbo].[CHITIETDONHANG] ([ID], [IDCo], [IDDonHang], [SoLuong], [Gia], [IDSP]) VALUES (63, 189, 55, 1, CAST(2400000 AS Decimal(18, 0)), 2)
INSERT [dbo].[CHITIETDONHANG] ([ID], [IDCo], [IDDonHang], [SoLuong], [Gia], [IDSP]) VALUES (64, 71, 56, 1, CAST(1840000 AS Decimal(18, 0)), 5)
INSERT [dbo].[CHITIETDONHANG] ([ID], [IDCo], [IDDonHang], [SoLuong], [Gia], [IDSP]) VALUES (65, 167, 57, 1, CAST(540000 AS Decimal(18, 0)), 1)
INSERT [dbo].[CHITIETDONHANG] ([ID], [IDCo], [IDDonHang], [SoLuong], [Gia], [IDSP]) VALUES (66, 191, 58, 1, CAST(2100000 AS Decimal(18, 0)), 47)
SET IDENTITY_INSERT [dbo].[CHITIETDONHANG] OFF
GO
SET IDENTITY_INSERT [dbo].[COGIAY] ON 

INSERT [dbo].[COGIAY] ([ID], [IDSP], [Co], [SoLuong]) VALUES (1, 3, 38, 100)
INSERT [dbo].[COGIAY] ([ID], [IDSP], [Co], [SoLuong]) VALUES (2, 3, 39, 100)
INSERT [dbo].[COGIAY] ([ID], [IDSP], [Co], [SoLuong]) VALUES (3, 3, 40, 100)
INSERT [dbo].[COGIAY] ([ID], [IDSP], [Co], [SoLuong]) VALUES (4, 5, 38, 100)
INSERT [dbo].[COGIAY] ([ID], [IDSP], [Co], [SoLuong]) VALUES (5, 5, 39, 100)
INSERT [dbo].[COGIAY] ([ID], [IDSP], [Co], [SoLuong]) VALUES (6, 5, 40, 10)
INSERT [dbo].[COGIAY] ([ID], [IDSP], [Co], [SoLuong]) VALUES (7, 6, 38, 100)
INSERT [dbo].[COGIAY] ([ID], [IDSP], [Co], [SoLuong]) VALUES (8, 6, 39, 100)
INSERT [dbo].[COGIAY] ([ID], [IDSP], [Co], [SoLuong]) VALUES (9, 7, 38, 99)
INSERT [dbo].[COGIAY] ([ID], [IDSP], [Co], [SoLuong]) VALUES (10, 7, 39, 100)
INSERT [dbo].[COGIAY] ([ID], [IDSP], [Co], [SoLuong]) VALUES (11, 7, 40, 30)
INSERT [dbo].[COGIAY] ([ID], [IDSP], [Co], [SoLuong]) VALUES (12, 7, 41, 36)
INSERT [dbo].[COGIAY] ([ID], [IDSP], [Co], [SoLuong]) VALUES (13, 8, 42, 8)
INSERT [dbo].[COGIAY] ([ID], [IDSP], [Co], [SoLuong]) VALUES (14, 9, 38, 20)
INSERT [dbo].[COGIAY] ([ID], [IDSP], [Co], [SoLuong]) VALUES (15, 9, 39, 27)
INSERT [dbo].[COGIAY] ([ID], [IDSP], [Co], [SoLuong]) VALUES (16, 10, 40, 10)
INSERT [dbo].[COGIAY] ([ID], [IDSP], [Co], [SoLuong]) VALUES (17, 10, 41, 10)
INSERT [dbo].[COGIAY] ([ID], [IDSP], [Co], [SoLuong]) VALUES (18, 10, 42, 9)
INSERT [dbo].[COGIAY] ([ID], [IDSP], [Co], [SoLuong]) VALUES (19, 10, 43, 10)
INSERT [dbo].[COGIAY] ([ID], [IDSP], [Co], [SoLuong]) VALUES (20, 10, 44, 10)
INSERT [dbo].[COGIAY] ([ID], [IDSP], [Co], [SoLuong]) VALUES (21, 12, 38, 12)
INSERT [dbo].[COGIAY] ([ID], [IDSP], [Co], [SoLuong]) VALUES (22, 15, 38, 12)
INSERT [dbo].[COGIAY] ([ID], [IDSP], [Co], [SoLuong]) VALUES (23, 15, 37, 1)
INSERT [dbo].[COGIAY] ([ID], [IDSP], [Co], [SoLuong]) VALUES (24, 16, 35, 12)
INSERT [dbo].[COGIAY] ([ID], [IDSP], [Co], [SoLuong]) VALUES (25, 16, 36, 24)
INSERT [dbo].[COGIAY] ([ID], [IDSP], [Co], [SoLuong]) VALUES (26, 16, 37, 21)
INSERT [dbo].[COGIAY] ([ID], [IDSP], [Co], [SoLuong]) VALUES (27, 16, 38, 9)
INSERT [dbo].[COGIAY] ([ID], [IDSP], [Co], [SoLuong]) VALUES (28, 16, 40, 2)
INSERT [dbo].[COGIAY] ([ID], [IDSP], [Co], [SoLuong]) VALUES (29, 16, 41, 2)
INSERT [dbo].[COGIAY] ([ID], [IDSP], [Co], [SoLuong]) VALUES (30, 16, 42, 3)
INSERT [dbo].[COGIAY] ([ID], [IDSP], [Co], [SoLuong]) VALUES (31, 16, 43, 5)
INSERT [dbo].[COGIAY] ([ID], [IDSP], [Co], [SoLuong]) VALUES (32, 16, 44, 8)
INSERT [dbo].[COGIAY] ([ID], [IDSP], [Co], [SoLuong]) VALUES (33, 16, 45, 1)
INSERT [dbo].[COGIAY] ([ID], [IDSP], [Co], [SoLuong]) VALUES (34, 17, 35, 12)
INSERT [dbo].[COGIAY] ([ID], [IDSP], [Co], [SoLuong]) VALUES (35, 17, 36, 24)
INSERT [dbo].[COGIAY] ([ID], [IDSP], [Co], [SoLuong]) VALUES (36, 17, 37, 21)
INSERT [dbo].[COGIAY] ([ID], [IDSP], [Co], [SoLuong]) VALUES (37, 17, 38, 9)
INSERT [dbo].[COGIAY] ([ID], [IDSP], [Co], [SoLuong]) VALUES (38, 17, 40, 2)
INSERT [dbo].[COGIAY] ([ID], [IDSP], [Co], [SoLuong]) VALUES (39, 17, 41, 2)
INSERT [dbo].[COGIAY] ([ID], [IDSP], [Co], [SoLuong]) VALUES (40, 18, 35, 12)
INSERT [dbo].[COGIAY] ([ID], [IDSP], [Co], [SoLuong]) VALUES (41, 19, 35, 12)
INSERT [dbo].[COGIAY] ([ID], [IDSP], [Co], [SoLuong]) VALUES (42, 19, 36, 24)
INSERT [dbo].[COGIAY] ([ID], [IDSP], [Co], [SoLuong]) VALUES (43, 19, 37, 20)
INSERT [dbo].[COGIAY] ([ID], [IDSP], [Co], [SoLuong]) VALUES (44, 19, 38, 9)
INSERT [dbo].[COGIAY] ([ID], [IDSP], [Co], [SoLuong]) VALUES (45, 19, 40, 2)
INSERT [dbo].[COGIAY] ([ID], [IDSP], [Co], [SoLuong]) VALUES (46, 20, 35, 12)
INSERT [dbo].[COGIAY] ([ID], [IDSP], [Co], [SoLuong]) VALUES (47, 20, 36, 24)
INSERT [dbo].[COGIAY] ([ID], [IDSP], [Co], [SoLuong]) VALUES (48, 20, 37, 21)
INSERT [dbo].[COGIAY] ([ID], [IDSP], [Co], [SoLuong]) VALUES (49, 20, 38, 9)
INSERT [dbo].[COGIAY] ([ID], [IDSP], [Co], [SoLuong]) VALUES (50, 20, 40, 2)
INSERT [dbo].[COGIAY] ([ID], [IDSP], [Co], [SoLuong]) VALUES (51, 21, 38, 12)
INSERT [dbo].[COGIAY] ([ID], [IDSP], [Co], [SoLuong]) VALUES (52, 21, 37, 2)
INSERT [dbo].[COGIAY] ([ID], [IDSP], [Co], [SoLuong]) VALUES (53, 22, 35, 12)
INSERT [dbo].[COGIAY] ([ID], [IDSP], [Co], [SoLuong]) VALUES (54, 22, 36, 23)
INSERT [dbo].[COGIAY] ([ID], [IDSP], [Co], [SoLuong]) VALUES (55, 22, 37, 21)
INSERT [dbo].[COGIAY] ([ID], [IDSP], [Co], [SoLuong]) VALUES (56, 22, 38, 9)
INSERT [dbo].[COGIAY] ([ID], [IDSP], [Co], [SoLuong]) VALUES (57, 22, 40, 2)
INSERT [dbo].[COGIAY] ([ID], [IDSP], [Co], [SoLuong]) VALUES (58, 23, 35, 12)
INSERT [dbo].[COGIAY] ([ID], [IDSP], [Co], [SoLuong]) VALUES (59, 23, 36, 24)
INSERT [dbo].[COGIAY] ([ID], [IDSP], [Co], [SoLuong]) VALUES (60, 23, 37, 21)
INSERT [dbo].[COGIAY] ([ID], [IDSP], [Co], [SoLuong]) VALUES (61, 23, 38, 9)
INSERT [dbo].[COGIAY] ([ID], [IDSP], [Co], [SoLuong]) VALUES (62, 23, 40, 2)
INSERT [dbo].[COGIAY] ([ID], [IDSP], [Co], [SoLuong]) VALUES (63, 24, 35, 12)
INSERT [dbo].[COGIAY] ([ID], [IDSP], [Co], [SoLuong]) VALUES (64, 24, 36, 24)
INSERT [dbo].[COGIAY] ([ID], [IDSP], [Co], [SoLuong]) VALUES (65, 24, 37, 21)
INSERT [dbo].[COGIAY] ([ID], [IDSP], [Co], [SoLuong]) VALUES (66, 24, 38, 9)
INSERT [dbo].[COGIAY] ([ID], [IDSP], [Co], [SoLuong]) VALUES (67, 24, 40, 2)
INSERT [dbo].[COGIAY] ([ID], [IDSP], [Co], [SoLuong]) VALUES (68, 25, 35, 12)
INSERT [dbo].[COGIAY] ([ID], [IDSP], [Co], [SoLuong]) VALUES (69, 25, 36, 24)
INSERT [dbo].[COGIAY] ([ID], [IDSP], [Co], [SoLuong]) VALUES (70, 25, 37, 21)
INSERT [dbo].[COGIAY] ([ID], [IDSP], [Co], [SoLuong]) VALUES (71, 25, 38, 9)
INSERT [dbo].[COGIAY] ([ID], [IDSP], [Co], [SoLuong]) VALUES (72, 26, 35, 12)
INSERT [dbo].[COGIAY] ([ID], [IDSP], [Co], [SoLuong]) VALUES (73, 26, 36, 24)
INSERT [dbo].[COGIAY] ([ID], [IDSP], [Co], [SoLuong]) VALUES (74, 26, 37, 21)
INSERT [dbo].[COGIAY] ([ID], [IDSP], [Co], [SoLuong]) VALUES (75, 26, 38, 9)
INSERT [dbo].[COGIAY] ([ID], [IDSP], [Co], [SoLuong]) VALUES (76, 26, 40, 2)
INSERT [dbo].[COGIAY] ([ID], [IDSP], [Co], [SoLuong]) VALUES (77, 26, 41, 2)
INSERT [dbo].[COGIAY] ([ID], [IDSP], [Co], [SoLuong]) VALUES (78, 26, 42, 3)
INSERT [dbo].[COGIAY] ([ID], [IDSP], [Co], [SoLuong]) VALUES (79, 26, 43, 5)
INSERT [dbo].[COGIAY] ([ID], [IDSP], [Co], [SoLuong]) VALUES (80, 26, 44, 8)
INSERT [dbo].[COGIAY] ([ID], [IDSP], [Co], [SoLuong]) VALUES (81, 26, 45, 1)
INSERT [dbo].[COGIAY] ([ID], [IDSP], [Co], [SoLuong]) VALUES (82, 27, 35, 12)
INSERT [dbo].[COGIAY] ([ID], [IDSP], [Co], [SoLuong]) VALUES (83, 27, 36, 24)
INSERT [dbo].[COGIAY] ([ID], [IDSP], [Co], [SoLuong]) VALUES (84, 27, 37, 21)
INSERT [dbo].[COGIAY] ([ID], [IDSP], [Co], [SoLuong]) VALUES (85, 27, 38, 9)
INSERT [dbo].[COGIAY] ([ID], [IDSP], [Co], [SoLuong]) VALUES (86, 27, 40, 2)
INSERT [dbo].[COGIAY] ([ID], [IDSP], [Co], [SoLuong]) VALUES (87, 27, 41, 2)
INSERT [dbo].[COGIAY] ([ID], [IDSP], [Co], [SoLuong]) VALUES (88, 27, 42, 3)
INSERT [dbo].[COGIAY] ([ID], [IDSP], [Co], [SoLuong]) VALUES (89, 27, 43, 5)
INSERT [dbo].[COGIAY] ([ID], [IDSP], [Co], [SoLuong]) VALUES (90, 27, 44, 8)
INSERT [dbo].[COGIAY] ([ID], [IDSP], [Co], [SoLuong]) VALUES (91, 27, 45, 1)
INSERT [dbo].[COGIAY] ([ID], [IDSP], [Co], [SoLuong]) VALUES (92, 28, 35, 12)
INSERT [dbo].[COGIAY] ([ID], [IDSP], [Co], [SoLuong]) VALUES (93, 28, 36, 24)
INSERT [dbo].[COGIAY] ([ID], [IDSP], [Co], [SoLuong]) VALUES (94, 28, 37, 21)
INSERT [dbo].[COGIAY] ([ID], [IDSP], [Co], [SoLuong]) VALUES (95, 28, 38, 9)
INSERT [dbo].[COGIAY] ([ID], [IDSP], [Co], [SoLuong]) VALUES (96, 28, 40, 2)
INSERT [dbo].[COGIAY] ([ID], [IDSP], [Co], [SoLuong]) VALUES (97, 28, 41, 2)
INSERT [dbo].[COGIAY] ([ID], [IDSP], [Co], [SoLuong]) VALUES (98, 28, 42, 3)
INSERT [dbo].[COGIAY] ([ID], [IDSP], [Co], [SoLuong]) VALUES (99, 28, 43, 5)
GO
INSERT [dbo].[COGIAY] ([ID], [IDSP], [Co], [SoLuong]) VALUES (100, 28, 44, 8)
INSERT [dbo].[COGIAY] ([ID], [IDSP], [Co], [SoLuong]) VALUES (101, 28, 45, 1)
INSERT [dbo].[COGIAY] ([ID], [IDSP], [Co], [SoLuong]) VALUES (102, 29, 35, 12)
INSERT [dbo].[COGIAY] ([ID], [IDSP], [Co], [SoLuong]) VALUES (103, 29, 36, 24)
INSERT [dbo].[COGIAY] ([ID], [IDSP], [Co], [SoLuong]) VALUES (104, 29, 37, 21)
INSERT [dbo].[COGIAY] ([ID], [IDSP], [Co], [SoLuong]) VALUES (105, 29, 38, 9)
INSERT [dbo].[COGIAY] ([ID], [IDSP], [Co], [SoLuong]) VALUES (106, 29, 40, 2)
INSERT [dbo].[COGIAY] ([ID], [IDSP], [Co], [SoLuong]) VALUES (107, 29, 41, 2)
INSERT [dbo].[COGIAY] ([ID], [IDSP], [Co], [SoLuong]) VALUES (108, 29, 42, 3)
INSERT [dbo].[COGIAY] ([ID], [IDSP], [Co], [SoLuong]) VALUES (109, 29, 43, 5)
INSERT [dbo].[COGIAY] ([ID], [IDSP], [Co], [SoLuong]) VALUES (110, 29, 44, 8)
INSERT [dbo].[COGIAY] ([ID], [IDSP], [Co], [SoLuong]) VALUES (111, 29, 45, 1)
INSERT [dbo].[COGIAY] ([ID], [IDSP], [Co], [SoLuong]) VALUES (112, 30, 40, 0)
INSERT [dbo].[COGIAY] ([ID], [IDSP], [Co], [SoLuong]) VALUES (113, 30, 41, 0)
INSERT [dbo].[COGIAY] ([ID], [IDSP], [Co], [SoLuong]) VALUES (114, 31, 25, 3)
INSERT [dbo].[COGIAY] ([ID], [IDSP], [Co], [SoLuong]) VALUES (115, 31, 24, 6)
INSERT [dbo].[COGIAY] ([ID], [IDSP], [Co], [SoLuong]) VALUES (116, 31, 25, 7)
INSERT [dbo].[COGIAY] ([ID], [IDSP], [Co], [SoLuong]) VALUES (117, 31, 26, 4)
INSERT [dbo].[COGIAY] ([ID], [IDSP], [Co], [SoLuong]) VALUES (118, 32, 25, 3)
INSERT [dbo].[COGIAY] ([ID], [IDSP], [Co], [SoLuong]) VALUES (119, 32, 24, 6)
INSERT [dbo].[COGIAY] ([ID], [IDSP], [Co], [SoLuong]) VALUES (120, 32, 25, 7)
INSERT [dbo].[COGIAY] ([ID], [IDSP], [Co], [SoLuong]) VALUES (121, 32, 26, 4)
INSERT [dbo].[COGIAY] ([ID], [IDSP], [Co], [SoLuong]) VALUES (122, 33, 25, 3)
INSERT [dbo].[COGIAY] ([ID], [IDSP], [Co], [SoLuong]) VALUES (123, 33, 24, 6)
INSERT [dbo].[COGIAY] ([ID], [IDSP], [Co], [SoLuong]) VALUES (124, 33, 25, 7)
INSERT [dbo].[COGIAY] ([ID], [IDSP], [Co], [SoLuong]) VALUES (125, 33, 26, 4)
INSERT [dbo].[COGIAY] ([ID], [IDSP], [Co], [SoLuong]) VALUES (126, 34, 25, 3)
INSERT [dbo].[COGIAY] ([ID], [IDSP], [Co], [SoLuong]) VALUES (127, 34, 24, 6)
INSERT [dbo].[COGIAY] ([ID], [IDSP], [Co], [SoLuong]) VALUES (128, 35, 25, 3)
INSERT [dbo].[COGIAY] ([ID], [IDSP], [Co], [SoLuong]) VALUES (129, 35, 24, 6)
INSERT [dbo].[COGIAY] ([ID], [IDSP], [Co], [SoLuong]) VALUES (130, 35, 25, 7)
INSERT [dbo].[COGIAY] ([ID], [IDSP], [Co], [SoLuong]) VALUES (131, 35, 26, 4)
INSERT [dbo].[COGIAY] ([ID], [IDSP], [Co], [SoLuong]) VALUES (132, 36, 25, 3)
INSERT [dbo].[COGIAY] ([ID], [IDSP], [Co], [SoLuong]) VALUES (133, 36, 24, 6)
INSERT [dbo].[COGIAY] ([ID], [IDSP], [Co], [SoLuong]) VALUES (134, 36, 25, 7)
INSERT [dbo].[COGIAY] ([ID], [IDSP], [Co], [SoLuong]) VALUES (135, 36, 26, 4)
INSERT [dbo].[COGIAY] ([ID], [IDSP], [Co], [SoLuong]) VALUES (136, 37, 25, 3)
INSERT [dbo].[COGIAY] ([ID], [IDSP], [Co], [SoLuong]) VALUES (137, 37, 24, 6)
INSERT [dbo].[COGIAY] ([ID], [IDSP], [Co], [SoLuong]) VALUES (138, 37, 25, 7)
INSERT [dbo].[COGIAY] ([ID], [IDSP], [Co], [SoLuong]) VALUES (139, 37, 26, 4)
INSERT [dbo].[COGIAY] ([ID], [IDSP], [Co], [SoLuong]) VALUES (140, 38, 25, 0)
INSERT [dbo].[COGIAY] ([ID], [IDSP], [Co], [SoLuong]) VALUES (141, 39, 25, 3)
INSERT [dbo].[COGIAY] ([ID], [IDSP], [Co], [SoLuong]) VALUES (142, 39, 24, 6)
INSERT [dbo].[COGIAY] ([ID], [IDSP], [Co], [SoLuong]) VALUES (143, 39, 25, 7)
INSERT [dbo].[COGIAY] ([ID], [IDSP], [Co], [SoLuong]) VALUES (144, 39, 26, 4)
INSERT [dbo].[COGIAY] ([ID], [IDSP], [Co], [SoLuong]) VALUES (145, 40, 25, 3)
INSERT [dbo].[COGIAY] ([ID], [IDSP], [Co], [SoLuong]) VALUES (146, 40, 24, 6)
INSERT [dbo].[COGIAY] ([ID], [IDSP], [Co], [SoLuong]) VALUES (147, 40, 25, 7)
INSERT [dbo].[COGIAY] ([ID], [IDSP], [Co], [SoLuong]) VALUES (148, 40, 26, 4)
INSERT [dbo].[COGIAY] ([ID], [IDSP], [Co], [SoLuong]) VALUES (149, 41, 35, 12)
INSERT [dbo].[COGIAY] ([ID], [IDSP], [Co], [SoLuong]) VALUES (150, 41, 36, 24)
INSERT [dbo].[COGIAY] ([ID], [IDSP], [Co], [SoLuong]) VALUES (151, 41, 37, 21)
INSERT [dbo].[COGIAY] ([ID], [IDSP], [Co], [SoLuong]) VALUES (152, 41, 38, 9)
INSERT [dbo].[COGIAY] ([ID], [IDSP], [Co], [SoLuong]) VALUES (153, 41, 40, 2)
INSERT [dbo].[COGIAY] ([ID], [IDSP], [Co], [SoLuong]) VALUES (154, 42, 35, 12)
INSERT [dbo].[COGIAY] ([ID], [IDSP], [Co], [SoLuong]) VALUES (155, 42, 36, 24)
INSERT [dbo].[COGIAY] ([ID], [IDSP], [Co], [SoLuong]) VALUES (156, 42, 37, 21)
INSERT [dbo].[COGIAY] ([ID], [IDSP], [Co], [SoLuong]) VALUES (157, 42, 38, 9)
INSERT [dbo].[COGIAY] ([ID], [IDSP], [Co], [SoLuong]) VALUES (158, 42, 40, 2)
INSERT [dbo].[COGIAY] ([ID], [IDSP], [Co], [SoLuong]) VALUES (159, 42, 41, 2)
INSERT [dbo].[COGIAY] ([ID], [IDSP], [Co], [SoLuong]) VALUES (160, 42, 42, 3)
INSERT [dbo].[COGIAY] ([ID], [IDSP], [Co], [SoLuong]) VALUES (161, 42, 43, 5)
INSERT [dbo].[COGIAY] ([ID], [IDSP], [Co], [SoLuong]) VALUES (162, 42, 44, 8)
INSERT [dbo].[COGIAY] ([ID], [IDSP], [Co], [SoLuong]) VALUES (163, 42, 45, 1)
INSERT [dbo].[COGIAY] ([ID], [IDSP], [Co], [SoLuong]) VALUES (164, 43, 35, 12)
INSERT [dbo].[COGIAY] ([ID], [IDSP], [Co], [SoLuong]) VALUES (165, 43, 36, 24)
INSERT [dbo].[COGIAY] ([ID], [IDSP], [Co], [SoLuong]) VALUES (166, 43, 37, 21)
INSERT [dbo].[COGIAY] ([ID], [IDSP], [Co], [SoLuong]) VALUES (167, 43, 38, 8)
INSERT [dbo].[COGIAY] ([ID], [IDSP], [Co], [SoLuong]) VALUES (168, 43, 40, 2)
INSERT [dbo].[COGIAY] ([ID], [IDSP], [Co], [SoLuong]) VALUES (169, 44, 35, 12)
INSERT [dbo].[COGIAY] ([ID], [IDSP], [Co], [SoLuong]) VALUES (170, 44, 36, 24)
INSERT [dbo].[COGIAY] ([ID], [IDSP], [Co], [SoLuong]) VALUES (171, 44, 37, 21)
INSERT [dbo].[COGIAY] ([ID], [IDSP], [Co], [SoLuong]) VALUES (172, 44, 38, 9)
INSERT [dbo].[COGIAY] ([ID], [IDSP], [Co], [SoLuong]) VALUES (173, 44, 40, 2)
INSERT [dbo].[COGIAY] ([ID], [IDSP], [Co], [SoLuong]) VALUES (174, 44, 41, 2)
INSERT [dbo].[COGIAY] ([ID], [IDSP], [Co], [SoLuong]) VALUES (175, 44, 42, 3)
INSERT [dbo].[COGIAY] ([ID], [IDSP], [Co], [SoLuong]) VALUES (176, 44, 43, 5)
INSERT [dbo].[COGIAY] ([ID], [IDSP], [Co], [SoLuong]) VALUES (177, 44, 44, 8)
INSERT [dbo].[COGIAY] ([ID], [IDSP], [Co], [SoLuong]) VALUES (178, 44, 45, 1)
INSERT [dbo].[COGIAY] ([ID], [IDSP], [Co], [SoLuong]) VALUES (179, 45, 40, 2)
INSERT [dbo].[COGIAY] ([ID], [IDSP], [Co], [SoLuong]) VALUES (180, 45, 41, 2)
INSERT [dbo].[COGIAY] ([ID], [IDSP], [Co], [SoLuong]) VALUES (181, 45, 42, 3)
INSERT [dbo].[COGIAY] ([ID], [IDSP], [Co], [SoLuong]) VALUES (182, 45, 43, 5)
INSERT [dbo].[COGIAY] ([ID], [IDSP], [Co], [SoLuong]) VALUES (183, 45, 44, 8)
INSERT [dbo].[COGIAY] ([ID], [IDSP], [Co], [SoLuong]) VALUES (184, 45, 45, 1)
INSERT [dbo].[COGIAY] ([ID], [IDSP], [Co], [SoLuong]) VALUES (185, 46, 40, 0)
INSERT [dbo].[COGIAY] ([ID], [IDSP], [Co], [SoLuong]) VALUES (186, 46, 41, 2)
INSERT [dbo].[COGIAY] ([ID], [IDSP], [Co], [SoLuong]) VALUES (187, 46, 42, 3)
INSERT [dbo].[COGIAY] ([ID], [IDSP], [Co], [SoLuong]) VALUES (188, 46, 43, 5)
INSERT [dbo].[COGIAY] ([ID], [IDSP], [Co], [SoLuong]) VALUES (189, 46, 44, 7)
INSERT [dbo].[COGIAY] ([ID], [IDSP], [Co], [SoLuong]) VALUES (190, 46, 45, 1)
INSERT [dbo].[COGIAY] ([ID], [IDSP], [Co], [SoLuong]) VALUES (191, 47, 40, 2)
INSERT [dbo].[COGIAY] ([ID], [IDSP], [Co], [SoLuong]) VALUES (192, 47, 41, 2)
INSERT [dbo].[COGIAY] ([ID], [IDSP], [Co], [SoLuong]) VALUES (193, 47, 42, 3)
INSERT [dbo].[COGIAY] ([ID], [IDSP], [Co], [SoLuong]) VALUES (194, 47, 43, 5)
INSERT [dbo].[COGIAY] ([ID], [IDSP], [Co], [SoLuong]) VALUES (195, 47, 44, 8)
INSERT [dbo].[COGIAY] ([ID], [IDSP], [Co], [SoLuong]) VALUES (196, 47, 45, 1)
INSERT [dbo].[COGIAY] ([ID], [IDSP], [Co], [SoLuong]) VALUES (197, 48, 40, 2)
INSERT [dbo].[COGIAY] ([ID], [IDSP], [Co], [SoLuong]) VALUES (198, 48, 41, 2)
INSERT [dbo].[COGIAY] ([ID], [IDSP], [Co], [SoLuong]) VALUES (199, 48, 42, 3)
GO
INSERT [dbo].[COGIAY] ([ID], [IDSP], [Co], [SoLuong]) VALUES (200, 48, 43, 5)
INSERT [dbo].[COGIAY] ([ID], [IDSP], [Co], [SoLuong]) VALUES (201, 48, 44, 8)
INSERT [dbo].[COGIAY] ([ID], [IDSP], [Co], [SoLuong]) VALUES (202, 48, 45, 1)
INSERT [dbo].[COGIAY] ([ID], [IDSP], [Co], [SoLuong]) VALUES (203, 49, 40, 2)
INSERT [dbo].[COGIAY] ([ID], [IDSP], [Co], [SoLuong]) VALUES (204, 49, 41, 2)
INSERT [dbo].[COGIAY] ([ID], [IDSP], [Co], [SoLuong]) VALUES (205, 49, 42, 3)
INSERT [dbo].[COGIAY] ([ID], [IDSP], [Co], [SoLuong]) VALUES (206, 49, 43, 5)
INSERT [dbo].[COGIAY] ([ID], [IDSP], [Co], [SoLuong]) VALUES (207, 49, 44, 8)
INSERT [dbo].[COGIAY] ([ID], [IDSP], [Co], [SoLuong]) VALUES (208, 49, 45, 1)
INSERT [dbo].[COGIAY] ([ID], [IDSP], [Co], [SoLuong]) VALUES (209, 50, 40, 1)
INSERT [dbo].[COGIAY] ([ID], [IDSP], [Co], [SoLuong]) VALUES (210, 50, 41, 2)
INSERT [dbo].[COGIAY] ([ID], [IDSP], [Co], [SoLuong]) VALUES (211, 50, 42, 3)
INSERT [dbo].[COGIAY] ([ID], [IDSP], [Co], [SoLuong]) VALUES (212, 50, 43, 5)
INSERT [dbo].[COGIAY] ([ID], [IDSP], [Co], [SoLuong]) VALUES (213, 50, 44, 8)
INSERT [dbo].[COGIAY] ([ID], [IDSP], [Co], [SoLuong]) VALUES (214, 50, 45, 1)
SET IDENTITY_INSERT [dbo].[COGIAY] OFF
GO
INSERT [dbo].[DANHGIASANPHAM] ([SanPhamId], [TaiKhoanId], [DanhGia]) VALUES (28, 1, 5)
INSERT [dbo].[DANHGIASANPHAM] ([SanPhamId], [TaiKhoanId], [DanhGia]) VALUES (29, 12, 2)
INSERT [dbo].[DANHGIASANPHAM] ([SanPhamId], [TaiKhoanId], [DanhGia]) VALUES (30, 1, 5)
INSERT [dbo].[DANHGIASANPHAM] ([SanPhamId], [TaiKhoanId], [DanhGia]) VALUES (32, 4, 5)
INSERT [dbo].[DANHGIASANPHAM] ([SanPhamId], [TaiKhoanId], [DanhGia]) VALUES (33, 1, 5)
INSERT [dbo].[DANHGIASANPHAM] ([SanPhamId], [TaiKhoanId], [DanhGia]) VALUES (42, 1, 4)
INSERT [dbo].[DANHGIASANPHAM] ([SanPhamId], [TaiKhoanId], [DanhGia]) VALUES (42, 4, 5)
INSERT [dbo].[DANHGIASANPHAM] ([SanPhamId], [TaiKhoanId], [DanhGia]) VALUES (43, 4, 5)
INSERT [dbo].[DANHGIASANPHAM] ([SanPhamId], [TaiKhoanId], [DanhGia]) VALUES (46, 1, 4)
INSERT [dbo].[DANHGIASANPHAM] ([SanPhamId], [TaiKhoanId], [DanhGia]) VALUES (46, 4, 1)
INSERT [dbo].[DANHGIASANPHAM] ([SanPhamId], [TaiKhoanId], [DanhGia]) VALUES (46, 12, 5)
INSERT [dbo].[DANHGIASANPHAM] ([SanPhamId], [TaiKhoanId], [DanhGia]) VALUES (47, 1, 3)
INSERT [dbo].[DANHGIASANPHAM] ([SanPhamId], [TaiKhoanId], [DanhGia]) VALUES (47, 4, 5)
INSERT [dbo].[DANHGIASANPHAM] ([SanPhamId], [TaiKhoanId], [DanhGia]) VALUES (47, 5, 4)
INSERT [dbo].[DANHGIASANPHAM] ([SanPhamId], [TaiKhoanId], [DanhGia]) VALUES (47, 6, 5)
INSERT [dbo].[DANHGIASANPHAM] ([SanPhamId], [TaiKhoanId], [DanhGia]) VALUES (47, 7, 5)
INSERT [dbo].[DANHGIASANPHAM] ([SanPhamId], [TaiKhoanId], [DanhGia]) VALUES (47, 11, 5)
INSERT [dbo].[DANHGIASANPHAM] ([SanPhamId], [TaiKhoanId], [DanhGia]) VALUES (47, 12, 1)
GO
SET IDENTITY_INSERT [dbo].[DANHMUCSANPHAM] ON 

INSERT [dbo].[DANHMUCSANPHAM] ([ID], [TenDanhMuc], [Metatitle], [IDCha], [NgayTao], [NguoiTao], [TrangThai]) VALUES (1, N'GIÀY NAM', N'giay-nam', 0, NULL, N'Đang cập nhật', 2)
INSERT [dbo].[DANHMUCSANPHAM] ([ID], [TenDanhMuc], [Metatitle], [IDCha], [NgayTao], [NguoiTao], [TrangThai]) VALUES (2, N'GIÀY NỮ', N'giay-nu', 0, NULL, N'Đang cập nhật', 2)
INSERT [dbo].[DANHMUCSANPHAM] ([ID], [TenDanhMuc], [Metatitle], [IDCha], [NgayTao], [NguoiTao], [TrangThai]) VALUES (4, N'GIÀY DA NAM', N'giay-da-nam', 1, NULL, N'Đang cập nhật', 2)
INSERT [dbo].[DANHMUCSANPHAM] ([ID], [TenDanhMuc], [Metatitle], [IDCha], [NgayTao], [NguoiTao], [TrangThai]) VALUES (5, N'GIÀY DA NỮ', N'giay-da-nu', 2, NULL, N'Đang cập nhật', 2)
INSERT [dbo].[DANHMUCSANPHAM] ([ID], [TenDanhMuc], [Metatitle], [IDCha], [NgayTao], [NguoiTao], [TrangThai]) VALUES (6, N'GIÀY THỂ THAO NAM', N'giay-the-thao-nam', 1, NULL, N'Đang cập nhật', 2)
INSERT [dbo].[DANHMUCSANPHAM] ([ID], [TenDanhMuc], [Metatitle], [IDCha], [NgayTao], [NguoiTao], [TrangThai]) VALUES (7, N'GIÀY THỂ THAO NỮ', N'giay-the-thao-nu', 2, NULL, N'Đang cập nhật', 2)
INSERT [dbo].[DANHMUCSANPHAM] ([ID], [TenDanhMuc], [Metatitle], [IDCha], [NgayTao], [NguoiTao], [TrangThai]) VALUES (8, N'GIÀY TRẺ EM', N'giay-tre-em', 0, NULL, N'Đang cập nhật', 2)
INSERT [dbo].[DANHMUCSANPHAM] ([ID], [TenDanhMuc], [Metatitle], [IDCha], [NgayTao], [NguoiTao], [TrangThai]) VALUES (9, N'GIÀY VẢI TRẺ EM', N'giay-vai-tre-em', 8, CAST(N'2016-05-13T22:31:29.003' AS DateTime), N'Đang cập nhật', 2)
INSERT [dbo].[DANHMUCSANPHAM] ([ID], [TenDanhMuc], [Metatitle], [IDCha], [NgayTao], [NguoiTao], [TrangThai]) VALUES (11, N'KHÁC', N'khac', 99999, CAST(N'2016-05-13T22:48:15.160' AS DateTime), N'Đang cập nhật', 2)
INSERT [dbo].[DANHMUCSANPHAM] ([ID], [TenDanhMuc], [Metatitle], [IDCha], [NgayTao], [NguoiTao], [TrangThai]) VALUES (14, N'GIÀY LƯỜI TRẺ EM', N'giay-luoi-tre-em', 8, CAST(N'2016-05-14T02:17:44.750' AS DateTime), N'Đang cập nhật', 2)
INSERT [dbo].[DANHMUCSANPHAM] ([ID], [TenDanhMuc], [Metatitle], [IDCha], [NgayTao], [NguoiTao], [TrangThai]) VALUES (16, N'TEST', N'TEST', 0, CAST(N'2016-05-28T00:28:17.117' AS DateTime), NULL, 0)
INSERT [dbo].[DANHMUCSANPHAM] ([ID], [TenDanhMuc], [Metatitle], [IDCha], [NgayTao], [NguoiTao], [TrangThai]) VALUES (17, N'Danh mục test', N'Danh-muc-test', 0, CAST(N'2016-05-30T10:33:27.267' AS DateTime), N'admin', 0)
INSERT [dbo].[DANHMUCSANPHAM] ([ID], [TenDanhMuc], [Metatitle], [IDCha], [NgayTao], [NguoiTao], [TrangThai]) VALUES (18, N'hi', N'hi', NULL, CAST(N'2021-04-03T12:07:48.650' AS DateTime), N'admin', 0)
SET IDENTITY_INSERT [dbo].[DANHMUCSANPHAM] OFF
GO
SET IDENTITY_INSERT [dbo].[DONHANG] ON 

INSERT [dbo].[DONHANG] ([ID], [NgayTao], [TenKhachHang], [DienThoaiKhachHang], [DiaChiKhachHang], [EmailKhachHang], [TrangThai], [TaiKhoanId]) VALUES (12, CAST(N'2016-05-28T23:42:31.967' AS DateTime), N'test 1 ', N'01245352652', N'Lào Cai', N'claskdj@gmail.com', -1, 1)
INSERT [dbo].[DONHANG] ([ID], [NgayTao], [TenKhachHang], [DienThoaiKhachHang], [DiaChiKhachHang], [EmailKhachHang], [TrangThai], [TaiKhoanId]) VALUES (15, CAST(N'2021-04-01T21:10:13.840' AS DateTime), N'Hữu Thành', N'123412', N'123123', N'thanhd17pm03@gmail.com', -1, 2)
INSERT [dbo].[DONHANG] ([ID], [NgayTao], [TenKhachHang], [DienThoaiKhachHang], [DiaChiKhachHang], [EmailKhachHang], [TrangThai], [TaiKhoanId]) VALUES (16, CAST(N'2021-02-01T00:00:00.000' AS DateTime), N'Hữu Thành', N'21312', N'3123123', N'12@dsd', -1, 3)
INSERT [dbo].[DONHANG] ([ID], [NgayTao], [TenKhachHang], [DienThoaiKhachHang], [DiaChiKhachHang], [EmailKhachHang], [TrangThai], [TaiKhoanId]) VALUES (18, CAST(N'2021-02-01T00:00:00.000' AS DateTime), N'Hữu Thành', N'2', N'12', N'thanhd17pm03@gmail.com', -1, 4)
INSERT [dbo].[DONHANG] ([ID], [NgayTao], [TenKhachHang], [DienThoaiKhachHang], [DiaChiKhachHang], [EmailKhachHang], [TrangThai], [TaiKhoanId]) VALUES (21, CAST(N'2021-02-01T00:00:00.000' AS DateTime), N'Hữu Thành', N'1', N'12', N'thanhd17pm03@gmail.com', -1, 5)
INSERT [dbo].[DONHANG] ([ID], [NgayTao], [TenKhachHang], [DienThoaiKhachHang], [DiaChiKhachHang], [EmailKhachHang], [TrangThai], [TaiKhoanId]) VALUES (22, CAST(N'2021-02-01T00:00:00.000' AS DateTime), N'Hữu Thành', N'123123', N'123123', N'thanhd17pm03@gmail.com', -1, 6)
INSERT [dbo].[DONHANG] ([ID], [NgayTao], [TenKhachHang], [DienThoaiKhachHang], [DiaChiKhachHang], [EmailKhachHang], [TrangThai], [TaiKhoanId]) VALUES (23, CAST(N'2021-02-01T00:00:00.000' AS DateTime), N'Hữu Thành', N'22', N'2', N'thanhd17pm03@gmail.com', 2, 7)
INSERT [dbo].[DONHANG] ([ID], [NgayTao], [TenKhachHang], [DienThoaiKhachHang], [DiaChiKhachHang], [EmailKhachHang], [TrangThai], [TaiKhoanId]) VALUES (25, CAST(N'2021-02-01T00:00:00.000' AS DateTime), N'Hữu Thành', N'0968927358', N'Thủ Dầu Một', N'thanhd17pm03@gmail.com', 2, 8)
INSERT [dbo].[DONHANG] ([ID], [NgayTao], [TenKhachHang], [DienThoaiKhachHang], [DiaChiKhachHang], [EmailKhachHang], [TrangThai], [TaiKhoanId]) VALUES (26, CAST(N'2021-02-01T00:00:00.000' AS DateTime), N'', N'', N'', N'', 0, 9)
INSERT [dbo].[DONHANG] ([ID], [NgayTao], [TenKhachHang], [DienThoaiKhachHang], [DiaChiKhachHang], [EmailKhachHang], [TrangThai], [TaiKhoanId]) VALUES (27, CAST(N'2021-02-01T00:00:00.000' AS DateTime), N'Bùi Hữu Thành', N'0968927358', N'Thủ Dầu Một', N'thanhd17pm03@gmail.com', 2, 10)
INSERT [dbo].[DONHANG] ([ID], [NgayTao], [TenKhachHang], [DienThoaiKhachHang], [DiaChiKhachHang], [EmailKhachHang], [TrangThai], [TaiKhoanId]) VALUES (28, CAST(N'2021-03-01T00:00:00.000' AS DateTime), N'Nguyễn Thị Ngọc Tuyết', N'096824846', N'Đường Hoàng Hoa Thám', N'gmail@gmail.com', 2, 11)
INSERT [dbo].[DONHANG] ([ID], [NgayTao], [TenKhachHang], [DienThoaiKhachHang], [DiaChiKhachHang], [EmailKhachHang], [TrangThai], [TaiKhoanId]) VALUES (29, CAST(N'2021-03-01T00:00:00.000' AS DateTime), N'Bùi Hữu Thành', N'1', N'Thủ Dầu Một', N'thanhd17pm03@gmail.com', 0, 12)
INSERT [dbo].[DONHANG] ([ID], [NgayTao], [TenKhachHang], [DienThoaiKhachHang], [DiaChiKhachHang], [EmailKhachHang], [TrangThai], [TaiKhoanId]) VALUES (30, CAST(N'2021-03-01T00:00:00.000' AS DateTime), N'Bùi Hữu Thành', N'1', N'Thủ Dầu Một', N'thanhd17pm03@gmail.com', 0, 12)
INSERT [dbo].[DONHANG] ([ID], [NgayTao], [TenKhachHang], [DienThoaiKhachHang], [DiaChiKhachHang], [EmailKhachHang], [TrangThai], [TaiKhoanId]) VALUES (31, CAST(N'2021-03-01T00:00:00.000' AS DateTime), N'Bùi Hữu Thành', N'1', N'Thủ Dầu Một', N'thanhd17pm03@gmail.com', 0, 1)
INSERT [dbo].[DONHANG] ([ID], [NgayTao], [TenKhachHang], [DienThoaiKhachHang], [DiaChiKhachHang], [EmailKhachHang], [TrangThai], [TaiKhoanId]) VALUES (32, CAST(N'2021-03-01T00:00:00.000' AS DateTime), N'Bùi Hữu Thành', N'1', N'Thủ Dầu Một', N'thanhd17pm03@gmail.com', 0, 1)
INSERT [dbo].[DONHANG] ([ID], [NgayTao], [TenKhachHang], [DienThoaiKhachHang], [DiaChiKhachHang], [EmailKhachHang], [TrangThai], [TaiKhoanId]) VALUES (33, CAST(N'2021-03-01T00:00:00.000' AS DateTime), N'Bùi Hữu Thành', N'1', N'Thủ Dầu Một', N'thanhd17pm03@gmail.com', 0, 1)
INSERT [dbo].[DONHANG] ([ID], [NgayTao], [TenKhachHang], [DienThoaiKhachHang], [DiaChiKhachHang], [EmailKhachHang], [TrangThai], [TaiKhoanId]) VALUES (34, CAST(N'2021-03-01T00:00:00.000' AS DateTime), N'Bùi Hữu Thành', N'1', N'Thủ Dầu Một', N'thanhd17pm03@gmail.com', 0, 1)
INSERT [dbo].[DONHANG] ([ID], [NgayTao], [TenKhachHang], [DienThoaiKhachHang], [DiaChiKhachHang], [EmailKhachHang], [TrangThai], [TaiKhoanId]) VALUES (35, CAST(N'2021-04-03T23:14:27.250' AS DateTime), N'Bùi Hữu Thành', N'2', N'Thủ Dầu Một', N'thanhd17pm03@gmail.com', 0, 2)
INSERT [dbo].[DONHANG] ([ID], [NgayTao], [TenKhachHang], [DienThoaiKhachHang], [DiaChiKhachHang], [EmailKhachHang], [TrangThai], [TaiKhoanId]) VALUES (36, CAST(N'2021-04-03T23:26:43.120' AS DateTime), N'Bùi Hữu Thành', N'1', N'Thủ Dầu Một', N'thanhd17pm03@gmail.com', 0, 2)
INSERT [dbo].[DONHANG] ([ID], [NgayTao], [TenKhachHang], [DienThoaiKhachHang], [DiaChiKhachHang], [EmailKhachHang], [TrangThai], [TaiKhoanId]) VALUES (37, CAST(N'2021-04-03T23:30:18.567' AS DateTime), N'Bùi Hữu Thành', N'1', N'Thủ Dầu Một', N'thanhd17pm03@gmail.com', 0, 2)
INSERT [dbo].[DONHANG] ([ID], [NgayTao], [TenKhachHang], [DienThoaiKhachHang], [DiaChiKhachHang], [EmailKhachHang], [TrangThai], [TaiKhoanId]) VALUES (38, CAST(N'2021-04-03T23:32:47.500' AS DateTime), N'Bùi Hữu Thành', N'1', N'Thủ Dầu Một', N'thanhd17pm03@gmail.com', 0, 3)
INSERT [dbo].[DONHANG] ([ID], [NgayTao], [TenKhachHang], [DienThoaiKhachHang], [DiaChiKhachHang], [EmailKhachHang], [TrangThai], [TaiKhoanId]) VALUES (39, CAST(N'2021-04-03T23:36:49.423' AS DateTime), N'Bùi Hữu Thành', N'1', N'Thủ Dầu Một', N'thanhd17pm03@gmail.com', 0, 4)
INSERT [dbo].[DONHANG] ([ID], [NgayTao], [TenKhachHang], [DienThoaiKhachHang], [DiaChiKhachHang], [EmailKhachHang], [TrangThai], [TaiKhoanId]) VALUES (40, CAST(N'2021-04-03T23:36:50.067' AS DateTime), N'Bùi Hữu Thành', N'1', N'Thủ Dầu Một', N'thanhd17pm03@gmail.com', 0, 3)
INSERT [dbo].[DONHANG] ([ID], [NgayTao], [TenKhachHang], [DienThoaiKhachHang], [DiaChiKhachHang], [EmailKhachHang], [TrangThai], [TaiKhoanId]) VALUES (41, CAST(N'2021-04-03T23:42:49.727' AS DateTime), N'Bùi Hữu Thành', N'1', N'Thủ Dầu Một', N'thanhd17pm03@gmail.com', 0, 5)
INSERT [dbo].[DONHANG] ([ID], [NgayTao], [TenKhachHang], [DienThoaiKhachHang], [DiaChiKhachHang], [EmailKhachHang], [TrangThai], [TaiKhoanId]) VALUES (42, CAST(N'2021-04-03T23:45:15.810' AS DateTime), N'Bùi Hữu Thành', N'1', N'Thủ Dầu Một', N'thanhd17pm03@gmail.com', 0, 6)
INSERT [dbo].[DONHANG] ([ID], [NgayTao], [TenKhachHang], [DienThoaiKhachHang], [DiaChiKhachHang], [EmailKhachHang], [TrangThai], [TaiKhoanId]) VALUES (43, CAST(N'2021-04-03T23:47:07.887' AS DateTime), N'Bùi Hữu Thành', N'1', N'Thủ Dầu Một', N'thanhd17pm03@gmail.com', 0, 7)
INSERT [dbo].[DONHANG] ([ID], [NgayTao], [TenKhachHang], [DienThoaiKhachHang], [DiaChiKhachHang], [EmailKhachHang], [TrangThai], [TaiKhoanId]) VALUES (44, CAST(N'2021-04-03T23:59:43.977' AS DateTime), N'Bùi Hữu Thành', N'1', N'Thủ Dầu Một', N'thanhd17pm03@gmail.com', 0, 4)
INSERT [dbo].[DONHANG] ([ID], [NgayTao], [TenKhachHang], [DienThoaiKhachHang], [DiaChiKhachHang], [EmailKhachHang], [TrangThai], [TaiKhoanId]) VALUES (45, CAST(N'2021-04-04T16:56:26.593' AS DateTime), N'Đào Mạnh Quân', N'22', N'222', N'testsendemailasp.netmvc@gmail.com', 0, 3)
INSERT [dbo].[DONHANG] ([ID], [NgayTao], [TenKhachHang], [DienThoaiKhachHang], [DiaChiKhachHang], [EmailKhachHang], [TrangThai], [TaiKhoanId]) VALUES (46, CAST(N'2021-04-04T18:29:54.093' AS DateTime), N'Hữu Thành', N'01679323265', N'Thủ Dầu Một', N'thanhd17pm03@gmail.com', 0, 7)
INSERT [dbo].[DONHANG] ([ID], [NgayTao], [TenKhachHang], [DienThoaiKhachHang], [DiaChiKhachHang], [EmailKhachHang], [TrangThai], [TaiKhoanId]) VALUES (47, CAST(N'2021-04-04T18:30:57.270' AS DateTime), N'abc', N'', N'abc', N'a@gmail.com', 0, 3)
INSERT [dbo].[DONHANG] ([ID], [NgayTao], [TenKhachHang], [DienThoaiKhachHang], [DiaChiKhachHang], [EmailKhachHang], [TrangThai], [TaiKhoanId]) VALUES (48, CAST(N'2021-04-11T22:17:29.757' AS DateTime), N'huuthanh', N'2323', N'd@gmail.com', N'd@gmail.com', 0, 1)
INSERT [dbo].[DONHANG] ([ID], [NgayTao], [TenKhachHang], [DienThoaiKhachHang], [DiaChiKhachHang], [EmailKhachHang], [TrangThai], [TaiKhoanId]) VALUES (49, CAST(N'2021-04-11T22:25:46.277' AS DateTime), N'Hữu Thành', N'01679323265', N'Thủ Dầu Một', N'thanhd17pm03@gmail.com', 0, 2)
INSERT [dbo].[DONHANG] ([ID], [NgayTao], [TenKhachHang], [DienThoaiKhachHang], [DiaChiKhachHang], [EmailKhachHang], [TrangThai], [TaiKhoanId]) VALUES (50, CAST(N'2021-04-12T10:25:08.280' AS DateTime), N'Hữu Thành', N'01679323265', N'Thủ Dầu Một', N'thanhd17pm03@gmail.com', 0, 7)
INSERT [dbo].[DONHANG] ([ID], [NgayTao], [TenKhachHang], [DienThoaiKhachHang], [DiaChiKhachHang], [EmailKhachHang], [TrangThai], [TaiKhoanId]) VALUES (51, CAST(N'2021-04-12T10:30:35.040' AS DateTime), N'Hữu Thành', N'01679323265', N'Thủ Dầu Một', N'thanhd17pm03@gmail.com', 0, 1)
INSERT [dbo].[DONHANG] ([ID], [NgayTao], [TenKhachHang], [DienThoaiKhachHang], [DiaChiKhachHang], [EmailKhachHang], [TrangThai], [TaiKhoanId]) VALUES (52, CAST(N'2021-04-12T10:51:06.967' AS DateTime), N'Hữu Thành', N'01679323265', N'Thủ Dầu Một', N'thanhd17pm03@gmail.com', 0, 2)
INSERT [dbo].[DONHANG] ([ID], [NgayTao], [TenKhachHang], [DienThoaiKhachHang], [DiaChiKhachHang], [EmailKhachHang], [TrangThai], [TaiKhoanId]) VALUES (53, CAST(N'2021-04-12T10:57:01.937' AS DateTime), N'Hữu Thành', N'01679323265', N'Thủ Dầu Một', N'thanhd17pm03@gmail.com', 0, 3)
INSERT [dbo].[DONHANG] ([ID], [NgayTao], [TenKhachHang], [DienThoaiKhachHang], [DiaChiKhachHang], [EmailKhachHang], [TrangThai], [TaiKhoanId]) VALUES (54, CAST(N'2021-04-12T11:07:44.520' AS DateTime), N'Hữu Thành', N'01679323265', N'Thủ Dầu Một', N'thanhd17pm03@gmail.com', 0, 1)
INSERT [dbo].[DONHANG] ([ID], [NgayTao], [TenKhachHang], [DienThoaiKhachHang], [DiaChiKhachHang], [EmailKhachHang], [TrangThai], [TaiKhoanId]) VALUES (55, CAST(N'2021-04-12T11:13:31.053' AS DateTime), N'Hữu Thành', N'01679323265', N'Thủ Dầu Một', N'thanhd17pm03@gmail.com', 1, 2)
INSERT [dbo].[DONHANG] ([ID], [NgayTao], [TenKhachHang], [DienThoaiKhachHang], [DiaChiKhachHang], [EmailKhachHang], [TrangThai], [TaiKhoanId]) VALUES (56, CAST(N'2021-04-12T11:15:58.330' AS DateTime), N'Hữu Thành', N'01679323265', N'Thủ Dầu Một', N'thanhd17pm03@gmail.com', -1, 5)
INSERT [dbo].[DONHANG] ([ID], [NgayTao], [TenKhachHang], [DienThoaiKhachHang], [DiaChiKhachHang], [EmailKhachHang], [TrangThai], [TaiKhoanId]) VALUES (57, CAST(N'2021-04-12T11:20:05.117' AS DateTime), N'Hữu Thành', N'01679323265', N'Thủ Dầu Một', N'thanhd17pm03@gmail.com', 2, 7)
INSERT [dbo].[DONHANG] ([ID], [NgayTao], [TenKhachHang], [DienThoaiKhachHang], [DiaChiKhachHang], [EmailKhachHang], [TrangThai], [TaiKhoanId]) VALUES (58, CAST(N'2021-04-18T00:05:33.667' AS DateTime), N'Bùi Hữu Thành', N'0968927358', N'Thủ Dầu Một', N'thanhd17pm03@gmail.com', 0, 6)
SET IDENTITY_INSERT [dbo].[DONHANG] OFF
GO
SET IDENTITY_INSERT [dbo].[HANG] ON 

INSERT [dbo].[HANG] ([ID], [TenHang], [ThongTinHang], [TrangThai]) VALUES (1, N'ADIDAS', N'Đang cập nhật', 2)
INSERT [dbo].[HANG] ([ID], [TenHang], [ThongTinHang], [TrangThai]) VALUES (2, N'CONVERSE', N'Đang cập nhật', 2)
INSERT [dbo].[HANG] ([ID], [TenHang], [ThongTinHang], [TrangThai]) VALUES (3, N'Nike', N'Đang cập nhật', 2)
INSERT [dbo].[HANG] ([ID], [TenHang], [ThongTinHang], [TrangThai]) VALUES (4, N'KHÁC', N'Đang cập nhật', 2)
SET IDENTITY_INSERT [dbo].[HANG] OFF
GO
SET IDENTITY_INSERT [dbo].[LIENHE] ON 

INSERT [dbo].[LIENHE] ([ID], [Name], [Phone], [Email], [Address], [Content], [DateCreate], [Status]) VALUES (7, N'Hữu Thành', N'0968927358', N'thanhd17pm03@gmail.com', N'59 D1 Phú Hòa, Thủ Dầu Một, Bình Dương', N'Test', CAST(N'2021-04-02T14:02:19.517' AS DateTime), 1)
INSERT [dbo].[LIENHE] ([ID], [Name], [Phone], [Email], [Address], [Content], [DateCreate], [Status]) VALUES (8, N'Spam', N'0968927359', N'thanhd17pm03@gmail.com', N'Thủ Dầu Một', N'spam', CAST(N'2021-04-03T12:11:58.607' AS DateTime), -1)
INSERT [dbo].[LIENHE] ([ID], [Name], [Phone], [Email], [Address], [Content], [DateCreate], [Status]) VALUES (9, N'Test', N'0968927358', N'thanhd17pm03@gmail.com', N'Thủ Dầu Một', N'Test', CAST(N'2021-04-16T20:10:55.327' AS DateTime), 0)
INSERT [dbo].[LIENHE] ([ID], [Name], [Phone], [Email], [Address], [Content], [DateCreate], [Status]) VALUES (10, N'Test', N'0968927358', N'thanhd17pm03@gmail.com', N'Thủ Dầu Một', N'Test', CAST(N'2021-04-16T20:12:00.463' AS DateTime), 0)
INSERT [dbo].[LIENHE] ([ID], [Name], [Phone], [Email], [Address], [Content], [DateCreate], [Status]) VALUES (11, N'Test', N'0968927358', N'thanhd17pm03@gmail.com', N'Thủ Dầu Một', N'Test', CAST(N'2021-04-16T20:13:49.273' AS DateTime), 0)
SET IDENTITY_INSERT [dbo].[LIENHE] OFF
GO
SET IDENTITY_INSERT [dbo].[MENU] ON 

INSERT [dbo].[MENU] ([ID], [Ten], [IDCha], [Link], [NgayTao], [NguoiTao], [TrangThai]) VALUES (1, N'Trang Chủ', 0, N'/', CAST(N'2016-05-29T16:26:24.107' AS DateTime), N'admin', 2)
INSERT [dbo].[MENU] ([ID], [Ten], [IDCha], [Link], [NgayTao], [NguoiTao], [TrangThai]) VALUES (2, N'Sản Phẩm Mới', 0, N'/Home/DanhSachTatCaSanPhamMoi', CAST(N'2016-05-29T16:26:57.510' AS DateTime), N'admin', 2)
INSERT [dbo].[MENU] ([ID], [Ten], [IDCha], [Link], [NgayTao], [NguoiTao], [TrangThai]) VALUES (3, N'Sản phẩm khuyến mại', 0, N'/Home/DanhSachTatCaSanPhamKhuyenMai', CAST(N'2016-05-29T16:27:08.417' AS DateTime), N'Đang cập nhật', 2)
INSERT [dbo].[MENU] ([ID], [Ten], [IDCha], [Link], [NgayTao], [NguoiTao], [TrangThai]) VALUES (4, N'Liên hệ', 0, N'/LienHe', CAST(N'2016-05-29T16:27:35.810' AS DateTime), N'admin', 2)
SET IDENTITY_INSERT [dbo].[MENU] OFF
GO
SET IDENTITY_INSERT [dbo].[SANPHAM] ON 

INSERT [dbo].[SANPHAM] ([ID], [TenSP], [Code], [Metatitle], [MoTaSP], [AnhDaiDien], [Gia], [GiaKhuyenMai], [ChiTietSP], [BaoHanh], [NgayTao], [NgaySuaDoi], [LuotXem], [TrangThai], [IDDanhMuc], [NguoiTao], [IDHang], [MauGiay], [DanhGia]) VALUES (1, N'GIÀY NAM HÀN QUỐC - T2C3', N'T2C3', N'GIÀY-NAM-HÀN-QUỐC-T2C3', N'Sản phẩm giày nam hàn quốc mới nhất!', N'/Data/images/Upload/sanpham/files/dd3d72_simg_70aaf2_700x700_maxb.jpg', CAST(350000 AS Decimal(18, 0)), NULL, N'Đang cập nhật', 12, CAST(N'2016-05-12T22:34:29.150' AS DateTime), NULL, 15, 0, 4, 1, 1, N'', NULL)
INSERT [dbo].[SANPHAM] ([ID], [TenSP], [Code], [Metatitle], [MoTaSP], [AnhDaiDien], [Gia], [GiaKhuyenMai], [ChiTietSP], [BaoHanh], [NgayTao], [NgaySuaDoi], [LuotXem], [TrangThai], [IDDanhMuc], [NguoiTao], [IDHang], [MauGiay], [DanhGia]) VALUES (2, N'Tăng cao 6.5cm: Giày tây nam không dây DA BÒ THẬT - Đen - VNG06<', N'VNG06', N'Tang-cao-6-5cm-Giay-tay-nam-khong-day-DA-BO-THDT-Den-VNG06-', N'Đang cập nhật', N'/Data/images/Upload/sanpham/files/6d3d6f_simg_70aaf2_700x700_maxb.jpg', CAST(800000 AS Decimal(18, 0)), CAST(460000 AS Decimal(18, 0)), N'Đang cập nhật', 12, CAST(N'2016-05-12T23:04:32.240' AS DateTime), NULL, 13, 0, 4, 1, 1, N'', NULL)
INSERT [dbo].[SANPHAM] ([ID], [TenSP], [Code], [Metatitle], [MoTaSP], [AnhDaiDien], [Gia], [GiaKhuyenMai], [ChiTietSP], [BaoHanh], [NgayTao], [NgaySuaDoi], [LuotXem], [TrangThai], [IDDanhMuc], [NguoiTao], [IDHang], [MauGiay], [DanhGia]) VALUES (3, N'GIÀY TÂY DA BÓNG TS007 - TS007', N'TS007', N'GIÀY-TDY-DA-BONG-TS007-TS007', N'Đang cập nhật', N'/Data/images/Upload/sanpham/files/d31d09_simg_70aaf2_700x700_maxb.jpg', CAST(430000 AS Decimal(18, 0)), NULL, N'Đang cập nhật', 12, CAST(N'2016-05-13T00:46:50.213' AS DateTime), NULL, 7, 0, 4, 1, 2, N'', NULL)
INSERT [dbo].[SANPHAM] ([ID], [TenSP], [Code], [Metatitle], [MoTaSP], [AnhDaiDien], [Gia], [GiaKhuyenMai], [ChiTietSP], [BaoHanh], [NgayTao], [NgaySuaDoi], [LuotXem], [TrangThai], [IDDanhMuc], [NguoiTao], [IDHang], [MauGiay], [DanhGia]) VALUES (5, N'Giày cao gót nữ quý phái sang trọng - 177 - Giày nữ - 96177', N'96177', N'Giay-cao-got-nu-quy-phai-sang-trong-177-Giay-nu-96177', N'Đang cập nhật', N'/Data/images/Upload/sanpham/files/d30c32_simg_70aaf2_700x700_maxb.jpg', CAST(630000 AS Decimal(18, 0)), CAST(297000 AS Decimal(18, 0)), N'Đang cập nhật', 1, CAST(N'2016-05-13T22:52:44.680' AS DateTime), NULL, 12, 0, 10, 1, 3, N'', NULL)
INSERT [dbo].[SANPHAM] ([ID], [TenSP], [Code], [Metatitle], [MoTaSP], [AnhDaiDien], [Gia], [GiaKhuyenMai], [ChiTietSP], [BaoHanh], [NgayTao], [NgaySuaDoi], [LuotXem], [TrangThai], [IDDanhMuc], [NguoiTao], [IDHang], [MauGiay], [DanhGia]) VALUES (6, N'Giày da lười công sở sang trọng, lịch lãm, đế tăng chiều cao 6,5cm - GL45.1', N'GL45.1', N'Giay-da-luoi-cong-so-sang-trong-lich-lam-de-tang-chieu-cao-6-5cm-GL45-1', N'Đang cập nhật', N'/Data/images/Upload/sanpham/files/bcf926_simg_70aaf2_700x700_maxb.jpg', CAST(1050000 AS Decimal(18, 0)), CAST(540000 AS Decimal(18, 0)), N'Đang cập nhật', 12, CAST(N'2016-05-13T22:57:40.703' AS DateTime), NULL, 33, 0, 4, 1, 3, N'', NULL)
INSERT [dbo].[SANPHAM] ([ID], [TenSP], [Code], [Metatitle], [MoTaSP], [AnhDaiDien], [Gia], [GiaKhuyenMai], [ChiTietSP], [BaoHanh], [NgayTao], [NgaySuaDoi], [LuotXem], [TrangThai], [IDDanhMuc], [NguoiTao], [IDHang], [MauGiay], [DanhGia]) VALUES (7, N'DA BÒ SAN MARCOS - Đen, nâu - VNG05', N'VNG05', N'DA-BO-SAN-MARCOS-Den-nau-VNG05', N'Đang cập nhật', N'/Data/images/Upload/sanpham/files/59ef34_simg_70aaf2_700x700_maxb.jpg', CAST(1500000 AS Decimal(18, 0)), CAST(640000 AS Decimal(18, 0)), N'Đang cập nhật', 12, CAST(N'2016-05-13T23:00:21.857' AS DateTime), NULL, 75, 2, 4, 1, 3, N'', NULL)
INSERT [dbo].[SANPHAM] ([ID], [TenSP], [Code], [Metatitle], [MoTaSP], [AnhDaiDien], [Gia], [GiaKhuyenMai], [ChiTietSP], [BaoHanh], [NgayTao], [NgaySuaDoi], [LuotXem], [TrangThai], [IDDanhMuc], [NguoiTao], [IDHang], [MauGiay], [DanhGia]) VALUES (8, N' Giày tây nam Zapas dáng xỏ - GT03 (Nâu)', N'GT03', N'-Giày-tay-nam-Zapas-dáng-xỏ-GT03-Nau-', N'<p>Sản phẩm gi&agrave;y chất lượng cao!</p>
', N'/Data/images/Upload/sanpham/files/Giay-tay-da-nam-dang-xo%20(1).png', CAST(450000 AS Decimal(18, 0)), CAST(350000 AS Decimal(18, 0)), N'<div>Giới thiệu sản phẩm Giày t&acirc;y nam Zapas dáng xỏ - GT03 (N&acirc;u)</div>

<p>GIỚI THI&Ecirc;̣U SẢN PH&Acirc;̉M GIÀY T&Acirc;Y Đ&Ecirc;́ PHÁP ZAPAS</p>

<p>&nbsp;</p>

<p><br />
Đ&ocirc;i gi&agrave;y l&agrave; phụ kiện thể hiện niềm đam m&ecirc; v&agrave; c&aacute; t&iacute;nh của người mang. Giày t&acirc;y da nam Zapas với thiết kế thời trang, năng động, trẻ trung ph&ugrave; hợp với mọi lứa tuổi sẽ l&agrave;m nổi bật l&ecirc;n c&aacute; t&iacute;nh, phong c&aacute;ch của bạn.</p>

<p><img alt="image" src="https://lh3.googleusercontent.com/B5lH5kkZ1C1cgz6MxRbbZg6W-_Cdb7DG7QwhLjF5BMptSHt1tixu_lvifzuqmmy9oLT7T4-jWAvCtccE8-mEaLaWRuEYRqL2x7Sv4WIPdaUpbOqXtx7Wj7zNqUivmiLlr9YYKii0CIm0ADhWPhpgjph-mo_2fD7znTSJjoh_8dEOTemqi6XlXn8ZvV5XMhjBBOLHYVEodDCR_y4N8Z7mAy3UdQgP9Sc3a-VcKiqSvaWAekT4JF4xRicFCKSmo-frKq_j77zhlZr8bfCjlSLgnruKIAfo-uvQJkMDEMwIA_CrpPDGGkWpjHzDQ_6ocfjGTt7RBJzHutD8kYnmA5cd30STGvn1Ke9U5Cm-EgQs_BUCKF1l4dMgbMmnxCifolV2oiOaLs0KisjuCXHzQ7MpVj_kYXsrvoAVwFLhrdN8xxS1UVWrynLeztjWVwdiDePpDOkTxTGi5hsFmLFEJxrbQn98iRv2Of2w1HHZP2KrQ0OGzFXeoznJ8BU4Dc0QEOKud5bYgonRN01_zWEMXDPjKPepZgkpxCN_d9R-DSFoOlL57gvc_r9A006R5Peu_jwTM2wm=s641-no" /></p>

<p>&nbsp;</p>

<p>- Nhiều m&agrave;u sắc, mẫu để lựa chọn l&agrave;m mới phong c&aacute;ch h&agrave;ng ng&agrave;y.<br />
- Kh&ocirc;ng chỉ phụ nữ, hiện nay, thời trang d&agrave;nh cho nam giới ng&agrave;y c&agrave;ng phong ph&uacute;, đa dạng v&agrave; được nhiều người quan t&acirc;m. Để thể hiện m&igrave;nh l&agrave; người lịch sự, c&aacute;c bạn nam đều phải để &yacute; để vẻ ngo&agrave;i của m&igrave;nh mỗi khi đi ra ngo&agrave;i. Đặc biệt, kết hợp trang phục với c&aacute; phụ kiện thời trang l&agrave; v&ocirc; c&ugrave;ng quan trong. Một đ&ocirc;i gi&agrave;y sẽ gi&uacute;p bạn thể hiện phong c&aacute;ch của ri&ecirc;ng m&igrave;nh. Gi&agrave;y t&acirc;y da nam Zapas l&agrave; sản phẩm đang được ph&aacute;i nam ưa chuộng.</p>

<p>&nbsp;</p>

<p><img alt="image" src="https://lh3.googleusercontent.com/1Wm7SyCTgSkR6qAvjUZG0b8PfsNyTPmW6OsLopG629hvuwsWNIhnwVcXTtqd8ZmxnEwlYZ8l_4vKwpJXbfBUNA_tBc9kufiKi2wk46uD22ndXYuZNCPOJjYfpfmm6cR_nbRLM7qOQOBLfRJtx0Hl3V_4ztzNpdLKuOnZbePOI9a9Vpk0IS00Q_quhIkxmVOKms3FbYLc_9JUBUelZYCp7GnFYUEqmVTGSA6XxCMdBCiHV_2Q_Yw491izPq23pX0beWWsmyzNWEMvlzjcYD7RIG7KeZ4ST2Jqzts1Rr-Y6ZXHnDoEJbZjJTxYZiYxsmMM5tthr_G1nap7zVGB_2P6nh3lbGK91lFOyfFKK8V1dBZgUg8VhGBmxYgv2vKqIasoTUDSSWCgJdzSNesD1OOQ-UTVQrr7mRcWIDHagn_BVJzShFkFmoMunwYjdFvJwQKPdaMgPU1tcq1gqaZ-rVggjjrMu8hOj8f3NwfgzwiVMogHV2h3RPZnUSvrnavEkahXstiZWjgD4042CXcf7l8rkp4SAx8RMhaQyeA-zPyzxdL8JeZFrLp15wo7GUC_LTPbwCPq=s641-no" /></p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>Đặc điểm nổi bật của sản phẩm<br />
- Chất liệu bền đẹp: Được l&agrave;m từ chất liệu t&ocirc;̉ng hợp ch&acirc;́t lượng cao, giày t&acirc;y da nam d&acirc;y lu&ocirc;n mềm mại v&agrave; bền chắc. Do đ&oacute;, bạn sẽ dễ d&agrave;ng bảo quản v&agrave; vệ sinh.</p>

<p><img alt="image" src="https://lh3.googleusercontent.com/_aZ7RmxADDD4BDQhFPrU6syOvA44ZwlUdk5ecUGeoQnGCvflY_Z9yyHB3DK--PX2fEbOd7E8wlG_yysitFnsAK155V8KrShodxYz8UfxYNuAY01p54xP3R4bZH-iAqHSsKEhNq9x7v5efXvsqSqAZasZBEQf1EFYVSiTRWu2KCY0bO0Xna2J2tDn5IZsQPSkx9gbu7A0AG6k1hZPuaxGgi9uh35SMYjyiQYIhh0cAEgjxkMBSfXQivsn9qn4hgOQ9q0lVWOIjWhVZ14PW8ABGFMDV1nsnqGdQDKMswZoGTfdLNPcTKDhcdBBBVzkqAAXIlveFiGf0-k5Pcm1GK0iRZuRQP29DpxCeAp6HVGeGvBz38a5tE29-9ikvrcXfeZ2LoiHGY_2wI_Xs1j59DSdGcKRVqOaf2YevP5KdJn1W0zz4A7mZ9DrzP54LmHM1c-sDN_ncDoZXWdpQjh2E2pD8AVwvIw-ksfc4YRjcTgJniKsz1KbuVRAkirlnaBHRGxJDoNFJQPcr-84U7vnZaNTfYpCVNzruYIRMs7_giXLdUE2mnZtzu5pOo8C-apMtl6va0Jd=s641-no" /></p>

<p>- Thiết kế trẻ trung: Giày t&acirc;y da nam Zapas được thiết kế trẻ trung, kiểu d&aacute;ng h&igrave;nh chữ nhật ngang kết hợp tinh tế giữa n&eacute;t cổ điển v&agrave; hiện đại, tạo n&ecirc;n sự h&agrave;i h&ograve;a tuyệt đối l&agrave;m bạn kh&oacute; c&oacute; thể từ chối được.</p>

<p><img alt="image" src="https://lh3.googleusercontent.com/1YIHSGbXilThChUoYpJTowa28ptlXa_XoKOJ_vPfyiYMHZX26WEZVKTOKlLQ_KbH78BghDkzEk5zrwnSrB1asg2QFIHTTbmBKOHWDONhhzmVR_DTcAsTOnaBSR1_6klyU8evyJ_0Bw4Ro6P3wjorvKjo23NxMGrXI58ddy-pJnpx0pfWyG47LrZeNUwVm_3uVMjidStCXDnGkO2tm3ht2q3HzUxXT3cXy7bws1xKgCmPo1ZwccQWOj-p8vCymJPgAa4oAk2slncjMTQLELuAlcbsVUKa2FyvaMaW3cQkCQ_9LP1SmjouE5ei-E9qDzgfp59Q3YeJcx8j4N4kBexr4yS7SuXUmz_F6hhSvGDK_nb1sNj4oG1nAOGwMLFgYFMyNTilXBTiLQoV1wk6I1gznBZJVokSnyPSVVctGQt4NU72joh_VNVRyriQ0Wa2V40ACTf2BBtPhxGT35QE6a4UpfIYTVOLkikpZtQVj0lIVkOEvjf9YQCOksispaJc7tOM7ZYY_rhDCe61Tf0-AddpORl19Xre0RwAaEqs9z7o58kZ_BU530lizLcIdfGEzj2tr-r7=s641-no" /></p>

<p>- Đường may tỉ mỉ chắc chắn: Với đường may tỉ mỉ v&agrave; tinh tế đảm bảo độ bền chắc trong suốt thời gian bạn sử dụng, giày nam sẽ mang đến cho bạn vẻ đẹp thật c&aacute; t&iacute;nh v&agrave; lịch l&atilde;m.</p>

<p><img alt="image" src="https://lh3.googleusercontent.com/krHSHDiA-NNiA2PTX0hD44RZ9WcM7YAW-SLj1CvhzkH0AvUOcJRvSDBaI8ARRz19L1iR9xGYgtftkLqwG-NDJcf06WhM01nebTyAE5z8W6StBJgO47rCOdyf5t5Ggo7OKb8s5ML41AgIKry2DQEHd5AzPQZ7t3iRctBiPVGREWTf5HR2akciEnCjJhx60Eqf2ekPtkszCHEHNeS-RxxI-1f4oLtdVcPWtUm4quEICJsy0Bvt7IcICH7YvXehWtv6FQ7EETuYUeCRoTy18FSY9X4L3ZZ5GsjjWqdJGkOaNmpsHYLMbtlPe-Cir6Q-uOhq8rpL9f7tNyLYl5Ig7dji0hVuKcWJjAHo-qwA7M3J2XMVKgsg-0aSUINShZFyMMRVLO0V1gWeCbQ0AVImo599C7O6qEpn_3zZ3credOzcywEb74KaB5NBaUCVwIkoN7fv5LfcYz5P7Wc3AhfzPNYFs0W0NHM__dI9pRuaJVcLvCXaYOE1ijPZhJgW6UUM3hAac2LsvmeHZFgJbrTOmJGIIqS8ubJYievJObKRaytcpCj3FHYxtT78vraWdpQu4km6evDl=s641-no" /></p>

<p>- Dễ phối trang phục: Sản phẩm với gam m&agrave;u truy&ecirc;̀n th&ocirc;́ng, kh&ocirc;ng chỉ gi&uacute;p bạn thể hiện phong c&aacute;ch thời trang cực kỳ nam t&iacute;nh v&agrave; lịch l&atilde;m m&agrave; c&ograve;n gi&uacute;p dễ d&agrave;ng khi ph&ocirc;́i c&ugrave;ng nhiều trang phục như: quần jean, &aacute;o thun hay phụ kiện kh&aacute;c để trở n&ecirc;n thật cá tính và thời trang.</p>

<p><img alt="image" src="https://lh3.googleusercontent.com/TC-0tSvVaKGbZzNaqSLABmmwy70fdtfhU5Ai5P3SmzpNu70lK_tO5omMI27Y2hwYdcIogTO4_qYZAw7fOUJ5LVZhMdqAGTMo9K4Pxt9STzRGE-eZLWu27ZA4VbcX5Jni8O2yXDj7VwOCpJFyPdAhuTads5MZHCPjKu9wDZoQoTyGD9XvgFRxcfZmASx7cxsE_83rDjmv5l86uPFPpeSP-flbAvaPllIzW0aWSs2XKDO218E6FDVtp4uAgjaPYn9Iu7YydpmUHbSspwkZzSAblZzI31488zdy9V6hwyN9Q-UT-vPOuv-N_3bW6Vjw47S-d9SukQ_-4T-hLhKKcb5kLjEP06-6UnEoNY2vYzl_JSlqJ3VKAkWhSLjzsNbiAfS0dcFj7cCHNEkuMJLWuXe8pEgftg9w5AkCYAqrmbFj0MqxC7LYfBxRu3rfaslmIjQXVbxAxsR9r0Y8WkHloBRfhlMMR9lBpIgMq4lIFUhFKbmgr7pBBskTXfHCTeqhQh062hq_lFUtoIe-k9ZNKtCs6roj9ATfXonSH66MF2kUf-lPW8EdY7OQ6lRo1VcpHwtPk4v6=s641-no" /></p>
', 12, CAST(N'2016-05-14T04:42:39.550' AS DateTime), CAST(N'2016-05-27T22:27:25.250' AS DateTime), 31, 0, 4, 1, 4, N'', NULL)
INSERT [dbo].[SANPHAM] ([ID], [TenSP], [Code], [Metatitle], [MoTaSP], [AnhDaiDien], [Gia], [GiaKhuyenMai], [ChiTietSP], [BaoHanh], [NgayTao], [NgaySuaDoi], [LuotXem], [TrangThai], [IDDanhMuc], [NguoiTao], [IDHang], [MauGiay], [DanhGia]) VALUES (9, N'SNEAKER 2021', N'GU001', N'Giay-Luoi-GU001', N'<ul>
	<li>Sản xuất tại Việt Nam</li>
	<li>Chất liệu cao su co gi&atilde;n thoải m&aacute;i</li>
	<li>Loại gi&agrave;y thẻ thao nam</li>
	<li>Bảo h&agrave;nh 4 th&aacute;ng (bằng phiếu bảo h&agrave;nh)</li>
</ul>
', N'/Data/images/Upload/sanpham/files/avatar.jpg', CAST(840000 AS Decimal(18, 0)), NULL, N'<p>Đang cập nhật</p>
', 4, CAST(N'2016-05-14T04:58:29.140' AS DateTime), CAST(N'2021-04-03T13:42:12.530' AS DateTime), 58, 0, 4, 1, 1, N'/Data/images/Upload/sanpham/files/update%20giay%20nam/ee96443e95df7a93ad8f003bf1987e3c.png', NULL)
INSERT [dbo].[SANPHAM] ([ID], [TenSP], [Code], [Metatitle], [MoTaSP], [AnhDaiDien], [Gia], [GiaKhuyenMai], [ChiTietSP], [BaoHanh], [NgayTao], [NgaySuaDoi], [LuotXem], [TrangThai], [IDDanhMuc], [NguoiTao], [IDHang], [MauGiay], [DanhGia]) VALUES (10, N'SNEAKER 2020', N'giaynam', N'Giay-Sneakers-Vai-Sporty', N'<p>Cập nhật phong c&aacute;ch đường phố năng động v&agrave; trẻ trung c&ugrave;ng gi&agrave;y sneakers từ thương hiệu ZALORA. Chất liệu vải mềm nhẹ, tạo cảm gi&aacute;c thoải m&aacute;i trong từng bước ch&acirc;n.<br />
<br />
- Chất liệu vải<br />
- Mũi gi&agrave;y tr&ograve;n<br />
- Thiết kế thắt d&acirc;y<br />
- Mặt l&oacute;t in t&ecirc;n thương hiệu</p>
', N'/Data/images/Upload/sanpham/files/update%20giay%20nam/6f3dfc282486212115a4e6e77aa216db.jpg', CAST(549000 AS Decimal(18, 0)), NULL, N'<table>
	<tbody>
		<tr>
			<td>SKU (simple)</td>
			<td>AABUOZZ0000089GS</td>
		</tr>
		<tr>
			<td>Chất liệu mặt tr&ecirc;n</td>
			<td>Vải</td>
		</tr>
		<tr>
			<td>Chất liệu mặt trong</td>
			<td>Cao su</td>
		</tr>
		<tr>
			<td>Chất liệu đế</td>
			<td>Cao su</td>
		</tr>
		<tr>
			<td>M&agrave;u sắc</td>
			<td>X&aacute;m</td>
		</tr>
	</tbody>
</table>
', 4, CAST(N'2016-05-14T05:48:39.550' AS DateTime), CAST(N'2021-04-03T13:24:52.717' AS DateTime), 284, 0, 6, 1, 1, N'/Data/images/Upload/sanpham/files/update%20giay%20nam/6f3dfc282486212115a4e6e77aa216db.jpg', NULL)
INSERT [dbo].[SANPHAM] ([ID], [TenSP], [Code], [Metatitle], [MoTaSP], [AnhDaiDien], [Gia], [GiaKhuyenMai], [ChiTietSP], [BaoHanh], [NgayTao], [NgaySuaDoi], [LuotXem], [TrangThai], [IDDanhMuc], [NguoiTao], [IDHang], [MauGiay], [DanhGia]) VALUES (11, N'Tesst sp 1', N'SP23', N'Tesst-sp-1', N'<p>Teen</p>
', N'/Data/images/Upload/sanpham/files/d30c32_simg_70aaf2_700x700_maxb.jpg', CAST(30000 AS Decimal(18, 0)), NULL, N'<p>12345</p>
', 2, CAST(N'2021-03-26T00:36:17.647' AS DateTime), CAST(N'2021-03-26T01:25:26.237' AS DateTime), 2, 0, 4, 1, 1, N'', NULL)
INSERT [dbo].[SANPHAM] ([ID], [TenSP], [Code], [Metatitle], [MoTaSP], [AnhDaiDien], [Gia], [GiaKhuyenMai], [ChiTietSP], [BaoHanh], [NgayTao], [NgaySuaDoi], [LuotXem], [TrangThai], [IDDanhMuc], [NguoiTao], [IDHang], [MauGiay], [DanhGia]) VALUES (12, N'Tesst', N'1213', N'Tesst', N'<p>123123</p>
', N'/Data/images/Upload/sanpham/files/59ef34_simg_70aaf2_700x700_maxb.jpg', CAST(12321 AS Decimal(18, 0)), CAST(3123 AS Decimal(18, 0)), N'<p>1232132</p>
', 2, CAST(N'2021-03-29T20:31:37.987' AS DateTime), CAST(N'2021-03-29T20:40:12.117' AS DateTime), 1, 2, 4, 1, 1, N'/Data/images/Upload/sanpham/files/59ef34_simg_70aaf2_700x700_maxb.jpg,/Data/images/Upload/sanpham/files/bcf926_simg_70aaf2_700x700_maxb.jpg,/Data/images/Upload/sanpham/files/6d3d6f_simg_70aaf2_700x700_maxb.jpg,/Data/images/Upload/sanpham/files/d30c32_simg_70aaf2_700x700_maxb.jpg', NULL)
INSERT [dbo].[SANPHAM] ([ID], [TenSP], [Code], [Metatitle], [MoTaSP], [AnhDaiDien], [Gia], [GiaKhuyenMai], [ChiTietSP], [BaoHanh], [NgayTao], [NgaySuaDoi], [LuotXem], [TrangThai], [IDDanhMuc], [NguoiTao], [IDHang], [MauGiay], [DanhGia]) VALUES (15, N'123', N'123', N'123', N'<p>123</p>
', N'/Data/images/Upload/sanpham/files/165141749_493166821682721_7967703932325426017_n.jpg', CAST(16123123 AS Decimal(18, 0)), CAST(23 AS Decimal(18, 0)), N'<p>123</p>
', 1, CAST(N'2021-04-02T10:23:47.270' AS DateTime), NULL, 2, 0, 5, 1, 2, N'/Data/images/Upload/sanpham/files/165141749_493166821682721_7967703932325426017_n.jpg', NULL)
INSERT [dbo].[SANPHAM] ([ID], [TenSP], [Code], [Metatitle], [MoTaSP], [AnhDaiDien], [Gia], [GiaKhuyenMai], [ChiTietSP], [BaoHanh], [NgayTao], [NgaySuaDoi], [LuotXem], [TrangThai], [IDDanhMuc], [NguoiTao], [IDHang], [MauGiay], [DanhGia]) VALUES (16, N'Giày Nike Air Jordan 1 Low', N'2', N'Giay-Nike-Air-Jordan-1-Low', N'<p>123</p>
', N'/Data/images/Upload/sanpham/files/z2109440081992_fb2336d0962f09e8d456a6099dd2a4a1.jpg', CAST(800 AS Decimal(18, 0)), CAST(680 AS Decimal(18, 0)), N'<p>test</p>
', 2, CAST(N'2021-04-02T10:45:16.180' AS DateTime), NULL, 2, 0, 6, 4, 4, N'/Data/images/Upload/sanpham/files/z2109440081992_fb2336d0962f09e8d456a6099dd2a4a1.jpg,/Data/images/Upload/sanpham/files/Nhung-hinh-anh-moi-nhat-cua-Air-Jordan-1-Retro.jpg,/Data/images/Upload/sanpham/files/images.jpg,/Data/images/Upload/sanpham/files/images.jpg', NULL)
INSERT [dbo].[SANPHAM] ([ID], [TenSP], [Code], [Metatitle], [MoTaSP], [AnhDaiDien], [Gia], [GiaKhuyenMai], [ChiTietSP], [BaoHanh], [NgayTao], [NgaySuaDoi], [LuotXem], [TrangThai], [IDDanhMuc], [NguoiTao], [IDHang], [MauGiay], [DanhGia]) VALUES (17, N'BASAS BUMPER GUM - LOW TOP - OFFWHITE/GUM', N'giayvai', N'BASAS-BUMPER-GUM-LOW-TOP-OFFWHITE-GUM', N'<p>Sự kết hợp giữa những t&ocirc;ng m&agrave;u cơ bản, dễ ứng dụng của d&ograve;ng gi&agrave;y Basas v&agrave; điểm nhấn m&agrave;u Gum ở phần bumber đ&atilde; mang đến cho &quot;Basas Bumber Gum&quot; Pack c&aacute;i nh&igrave;n ph&aacute; c&aacute;ch v&agrave; thu h&uacute;t. Đ&acirc;y ch&iacute;nh l&agrave; đ&ocirc;i gi&agrave;y d&agrave;nh cho những ai t&igrave;m kiếm sự mới mẻ từ những điều quen thuộc, truyền thống.</p>
', N'/Data/images/Upload/sanpham/files/giay%20vai/pro_basas_A61073_4.jpg', CAST(700000 AS Decimal(18, 0)), NULL, N'<p>Sự kết hợp giữa những t&ocirc;ng m&agrave;u cơ bản, dễ ứng dụng của d&ograve;ng gi&agrave;y Basas v&agrave; điểm nhấn m&agrave;u Gum ở phần bumber đ&atilde; mang đến cho &quot;Basas Bumber Gum&quot; Pack c&aacute;i nh&igrave;n ph&aacute; c&aacute;ch v&agrave; thu h&uacute;t. Đ&acirc;y ch&iacute;nh l&agrave; đ&ocirc;i gi&agrave;y d&agrave;nh cho những ai t&igrave;m kiếm sự mới mẻ từ những điều quen thuộc, truyền thống.</p>
', 2, CAST(N'2021-04-02T10:53:51.873' AS DateTime), CAST(N'2021-04-03T13:49:23.093' AS DateTime), 3, 2, 4, 1, 1, N'/Data/images/Upload/sanpham/files/giay%20vai/pro_basas_A61073_4.jpg,/Data/images/Upload/sanpham/files/giay%20vai/pro_basas_A61073_3.jpg,/Data/images/Upload/sanpham/files/giay%20vai/pro_basas_A61073_2.jpg,/Data/images/Upload/sanpham/files/giay%20vai/pro_basas_A61073_1.jpg,/Data/images/Upload/sanpham/files/giay%20vai/pro_basas_A61073_1.jpg', NULL)
INSERT [dbo].[SANPHAM] ([ID], [TenSP], [Code], [Metatitle], [MoTaSP], [AnhDaiDien], [Gia], [GiaKhuyenMai], [ChiTietSP], [BaoHanh], [NgayTao], [NgaySuaDoi], [LuotXem], [TrangThai], [IDDanhMuc], [NguoiTao], [IDHang], [MauGiay], [DanhGia]) VALUES (18, N'VINTAS MISTER - LOW TOP - NARCISSUEDE', N'A61039', N'VINTAS-MISTER-LOW-TOP-NARCISSUEDE', N'<p>D&aacute;ng Low Top truyền thống, kết hợp c&ugrave;ng phối m&agrave;u gợi n&eacute;t cổ điển, xưa cũ với chất liệu da Suede. Một sự lựa chọn của những ai muốn l&agrave;m nổi bật l&ecirc;n sự ch&iacute;n chắn, t&iacute;nh điềm đạm c&ugrave;ng n&eacute;t lịch thiệp cho bộ outfit của m&igrave;nh.</p>
', N'/Data/images/Upload/sanpham/files/giay%20vai/pro_vintas_A61039_2.jpg', CAST(600000 AS Decimal(18, 0)), CAST(580000 AS Decimal(18, 0)), N'<p>D&aacute;ng Low Top truyền thống, kết hợp c&ugrave;ng phối m&agrave;u gợi n&eacute;t cổ điển, xưa cũ với chất liệu da Suede. Một sự lựa chọn của những ai muốn l&agrave;m nổi bật l&ecirc;n sự ch&iacute;n chắn, t&iacute;nh điềm đạm c&ugrave;ng n&eacute;t lịch thiệp cho bộ outfit của m&igrave;nh.</p>
', 2, CAST(N'2021-04-02T10:56:49.020' AS DateTime), CAST(N'2021-04-03T13:46:31.280' AS DateTime), 4, 2, 4, 1, 1, N'/Data/images/Upload/sanpham/files/giay%20vai/pro_vintas_A61039_1.jpg,/Data/images/Upload/sanpham/files/giay%20vai/pro_vintas_A61039_2.jpg,/Data/images/Upload/sanpham/files/giay%20vai/pro_vintas_A61039_5.jpg,/Data/images/Upload/sanpham/files/giay%20vai/pro_vintas_A61039_4.jpg,/Data/images/Upload/sanpham/files/giay%20vai/pro_vintas_A61039_3.jpg,/Data/images/Upload/sanpham/files/giay%20vai/pro_vintas_A61039_3.jpg', NULL)
INSERT [dbo].[SANPHAM] ([ID], [TenSP], [Code], [Metatitle], [MoTaSP], [AnhDaiDien], [Gia], [GiaKhuyenMai], [ChiTietSP], [BaoHanh], [NgayTao], [NgaySuaDoi], [LuotXem], [TrangThai], [IDDanhMuc], [NguoiTao], [IDHang], [MauGiay], [DanhGia]) VALUES (19, N'MLB Bigball Chunky Monogram LT New York Yankees, Giày Sneaker Nam Nữ – Trắng', N'mlb', N'MLB-Bigball-Chunky-Monogram-LT-New-York-Yankees-Giay-Sneaker-Nam-Nu-Trang', N'<p>Đang cập nhật..</p>
', N'/Data/images/Upload/sanpham/files/giay%20nu/MLB-Bigball-Chunky-Monogram-LT-New-York-Yankees-10.jpg', CAST(1050000 AS Decimal(18, 0)), CAST(970000 AS Decimal(18, 0)), N'<p>Đang cập nhật..</p>
', 2, CAST(N'2021-04-02T12:25:15.517' AS DateTime), NULL, 2, 2, 7, 1, 4, N'/Data/images/Upload/sanpham/files/giay%20nu/MLB-Bigball-Chunky-Monogram-LT-New-York-Yankees-1.jpg,/Data/images/Upload/sanpham/files/giay%20nu/MLB-Bigball-Chunky-Monogram-LT-New-York-Yankees-6-SS.jpg,/Data/images/Upload/sanpham/files/giay%20nu/MLB-Bigball-Chunky-Monogram-LT-New-York-Yankees-8.jpg,/Data/images/Upload/sanpham/files/giay%20nu/MLB-Bigball-Chunky-Monogram-LT-New-York-Yankees-8.jpg', NULL)
INSERT [dbo].[SANPHAM] ([ID], [TenSP], [Code], [Metatitle], [MoTaSP], [AnhDaiDien], [Gia], [GiaKhuyenMai], [ChiTietSP], [BaoHanh], [NgayTao], [NgaySuaDoi], [LuotXem], [TrangThai], [IDDanhMuc], [NguoiTao], [IDHang], [MauGiay], [DanhGia]) VALUES (20, N'Converse Chuck Taylor All Star High Top Optical White (Classic)', N'giaynu', N'Converse-Chuck-Taylor-All-Star-High-Top-Optical-White-Classic-', N'<p>Đang cập nhật..</p>
', N'/Data/images/Upload/sanpham/files/giay%20nu/cv-classic-tr%E1%BA%AFng-c%E1%BB%95-cao-ch%E1%BB%A5p-b%C3%AAn.jpg', CAST(850000 AS Decimal(18, 0)), CAST(550000 AS Decimal(18, 0)), N'<p>Đang cập nhật..</p>
', 2, CAST(N'2021-04-02T12:28:07.907' AS DateTime), NULL, 1, 2, 7, 1, 2, N'/Data/images/Upload/sanpham/files/giay%20nu/1-16.jpg,/Data/images/Upload/sanpham/files/giay%20nu/cv-classic-tr%E1%BA%AFng-c%E1%BB%95-cao-ch%E1%BB%A5p-b%C3%AAn.jpg,/Data/images/Upload/sanpham/files/giay%20nu/cv-classic-tr%E1%BA%AFng-c%E1%BB%95-cao-ch%E1%BB%A5p-g%C3%B3t.jpg,/Data/images/Upload/sanpham/files/giay%20nu/cv-classic-tr%E1%BA%AFng-c%E1%BB%95-cao-ch%E1%BB%A5p-g%E1%BA%A7n%20(1).jpg,/Data/images/Upload/sanpham/files/giay%20nu/cv-classic-tr%E1%BA%AFng-c%E1%BB%95-cao-ch%E1%BB%A5p-g%E1%BA%A7n%20(1).jpg', NULL)
INSERT [dbo].[SANPHAM] ([ID], [TenSP], [Code], [Metatitle], [MoTaSP], [AnhDaiDien], [Gia], [GiaKhuyenMai], [ChiTietSP], [BaoHanh], [NgayTao], [NgaySuaDoi], [LuotXem], [TrangThai], [IDDanhMuc], [NguoiTao], [IDHang], [MauGiay], [DanhGia]) VALUES (21, N'Addias Prophere Grey Solar Red', N'giaynu', N'Addias-Prophere-Grey-Solar-Red', N'<h1>Đang cập nhật..</h1>
', N'/Data/images/Upload/sanpham/files/giay%20nu/IMG_2217-1-20.jpg', CAST(1050000 AS Decimal(18, 0)), CAST(980000 AS Decimal(18, 0)), N'<p>Đang cập nhật..</p>
', 2, CAST(N'2021-04-02T12:29:49.513' AS DateTime), NULL, 0, 2, 7, 1, 1, N'/Data/images/Upload/sanpham/files/giay%20nu/IMG_2217-1-18.jpg,/Data/images/Upload/sanpham/files/giay%20nu/IMG_2217-1-20.jpg,/Data/images/Upload/sanpham/files/giay%20nu/IMG_2212.jpg,/Data/images/Upload/sanpham/files/giay%20nu/IMG_2211-2.jpg,/Data/images/Upload/sanpham/files/giay%20nu/IMG_2211-2.jpg', NULL)
INSERT [dbo].[SANPHAM] ([ID], [TenSP], [Code], [Metatitle], [MoTaSP], [AnhDaiDien], [Gia], [GiaKhuyenMai], [ChiTietSP], [BaoHanh], [NgayTao], [NgaySuaDoi], [LuotXem], [TrangThai], [IDDanhMuc], [NguoiTao], [IDHang], [MauGiay], [DanhGia]) VALUES (22, N'Puma BTS Court Star White Black', N'giaynu', N'Puma-BTS-Court-Star-White-Black', N'<p>Đang cập nhật...</p>
', N'/Data/images/Upload/sanpham/files/giay%20nu/court-star-bts-s%E1%BB%8Dc-%C4%91en-full-h%E1%BB%99p.jpg', CAST(820000 AS Decimal(18, 0)), CAST(714000 AS Decimal(18, 0)), N'<h1>Đang cập nhật..</h1>
', 2, CAST(N'2021-04-02T12:31:43.170' AS DateTime), NULL, 2, 2, 7, 1, 4, N'/Data/images/Upload/sanpham/files/giay%20nu/11-e1561626237502.jpg,/Data/images/Upload/sanpham/files/giay%20nu/court-star-bts-s%E1%BB%8Dc-h%E1%BB%93ng-ch%E1%BB%A5p-g%E1%BA%A7n.jpg,/Data/images/Upload/sanpham/files/giay%20nu/court-star-bts-s%E1%BB%8Dc-%C4%91en-full-h%E1%BB%99p.jpg,/Data/images/Upload/sanpham/files/giay%20nu/court-star-bts-s%E1%BB%8Dc-%C4%91en-full-h%E1%BB%99p.jpg', NULL)
INSERT [dbo].[SANPHAM] ([ID], [TenSP], [Code], [Metatitle], [MoTaSP], [AnhDaiDien], [Gia], [GiaKhuyenMai], [ChiTietSP], [BaoHanh], [NgayTao], [NgaySuaDoi], [LuotXem], [TrangThai], [IDDanhMuc], [NguoiTao], [IDHang], [MauGiay], [DanhGia]) VALUES (23, N'Vans Style 36 Sunflower', N'giaynu', N'Vans-Style-36-Sunflower', N'<p>Đang cập nhật...</p>
', N'/Data/images/Upload/sanpham/files/giay%20nu/4-20.jpg', CAST(530000 AS Decimal(18, 0)), NULL, N'<p>Đang cập nhật...</p>
', 2, CAST(N'2021-04-02T12:34:31.447' AS DateTime), NULL, 0, 2, 7, 1, 4, N'/Data/images/Upload/sanpham/files/giay%20nu/1-8.jpg,/Data/images/Upload/sanpham/files/giay%20nu/4-20%20(1).jpg,/Data/images/Upload/sanpham/files/giay%20nu/4-20%20(1).jpg', NULL)
INSERT [dbo].[SANPHAM] ([ID], [TenSP], [Code], [Metatitle], [MoTaSP], [AnhDaiDien], [Gia], [GiaKhuyenMai], [ChiTietSP], [BaoHanh], [NgayTao], [NgaySuaDoi], [LuotXem], [TrangThai], [IDDanhMuc], [NguoiTao], [IDHang], [MauGiay], [DanhGia]) VALUES (24, N'Giày Boot Gót Phối Kim Loại', N'giaynu', N'Giày-Boot-Got-Phoi-Kim-Loai', N'<ul>
	<li>M&atilde; sản phẩm:&nbsp;BO07017</li>
	<li>Kiểu d&aacute;ng:&nbsp;Gi&agrave;y boot</li>
	<li>Chất liệu:&nbsp;Da tổng hợp</li>
	<li>Độ cao:&nbsp;7cm</li>
	<li>M&agrave;u sắc:&nbsp;Kem-Đen-X&aacute;m</li>
	<li>K&iacute;ch cỡ:&nbsp;35-36-37-38-39</li>
	<li>Xuất xứ:&nbsp;Việt Nam</li>
	<li>Gi&aacute; đ&atilde; bao gồm VAT</li>
</ul>
', N'/Data/images/Upload/sanpham/files/giay%20nu/xam_bo07017_5_2ff649df98bb45eebda6408083a6bc18_master.jpg', CAST(1700000 AS Decimal(18, 0)), CAST(1400000 AS Decimal(18, 0)), N'<ul>
	<li>M&atilde; sản phẩm:&nbsp;BO07017</li>
	<li>Kiểu d&aacute;ng:&nbsp;Gi&agrave;y boot</li>
	<li>Chất liệu:&nbsp;Da tổng hợp</li>
	<li>Độ cao:&nbsp;7cm</li>
	<li>M&agrave;u sắc:&nbsp;Kem-Đen-X&aacute;m</li>
	<li>K&iacute;ch cỡ:&nbsp;35-36-37-38-39</li>
	<li>Xuất xứ:&nbsp;Việt Nam</li>
	<li>Gi&aacute; đ&atilde; bao gồm VAT</li>
</ul>
', 2, CAST(N'2021-04-02T12:39:43.740' AS DateTime), NULL, 1, 2, 5, 1, 4, N'/Data/images/Upload/sanpham/files/giay%20nu/xam_bo07017_2_709c6bb65eda4e8a916d878895e27cf9_master.jpg,/Data/images/Upload/sanpham/files/giay%20nu/xam_bo07017_5_2ff649df98bb45eebda6408083a6bc18_master.jpg,/Data/images/Upload/sanpham/files/giay%20nu/xam_bo07017_8_69d1a15d4321420796c6a1ff6310c46a_master.jpg,/Data/images/Upload/sanpham/files/giay%20nu/xam_bo07017_8_69d1a15d4321420796c6a1ff6310c46a_master.jpg', NULL)
INSERT [dbo].[SANPHAM] ([ID], [TenSP], [Code], [Metatitle], [MoTaSP], [AnhDaiDien], [Gia], [GiaKhuyenMai], [ChiTietSP], [BaoHanh], [NgayTao], [NgaySuaDoi], [LuotXem], [TrangThai], [IDDanhMuc], [NguoiTao], [IDHang], [MauGiay], [DanhGia]) VALUES (25, N'GIÀY BOOT CỔ THẤP NỮ YORYNC ĐẾ CAO GIÀY DÉP NỮ CHẤT LIỆU DA BÒ G05.', N'giaynu', N'GIÀY-BOOT-CỔ-THDP-NỮ-YORYNC-DE-CAO-GIÀY-DEP-NỮ-CHDT-LIEU-DA-BO-G05-', N'<p>đang cập nhật.</p>
', N'/Data/images/Upload/sanpham/files/giay%20nu/11755870998_811261893.jpg', CAST(1840000 AS Decimal(18, 0)), NULL, N'<p>đang cập nhật.</p>
', 2, CAST(N'2021-04-02T12:45:55.140' AS DateTime), NULL, 2, 2, 5, 1, 4, N'/Data/images/Upload/sanpham/files/giay%20nu/11755870998_811261893.jpg,/Data/images/Upload/sanpham/files/giay%20nu/11755873761_811261893.jpg,/Data/images/Upload/sanpham/files/giay%20nu/11755885676_811261893.jpg,/Data/images/Upload/sanpham/files/giay%20nu/11787467177_811261893.jpg,/Data/images/Upload/sanpham/files/giay%20nu/11787467177_811261893.jpg', NULL)
INSERT [dbo].[SANPHAM] ([ID], [TenSP], [Code], [Metatitle], [MoTaSP], [AnhDaiDien], [Gia], [GiaKhuyenMai], [ChiTietSP], [BaoHanh], [NgayTao], [NgaySuaDoi], [LuotXem], [TrangThai], [IDDanhMuc], [NguoiTao], [IDHang], [MauGiay], [DanhGia]) VALUES (26, N'Adidas YZ700', N'giaynam', N'Adidas-YZ700', N'<p>đang cập nhật.</p>
', N'/Data/images/Upload/sanpham/files/giaynam/fde89880f1f603a85ae7.jpg', CAST(750000 AS Decimal(18, 0)), CAST(700000 AS Decimal(18, 0)), N'<p>đang cập nhật.</p>
', 2, CAST(N'2021-04-02T12:54:23.467' AS DateTime), NULL, 3, 0, 6, 1, 1, N'/Data/images/Upload/sanpham/files/giaynam/0014a261cb1739496006.jpg,/Data/images/Upload/sanpham/files/giaynam/5f864ff42682d4dc8d93.jpg,/Data/images/Upload/sanpham/files/giaynam/fde89880f1f603a85ae7.jpg,/Data/images/Upload/sanpham/files/giaynam/fde89880f1f603a85ae7.jpg', NULL)
INSERT [dbo].[SANPHAM] ([ID], [TenSP], [Code], [Metatitle], [MoTaSP], [AnhDaiDien], [Gia], [GiaKhuyenMai], [ChiTietSP], [BaoHanh], [NgayTao], [NgaySuaDoi], [LuotXem], [TrangThai], [IDDanhMuc], [NguoiTao], [IDHang], [MauGiay], [DanhGia]) VALUES (27, N'Nike AF1 full trắng', N'giaynam', N'Nike-AF1-full-trang', N'<p>đang cập nhật.</p>
', N'/Data/images/Upload/sanpham/files/giaynam/4a7a398e6bf399adc0e2.jpg', CAST(620000 AS Decimal(18, 0)), CAST(560000 AS Decimal(18, 0)), N'<p>đang cập nhật.</p>
', 2, CAST(N'2021-04-02T12:56:11.523' AS DateTime), NULL, 1, 2, 6, 1, 3, N'/Data/images/Upload/sanpham/files/giaynam/0e5ebe93ecee1eb047ff.jpg,/Data/images/Upload/sanpham/files/giaynam/22cf363d6440961ecf51.jpg,/Data/images/Upload/sanpham/files/giaynam/4a7a398e6bf399adc0e2.jpg,/Data/images/Upload/sanpham/files/giaynam/45a6a65cf421067f5f30.jpg,/Data/images/Upload/sanpham/files/giaynam/6275518403f9f1a7a8e8.jpg,/Data/images/Upload/sanpham/files/giaynam/7d07e2ffb08242dc1b93.jpg,/Data/images/Upload/sanpham/files/giaynam/c3c0763b2446d6188f57.jpg,/Data/images/Upload/sanpham/files/giaynam/d28f38416a3c9862c12d.jpg,/Data/images/Upload/sanpham/files/giaynam/d28f38416a3c9862c12d.jpg', NULL)
INSERT [dbo].[SANPHAM] ([ID], [TenSP], [Code], [Metatitle], [MoTaSP], [AnhDaiDien], [Gia], [GiaKhuyenMai], [ChiTietSP], [BaoHanh], [NgayTao], [NgaySuaDoi], [LuotXem], [TrangThai], [IDDanhMuc], [NguoiTao], [IDHang], [MauGiay], [DanhGia]) VALUES (28, N'GIẦY MCQ', N'giaynam', N'GIDY-MCQ', N'<p>đang cập nhật.</p>
', N'/Data/images/Upload/sanpham/files/giaynam/8ce1b5222f5fdd01844e.jpg', CAST(620000 AS Decimal(18, 0)), CAST(600000 AS Decimal(18, 0)), N'<p>đang cập nhật.</p>
', 2, CAST(N'2021-04-02T12:57:28.180' AS DateTime), NULL, 3, 2, 6, 1, 1, N'/Data/images/Upload/sanpham/files/giaynam/3f913a4aa03752690b26.jpg,/Data/images/Upload/sanpham/files/giaynam/792527e7bd9a4fc4168b.jpg,/Data/images/Upload/sanpham/files/giaynam/9c7720b4bac9489711d8.jpg,/Data/images/Upload/sanpham/files/giaynam/8ce1b5222f5fdd01844e.jpg,/Data/images/Upload/sanpham/files/giaynam/e94991950be8f9b6a0f9.jpg,/Data/images/Upload/sanpham/files/giaynam/e94991950be8f9b6a0f9.jpg', 5)
INSERT [dbo].[SANPHAM] ([ID], [TenSP], [Code], [Metatitle], [MoTaSP], [AnhDaiDien], [Gia], [GiaKhuyenMai], [ChiTietSP], [BaoHanh], [NgayTao], [NgaySuaDoi], [LuotXem], [TrangThai], [IDDanhMuc], [NguoiTao], [IDHang], [MauGiay], [DanhGia]) VALUES (29, N'BALENCIAGA', N'giaynam', N'BALENCIAGA', N'<p>đang cập nhật.</p>
', N'/Data/images/Upload/sanpham/files/giaynam/515c57c258b3aaedf3a2.jpg', CAST(1500000 AS Decimal(18, 0)), NULL, N'<p>đang cập nhật.</p>
', 2, CAST(N'2021-04-02T12:59:38.740' AS DateTime), NULL, 4, 2, 6, 1, 4, N'/Data/images/Upload/sanpham/files/giaynam/515c57c258b3aaedf3a2.jpg,/Data/images/Upload/sanpham/files/giaynam/4e15b188bef94ca715e8.jpg,/Data/images/Upload/sanpham/files/giaynam/8f7c0ae30592f7ccae83.jpg,/Data/images/Upload/sanpham/files/giaynam/b9cd1f251054e20abb45.jpg,/Data/images/Upload/sanpham/files/giaynam/a79c6d7662079059c916.jpg,/Data/images/Upload/sanpham/files/giaynam/e758a5b2aac3589d01d2.jpg,/Data/images/Upload/sanpham/files/giaynam/e758a5b2aac3589d01d2.jpg', 2)
INSERT [dbo].[SANPHAM] ([ID], [TenSP], [Code], [Metatitle], [MoTaSP], [AnhDaiDien], [Gia], [GiaKhuyenMai], [ChiTietSP], [BaoHanh], [NgayTao], [NgaySuaDoi], [LuotXem], [TrangThai], [IDDanhMuc], [NguoiTao], [IDHang], [MauGiay], [DanhGia]) VALUES (30, N'MLB LA', N'giaynam', N'MLB-LA', N'<p>đang cập nhật.</p>
', N'/Data/images/Upload/sanpham/files/giaynam/b767db3f6c499e17c758.jpg', CAST(870000 AS Decimal(18, 0)), NULL, N'<p>đang cập nhật.</p>
', 2, CAST(N'2021-04-02T13:02:30.980' AS DateTime), NULL, 3, 2, 6, 1, 4, N'/Data/images/Upload/sanpham/files/giaynam/48cc1db56abb98e5c1aa.jpg,/Data/images/Upload/sanpham/files/giaynam/6275518403f9f1a7a8e8.jpg,/Data/images/Upload/sanpham/files/giaynam/b767db3f6c499e17c758(1).jpg,/Data/images/Upload/sanpham/files/giaynam/a4c543bb34b5c6eb9fa4.jpg,/Data/images/Upload/sanpham/files/giaynam/bf808efcf9f20bac52e3.jpg,/Data/images/Upload/sanpham/files/giaynam/f3746e0c1902eb5cb213.jpg,/Data/images/Upload/sanpham/files/giaynam/f3746e0c1902eb5cb213.jpg', 5)
INSERT [dbo].[SANPHAM] ([ID], [TenSP], [Code], [Metatitle], [MoTaSP], [AnhDaiDien], [Gia], [GiaKhuyenMai], [ChiTietSP], [BaoHanh], [NgayTao], [NgaySuaDoi], [LuotXem], [TrangThai], [IDDanhMuc], [NguoiTao], [IDHang], [MauGiay], [DanhGia]) VALUES (31, N'Giày Trẻ Em ', N'giaytreem', N'Giay-Tre-Em-', N'<p>Đang cập nhật...</p>
', N'/Data/images/Upload/sanpham/files/giay%20tre%20em/166599238_2776492495937396_8086879201304820840_n.jpg', CAST(350000 AS Decimal(18, 0)), CAST(320000 AS Decimal(18, 0)), N'<p>Đang cập nhật...</p>
', 2, CAST(N'2021-04-02T13:10:41.517' AS DateTime), NULL, 2, 2, 9, 1, 4, N'/Data/images/Upload/sanpham/files/giay%20tre%20em/167012723_2776492489270730_5941952201005961500_n.jpg,/Data/images/Upload/sanpham/files/giay%20tre%20em/166599238_2776492495937396_8086879201304820840_n.jpg,/Data/images/Upload/sanpham/files/giay%20tre%20em/166599238_2776492495937396_8086879201304820840_n.jpg', NULL)
INSERT [dbo].[SANPHAM] ([ID], [TenSP], [Code], [Metatitle], [MoTaSP], [AnhDaiDien], [Gia], [GiaKhuyenMai], [ChiTietSP], [BaoHanh], [NgayTao], [NgaySuaDoi], [LuotXem], [TrangThai], [IDDanhMuc], [NguoiTao], [IDHang], [MauGiay], [DanhGia]) VALUES (32, N'GIÀY LƯỜI TUẦN LỘC ĐỎ CHO BÉ TRAI, BÉ GÁI', N'giaytreem', N'GIÀY-LƯỜI-TUDN-LỘC-DO-CHO-BE-TRAI-BE-GÁI', N'<p>đang cập nhật..</p>
', N'/Data/images/Upload/sanpham/files/giay%20tre%20em/03-1-2.png', CAST(270000 AS Decimal(18, 0)), CAST(230000 AS Decimal(18, 0)), N'<p>đang cập nhật..</p>
', 2, CAST(N'2021-04-02T13:12:58.900' AS DateTime), NULL, 9, 2, 14, 1, 4, N'/Data/images/Upload/sanpham/files/giay%20tre%20em/03-1-2.png,/Data/images/Upload/sanpham/files/giay%20tre%20em/03-3.png,/Data/images/Upload/sanpham/files/giay%20tre%20em/03-3.png', 5)
INSERT [dbo].[SANPHAM] ([ID], [TenSP], [Code], [Metatitle], [MoTaSP], [AnhDaiDien], [Gia], [GiaKhuyenMai], [ChiTietSP], [BaoHanh], [NgayTao], [NgaySuaDoi], [LuotXem], [TrangThai], [IDDanhMuc], [NguoiTao], [IDHang], [MauGiay], [DanhGia]) VALUES (33, N' GIÀY THỂ THAO V829 XANH CHO BÉ', N'giaytreem', N'-GIÀY-THE-THAO-V829-XANH-CHO-BE', N'<p>đang cập nhật.</p>
', N'/Data/images/Upload/sanpham/files/giay%20tre%20em/30_12-12.png', CAST(270000 AS Decimal(18, 0)), CAST(210000 AS Decimal(18, 0)), N'<p>đang cập nhật.</p>
', 2, CAST(N'2021-04-02T13:14:42.550' AS DateTime), NULL, 3, 2, 9, 1, 4, N'/Data/images/Upload/sanpham/files/giay%20tre%20em/30_12-12.png,/Data/images/Upload/sanpham/files/giay%20tre%20em/30_12-16-1.png,/Data/images/Upload/sanpham/files/giay%20tre%20em/30_12-17.png,/Data/images/Upload/sanpham/files/giay%20tre%20em/giay-be-trai-guci-phong-cach-ca-tinh-mau-trang-do-p22000-300x300.jpg,/Data/images/Upload/sanpham/files/giay%20tre%20em/V829-xanh-1.jpg,/Data/images/Upload/sanpham/files/giay%20tre%20em/V829-xanh-1.jpg', NULL)
INSERT [dbo].[SANPHAM] ([ID], [TenSP], [Code], [Metatitle], [MoTaSP], [AnhDaiDien], [Gia], [GiaKhuyenMai], [ChiTietSP], [BaoHanh], [NgayTao], [NgaySuaDoi], [LuotXem], [TrangThai], [IDDanhMuc], [NguoiTao], [IDHang], [MauGiay], [DanhGia]) VALUES (34, N'GIÀY LƯỜI LÁ CÂY CHO BÉ – GIÀY TẬP ĐI, GIÀY LƯỜI BÉ TRAI, BÉ GÁI', N'giaytreem', N'GIÀY-LƯỜI-LÁ-CDY-CHO-BE-GIÀY-TDP-DI-GIÀY-LƯỜI-BE-TRAI-BE-GÁI', N'<p>đang cập nhật.</p>
', N'/Data/images/Upload/sanpham/files/giay%20tre%20em/31-12-8.png', CAST(230000 AS Decimal(18, 0)), NULL, N'<p>đang cập nhật.</p>
', 2, CAST(N'2021-04-02T13:15:59.147' AS DateTime), NULL, 0, 2, 14, 1, 4, N'/Data/images/Upload/sanpham/files/giay%20tre%20em/31-12-8.png,/Data/images/Upload/sanpham/files/giay%20tre%20em/31-12-7.png,/Data/images/Upload/sanpham/files/giay%20tre%20em/31-12-7.png', NULL)
INSERT [dbo].[SANPHAM] ([ID], [TenSP], [Code], [Metatitle], [MoTaSP], [AnhDaiDien], [Gia], [GiaKhuyenMai], [ChiTietSP], [BaoHanh], [NgayTao], [NgaySuaDoi], [LuotXem], [TrangThai], [IDDanhMuc], [NguoiTao], [IDHang], [MauGiay], [DanhGia]) VALUES (35, N'GIÀY LƯỜI MÁY ẢNH – GIÀY TẬP ĐI, GIÀY LƯỜI BÉ TRAI, BÉ GÁI 1-5 TUỔI', N'giaytreem', N'GIÀY-LƯỜI-MÁY-ẢNH-GIÀY-TDP-DI-GIÀY-LƯỜI-BE-TRAI-BE-GÁI-1-5-TUỔI', N'<p>đang cập nhật.</p>
', N'/Data/images/Upload/sanpham/files/giay%20tre%20em/10-01-2020-9.png', CAST(210000 AS Decimal(18, 0)), NULL, N'<p>đang cập nhật.</p>
', 2, CAST(N'2021-04-02T13:17:40.863' AS DateTime), NULL, 0, 2, 14, 1, 4, N'/Data/images/Upload/sanpham/files/giay%20tre%20em/10-01-2020-10.png,/Data/images/Upload/sanpham/files/giay%20tre%20em/10-01-2020-8.png,/Data/images/Upload/sanpham/files/giay%20tre%20em/10-01-2020-9.png,/Data/images/Upload/sanpham/files/giay%20tre%20em/10-01-2020-9.png', NULL)
INSERT [dbo].[SANPHAM] ([ID], [TenSP], [Code], [Metatitle], [MoTaSP], [AnhDaiDien], [Gia], [GiaKhuyenMai], [ChiTietSP], [BaoHanh], [NgayTao], [NgaySuaDoi], [LuotXem], [TrangThai], [IDDanhMuc], [NguoiTao], [IDHang], [MauGiay], [DanhGia]) VALUES (36, N'GIÀY LƯỜI TRẮNG TÀU MŨI ĐEN – GIÀY TẬP ĐI, GIÀY LƯỜI BÉ TRAI, BÉ GÁI', N'giaytreem', N'GIÀY-LƯỜI-TRDNG-TÀU-MŨI-DEN-GIÀY-TDP-DI-GIÀY-LƯỜI-BE-TRAI-BE-GÁI', N'<p>đang cập nhật.</p>
', N'/Data/images/Upload/sanpham/files/giay%20tre%20em/31-12-12.png', CAST(190000 AS Decimal(18, 0)), NULL, N'<p>đang cập nhật.</p>
', 2, CAST(N'2021-04-02T13:18:47.240' AS DateTime), NULL, 0, 2, 14, 1, 4, N'/Data/images/Upload/sanpham/files/giay%20tre%20em/31-12-12.png', NULL)
INSERT [dbo].[SANPHAM] ([ID], [TenSP], [Code], [Metatitle], [MoTaSP], [AnhDaiDien], [Gia], [GiaKhuyenMai], [ChiTietSP], [BaoHanh], [NgayTao], [NgaySuaDoi], [LuotXem], [TrangThai], [IDDanhMuc], [NguoiTao], [IDHang], [MauGiay], [DanhGia]) VALUES (37, N' GIÀY SLIPON V670 NÂU CHO BÉ', N'giaytreem', N'-GIÀY-SLIPON-V670-NDU-CHO-BE', N'<p>đang cập nhật.</p>
', N'/Data/images/Upload/sanpham/files/giay%20tre%20em/26-5.jpg', CAST(250000 AS Decimal(18, 0)), NULL, N'<p>đang cập nhật.</p>
', 2, CAST(N'2021-04-02T13:20:12.103' AS DateTime), NULL, 0, 2, 14, 1, 4, N'/Data/images/Upload/sanpham/files/giay%20tre%20em/26-5.jpg,/Data/images/Upload/sanpham/files/giay%20tre%20em/30_12-0-600x480-1.png,/Data/images/Upload/sanpham/files/giay%20tre%20em/30_12-16-1.png,/Data/images/Upload/sanpham/files/giay%20tre%20em/30_12-5.png,/Data/images/Upload/sanpham/files/giay%20tre%20em/30_12-2.png,/Data/images/Upload/sanpham/files/giay%20tre%20em/30_12-2.png', NULL)
INSERT [dbo].[SANPHAM] ([ID], [TenSP], [Code], [Metatitle], [MoTaSP], [AnhDaiDien], [Gia], [GiaKhuyenMai], [ChiTietSP], [BaoHanh], [NgayTao], [NgaySuaDoi], [LuotXem], [TrangThai], [IDDanhMuc], [NguoiTao], [IDHang], [MauGiay], [DanhGia]) VALUES (38, N'GIÀY SLIPON C05 TRẮNG CHO BÉ', N'giaytreem', N'GIÀY-SLIPON-C05-TRDNG-CHO-BE', N'<p>đang cập nhật</p>
', N'/Data/images/Upload/sanpham/files/giay%20tre%20em/30_12-22.png', CAST(280000 AS Decimal(18, 0)), NULL, N'<p>đang cập nhật</p>
', 2, CAST(N'2021-04-02T13:23:54.497' AS DateTime), NULL, 3, 2, 9, 1, 4, N'/Data/images/Upload/sanpham/files/giay%20tre%20em/30_12-22.png,/Data/images/Upload/sanpham/files/giay%20tre%20em/30_12-23.png,/Data/images/Upload/sanpham/files/giay%20tre%20em/30_12-25.png,/Data/images/Upload/sanpham/files/giay%20tre%20em/30_12-26.png,/Data/images/Upload/sanpham/files/giay%20tre%20em/30_12-26.png', NULL)
INSERT [dbo].[SANPHAM] ([ID], [TenSP], [Code], [Metatitle], [MoTaSP], [AnhDaiDien], [Gia], [GiaKhuyenMai], [ChiTietSP], [BaoHanh], [NgayTao], [NgaySuaDoi], [LuotXem], [TrangThai], [IDDanhMuc], [NguoiTao], [IDHang], [MauGiay], [DanhGia]) VALUES (39, N'GIÀY THỂ THAO CA998 CAM CHO BÉ', N'giaytreem', N'GIÀY-THE-THAO-CA998-CAM-CHO-BE', N'<p>đang cập nhật</p>
', N'/Data/images/Upload/sanpham/files/giay%20tre%20em/24-3.jpg', CAST(190000 AS Decimal(18, 0)), NULL, N'<h1>GI&Agrave;Y THỂ THAO CA998 CAM CHO B&Eacute;</h1>
', 2, CAST(N'2021-04-02T13:26:09.477' AS DateTime), NULL, 3, 2, 9, 1, 1, N'/Data/images/Upload/sanpham/files/giay%20tre%20em/24-3.jpg,/Data/images/Upload/sanpham/files/giay%20tre%20em/24-4.jpg,/Data/images/Upload/sanpham/files/giay%20tre%20em/24-4.jpg', NULL)
INSERT [dbo].[SANPHAM] ([ID], [TenSP], [Code], [Metatitle], [MoTaSP], [AnhDaiDien], [Gia], [GiaKhuyenMai], [ChiTietSP], [BaoHanh], [NgayTao], [NgaySuaDoi], [LuotXem], [TrangThai], [IDDanhMuc], [NguoiTao], [IDHang], [MauGiay], [DanhGia]) VALUES (40, N'GIÀY THỂ THAO 1909 TRẮNG CHO BÉ', N'giaytreem', N'GIÀY-THE-THAO-1909-TRDNG-CHO-BE', N'<p>đang cập nhật..</p>
', N'/Data/images/Upload/sanpham/files/giay%20tre%20em/1909-tr%E1%BA%AFng-1.jpg', CAST(180000 AS Decimal(18, 0)), NULL, N'<p>đang cập nhật..</p>
', 2, CAST(N'2021-04-02T13:27:43.313' AS DateTime), NULL, 1, 2, 9, 1, 4, N'/Data/images/Upload/sanpham/files/giay%20tre%20em/1909-tr%E1%BA%AFng-2.jpg,/Data/images/Upload/sanpham/files/giay%20tre%20em/1909-tr%E1%BA%AFng-1.jpg,/Data/images/Upload/sanpham/files/giay%20tre%20em/1909-tr%E1%BA%AFng-1.jpg', NULL)
INSERT [dbo].[SANPHAM] ([ID], [TenSP], [Code], [Metatitle], [MoTaSP], [AnhDaiDien], [Gia], [GiaKhuyenMai], [ChiTietSP], [BaoHanh], [NgayTao], [NgaySuaDoi], [LuotXem], [TrangThai], [IDDanhMuc], [NguoiTao], [IDHang], [MauGiay], [DanhGia]) VALUES (41, N'Giày boot mới nhất năm 2020 MINSU M3806', N'giaynu', N'Giay-boot-moi-nhat-nam-2020-MINSU-M3806', N'<p>đang cập nhật..</p>
', N'/Data/images/Upload/sanpham/files/giay%20nu/3806-GB-G-DE-7.jpg', CAST(870000 AS Decimal(18, 0)), CAST(800000 AS Decimal(18, 0)), N'<p>đang cập nhật..</p>
', 2, CAST(N'2021-04-02T13:31:20.020' AS DateTime), NULL, 0, 2, 5, 1, 4, N'/Data/images/Upload/sanpham/files/giay%20nu/3806-GB-G-1.jpg,/Data/images/Upload/sanpham/files/giay%20nu/3806-GB-G-DE-7.jpg,/Data/images/Upload/sanpham/files/giay%20nu/3806-GB-G-TR-1.jpg,/Data/images/Upload/sanpham/files/giay%20nu/3806-GB-G-TR-1.jpg', NULL)
INSERT [dbo].[SANPHAM] ([ID], [TenSP], [Code], [Metatitle], [MoTaSP], [AnhDaiDien], [Gia], [GiaKhuyenMai], [ChiTietSP], [BaoHanh], [NgayTao], [NgaySuaDoi], [LuotXem], [TrangThai], [IDDanhMuc], [NguoiTao], [IDHang], [MauGiay], [DanhGia]) VALUES (42, N'Mẫu giày boot nữ DIOR MINSU M3604', N'giaynu', N'Mau-giay-boot-nu-DIOR-MINSU-M3604', N'<p>đang cập nhật.</p>
', N'/Data/images/Upload/sanpham/files/giay%20nu/3604-6.jpg', CAST(820000 AS Decimal(18, 0)), CAST(718000 AS Decimal(18, 0)), N'<p>đang cập nhật.</p>
', 2, CAST(N'2021-04-02T13:32:37.210' AS DateTime), NULL, 10, 2, 5, 1, 4, N'/Data/images/Upload/sanpham/files/giay%20nu/3604-6.jpg,/Data/images/Upload/sanpham/files/giay%20nu/3604-7.jpg,/Data/images/Upload/sanpham/files/giay%20nu/3604-13.jpg,/Data/images/Upload/sanpham/files/giay%20nu/3604-13.jpg', 4.5)
INSERT [dbo].[SANPHAM] ([ID], [TenSP], [Code], [Metatitle], [MoTaSP], [AnhDaiDien], [Gia], [GiaKhuyenMai], [ChiTietSP], [BaoHanh], [NgayTao], [NgaySuaDoi], [LuotXem], [TrangThai], [IDDanhMuc], [NguoiTao], [IDHang], [MauGiay], [DanhGia]) VALUES (43, N'Mẫu Boot cổ cao MINSU M3307', N'giaynu', N'Mau-Boot-co-cao-MINSU-M3307', N'<p>đang cập nhật..</p>
', N'/Data/images/Upload/sanpham/files/giay%20nu/3307-3.jpg', CAST(670000 AS Decimal(18, 0)), CAST(540000 AS Decimal(18, 0)), N'<p>đang cập nhật..</p>
', 2, CAST(N'2021-04-02T13:34:49.250' AS DateTime), NULL, 6, 2, 5, 1, 4, N'/Data/images/Upload/sanpham/files/giay%20nu/3307-3.jpg,/Data/images/Upload/sanpham/files/giay%20nu/3307-4.jpg,/Data/images/Upload/sanpham/files/giay%20nu/3307-5.jpg,/Data/images/Upload/sanpham/files/giay%20nu/3307-5.jpg', 5)
INSERT [dbo].[SANPHAM] ([ID], [TenSP], [Code], [Metatitle], [MoTaSP], [AnhDaiDien], [Gia], [GiaKhuyenMai], [ChiTietSP], [BaoHanh], [NgayTao], [NgaySuaDoi], [LuotXem], [TrangThai], [IDDanhMuc], [NguoiTao], [IDHang], [MauGiay], [DanhGia]) VALUES (44, N'Adidas Yeezy Boost 350 V2 Zyon 1:1', N'giaynam', N'Adidas-Yeezy-Boost-350-V2-Zyon-1-1', N'<p>đang cập nhật..</p>
', N'/Data/images/Upload/sanpham/files/giaynam/the%20thao%20nam/e4e35b1e3903c65d9f12-2552.jpg', CAST(1300000 AS Decimal(18, 0)), NULL, N'<p>đang cập nhật..</p>
', 2, CAST(N'2021-04-02T13:38:13.000' AS DateTime), CAST(N'2021-04-03T13:50:23.927' AS DateTime), 6, 0, 4, 1, 1, N'/Data/images/Upload/sanpham/files/giaynam/the%20thao%20nam/e4e35b1e3903c65d9f12-2552.jpg,/Data/images/Upload/sanpham/files/giaynam/the%20thao%20nam/9774e693c1da3e8467cb-9226.jpg,/Data/images/Upload/sanpham/files/giaynam/the%20thao%20nam/9774e693c1da3e8467cb-9226.jpg', NULL)
INSERT [dbo].[SANPHAM] ([ID], [TenSP], [Code], [Metatitle], [MoTaSP], [AnhDaiDien], [Gia], [GiaKhuyenMai], [ChiTietSP], [BaoHanh], [NgayTao], [NgaySuaDoi], [LuotXem], [TrangThai], [IDDanhMuc], [NguoiTao], [IDHang], [MauGiay], [DanhGia]) VALUES (45, N'MLB CHÍNH HÃNG MONO 2020 Trắng Nâu Mới', N'giaynam', N'MLB-CHINH-HÃNG-MONO-2020-Trang-Nau-Moi', N'<p>đang cập nhật.</p>
', N'/Data/images/Upload/sanpham/files/giaynam/the%20thao%20nam/12199075827352736167289655851078937430475415o-1830.jpg', CAST(2500000 AS Decimal(18, 0)), CAST(2300000 AS Decimal(18, 0)), N'<p>đang cập nhật.</p>
', 2, CAST(N'2021-04-02T13:40:45.350' AS DateTime), NULL, 0, 0, 6, 1, 1, N'/Data/images/Upload/sanpham/files/giaynam/the%20thao%20nam/11881930027035685298994748287111732096734453o-4760.jpg,/Data/images/Upload/sanpham/files/giaynam/the%20thao%20nam/11881930027035685298994748287111732096734453o-4760.jpg', NULL)
INSERT [dbo].[SANPHAM] ([ID], [TenSP], [Code], [Metatitle], [MoTaSP], [AnhDaiDien], [Gia], [GiaKhuyenMai], [ChiTietSP], [BaoHanh], [NgayTao], [NgaySuaDoi], [LuotXem], [TrangThai], [IDDanhMuc], [NguoiTao], [IDHang], [MauGiay], [DanhGia]) VALUES (46, N'Adidas POD S3.1 Grey CHÍNH HÃNG', N'giaynam', N'Adidas-POD-S3-1-Grey-CHINH-HÃNG', N'<p>đang cập nhật.</p>
', N'/Data/images/Upload/sanpham/files/update%20giay%20nam/81f70b0da542c0a49ca8daa0e0898738-4236.jpg', CAST(2400000 AS Decimal(18, 0)), NULL, N'<p>đang cập nhật.</p>
', 2, CAST(N'2021-04-02T13:42:16.400' AS DateTime), CAST(N'2021-04-03T13:51:48.320' AS DateTime), 80, 2, 4, 1, 1, N'/Data/images/Upload/sanpham/files/update%20giay%20nam/420565l-1872.jpg,/Data/images/Upload/sanpham/files/update%20giay%20nam/42056aq-9851.jpg,/Data/images/Upload/sanpham/files/update%20giay%20nam/81f70b0da542c0a49ca8daa0e0898738-0832.jpg,/Data/images/Upload/sanpham/files/update%20giay%20nam/81f70b0da542c0a49ca8daa0e0898738-4236.jpg,/Data/images/Upload/sanpham/files/update%20giay%20nam/81f70b0da542c0a49ca8daa0e0898738-4236.jpg', 3.33)
INSERT [dbo].[SANPHAM] ([ID], [TenSP], [Code], [Metatitle], [MoTaSP], [AnhDaiDien], [Gia], [GiaKhuyenMai], [ChiTietSP], [BaoHanh], [NgayTao], [NgaySuaDoi], [LuotXem], [TrangThai], [IDDanhMuc], [NguoiTao], [IDHang], [MauGiay], [DanhGia]) VALUES (47, N'MLB CHÍNH HÃNG Gloves Black phiên bản 2021', N'giaynam', N'MLB-CHINH-HÃNG-Gloves-Black-phien-ban-2021', N'<p>đang cập nhật.</p>
', N'/Data/images/Upload/sanpham/files/update%20giay%20nam/1576205151604611258009254773876621130639795n-6379.jpg', CAST(2500000 AS Decimal(18, 0)), CAST(2100000 AS Decimal(18, 0)), N'<p>đang cập nhật.</p>
', 2, CAST(N'2021-04-02T13:43:20.807' AS DateTime), NULL, 213, 2, 6, 1, 4, N'/Data/images/Upload/sanpham/files/update%20giay%20nam/1576205151604611258009254773876621130639795n-6379.jpg,/Data/images/Upload/sanpham/files/update%20giay%20nam/145412077282014630490836266832837671946389o-4849.jpg,/Data/images/Upload/sanpham/files/update%20giay%20nam/145412077282014630490836266832837671946389o-4849.jpg', 3.83)
INSERT [dbo].[SANPHAM] ([ID], [TenSP], [Code], [Metatitle], [MoTaSP], [AnhDaiDien], [Gia], [GiaKhuyenMai], [ChiTietSP], [BaoHanh], [NgayTao], [NgaySuaDoi], [LuotXem], [TrangThai], [IDDanhMuc], [NguoiTao], [IDHang], [MauGiay], [DanhGia]) VALUES (48, N'Nike Air Focre 1 Xanh Navy ( Hàng 1:1 )', N'giaynam', N'Nike-Air-Focre-1-Xanh-Navy-Hang-1-1-', N'<p>đang cập nhật.</p>
', N'/Data/images/Upload/sanpham/files/update%20giay%20nam/1539850232506472599408124830327439212987680n-1-1209.jpg', CAST(1111000 AS Decimal(18, 0)), CAST(1000000 AS Decimal(18, 0)), N'<p>đang cập nhật.</p>
', 2, CAST(N'2021-04-02T13:46:00.993' AS DateTime), NULL, 0, 0, 6, 1, 3, N'/Data/images/Upload/sanpham/files/update%20giay%20nam/1466145168816697559672613144603980106376742n-1-4649.jpg,/Data/images/Upload/sanpham/files/update%20giay%20nam/1539850232506472599408124830327439212987680n-1-1209.jpg,/Data/images/Upload/sanpham/files/update%20giay%20nam/15416026311263308944938003379475489126913818n-1-7114.jpg,/Data/images/Upload/sanpham/files/update%20giay%20nam/1545446721784812771189614754231120293568120n-1-2556.jpg,/Data/images/Upload/sanpham/files/update%20giay%20nam/1545446721784812771189614754231120293568120n-1-2556.jpg', NULL)
INSERT [dbo].[SANPHAM] ([ID], [TenSP], [Code], [Metatitle], [MoTaSP], [AnhDaiDien], [Gia], [GiaKhuyenMai], [ChiTietSP], [BaoHanh], [NgayTao], [NgaySuaDoi], [LuotXem], [TrangThai], [IDDanhMuc], [NguoiTao], [IDHang], [MauGiay], [DanhGia]) VALUES (49, N'Nike Air Focre 1 Xanh Navy ( Hàng 1:1 )', N'giaynam', N'Nike-Air-Focre-1-Xanh-Navy-Hang-1-1-', N'<p>đang cập nhật.</p>
', N'/Data/images/Upload/sanpham/files/update%20giay%20nam/1539850232506472599408124830327439212987680n-1-1209.jpg', CAST(1111000 AS Decimal(18, 0)), CAST(1000000 AS Decimal(18, 0)), N'<p>đang cập nhật.</p>
', 2, CAST(N'2021-04-02T13:46:01.547' AS DateTime), NULL, 4, 0, 6, 1, 3, N'/Data/images/Upload/sanpham/files/update%20giay%20nam/1466145168816697559672613144603980106376742n-1-4649.jpg,/Data/images/Upload/sanpham/files/update%20giay%20nam/1539850232506472599408124830327439212987680n-1-1209.jpg,/Data/images/Upload/sanpham/files/update%20giay%20nam/15416026311263308944938003379475489126913818n-1-7114.jpg,/Data/images/Upload/sanpham/files/update%20giay%20nam/1545446721784812771189614754231120293568120n-1-2556.jpg,/Data/images/Upload/sanpham/files/update%20giay%20nam/1545446721784812771189614754231120293568120n-1-2556.jpg', NULL)
INSERT [dbo].[SANPHAM] ([ID], [TenSP], [Code], [Metatitle], [MoTaSP], [AnhDaiDien], [Gia], [GiaKhuyenMai], [ChiTietSP], [BaoHanh], [NgayTao], [NgaySuaDoi], [LuotXem], [TrangThai], [IDDanhMuc], [NguoiTao], [IDHang], [MauGiay], [DanhGia]) VALUES (50, N'Nike Air Force 1 G-DRAGON (AF1 Bản Tróc Sơn) Hàng Chuẩn', N'giaynam', N'Nike-Air-Force-1-G-DRAGON-AF1-Ban-Troc-Son-Hang-Chuan', N'<p>đang cập nhật.</p>
', N'/Data/images/Upload/sanpham/files/update%20giay%20nam/1190246942418855137917674382629409035530366n-5109.jpg', CAST(1900000 AS Decimal(18, 0)), CAST(1700000 AS Decimal(18, 0)), N'<p>đang cập nhật.</p>
', 2, CAST(N'2021-04-02T13:47:26.753' AS DateTime), NULL, 7, 0, 6, 1, 3, N'/Data/images/Upload/sanpham/files/update%20giay%20nam/1189653503141791896731411596479035505176215n-4507.jpg,/Data/images/Upload/sanpham/files/update%20giay%20nam/1190246942418855137917674382629409035530366n-5109.jpg,/Data/images/Upload/sanpham/files/update%20giay%20nam/1190615053291441117549826611175880884084367n-9006.jpg,/Data/images/Upload/sanpham/files/update%20giay%20nam/1190615053291441117549826611175880884084367n-9006.jpg', NULL)
SET IDENTITY_INSERT [dbo].[SANPHAM] OFF
GO
SET IDENTITY_INSERT [dbo].[SLIDE] ON 

INSERT [dbo].[SLIDE] ([ID], [TenSlide], [Metatitle], [Anh], [Link], [NgayTao], [TrangThai]) VALUES (1, N'GIÀY NAM HÀN QUỐC - T2C3', N'GIÀY-NAM-HÀN-QUỐC-T2C3', N'/Data/images/Upload/sanpham/files/Slider1_adidasjpg.jpg', N'#1', CAST(N'2016-05-13T17:51:37.763' AS DateTime), -1)
INSERT [dbo].[SLIDE] ([ID], [TenSlide], [Metatitle], [Anh], [Link], [NgayTao], [TrangThai]) VALUES (2, N'GIÀY TÂY DA BÓNG TS007 - TS007', N'GIÀY-TDY-DA-BONG-TS007-TS007', N'/Data/images/Upload/sanpham/files/Slider2_adidasjpg.jpg', N'#2', CAST(N'2016-05-13T17:51:43.990' AS DateTime), -1)
INSERT [dbo].[SLIDE] ([ID], [TenSlide], [Metatitle], [Anh], [Link], [NgayTao], [TrangThai]) VALUES (3, N'GIÀY TÂY DA BÓNG TS007 - TS007', N'GIAY TAY DA BONg', N'/Data/images/Upload/sanpham/files/Pride231232sktop.jpg', N'#3', CAST(N'2016-05-13T20:02:57.757' AS DateTime), -1)
INSERT [dbo].[SLIDE] ([ID], [TenSlide], [Metatitle], [Anh], [Link], [NgayTao], [TrangThai]) VALUES (4, N'GIÀY TÂY DA BÓNG TS007 - TS007', NULL, N'/Data/images/Upload/sanpham/files/Slider3_adidasjpg11.jpg', N'#4', CAST(N'2016-05-13T20:02:59.840' AS DateTime), -1)
INSERT [dbo].[SLIDE] ([ID], [TenSlide], [Metatitle], [Anh], [Link], [NgayTao], [TrangThai]) VALUES (5, N'Slide ảnh 4', N'Slide-anh-4', N'/Data/images/Upload/sanpham/files/59ef34_simg_70aaf2_700x700_maxb.jpg', N'anh4', CAST(N'2021-03-26T01:44:27.537' AS DateTime), -1)
INSERT [dbo].[SLIDE] ([ID], [TenSlide], [Metatitle], [Anh], [Link], [NgayTao], [TrangThai]) VALUES (6, N'slide 7', N'slide-7', N'/Data/images/Upload/sanpham/files/Slider3_adidasjpg.jpg', N'Slide 7', CAST(N'2021-03-26T01:45:18.850' AS DateTime), -1)
INSERT [dbo].[SLIDE] ([ID], [TenSlide], [Metatitle], [Anh], [Link], [NgayTao], [TrangThai]) VALUES (7, N'12321323213', N'12321323213', N'/Data/images/Upload/sanpham/files/d31d09_simg_70aaf2_700x700_maxb.jpg', N'213213123213213', CAST(N'2021-03-26T01:45:46.650' AS DateTime), -1)
INSERT [dbo].[SLIDE] ([ID], [TenSlide], [Metatitle], [Anh], [Link], [NgayTao], [TrangThai]) VALUES (8, N'2321321321', N'2321321321', N'/Data/images/Upload/sanpham/files/bcf926_simg_70aaf2_700x700_maxb.jpg', N'123213123', CAST(N'2021-03-26T01:46:54.893' AS DateTime), -1)
INSERT [dbo].[SLIDE] ([ID], [TenSlide], [Metatitle], [Anh], [Link], [NgayTao], [TrangThai]) VALUES (9, N'slide1', N'slide1', N'/Data/images/Upload/sanpham/files/danh-cho-fan-giay-the-thao-10-dieu-it-ai-biet-ve-giay-adidas-va-lich-su-di-den-su-thanh-cong-medium.jpg', NULL, CAST(N'2021-04-02T10:29:02.087' AS DateTime), -1)
INSERT [dbo].[SLIDE] ([ID], [TenSlide], [Metatitle], [Anh], [Link], [NgayTao], [TrangThai]) VALUES (10, N'slide giay da', N'slide-giay-da', N'/Data/images/Upload/sanpham/files/slide%20giay%20da.jpg', N'http://localhost:14518/DanhMuc/Index/4', CAST(N'2021-04-02T10:31:39.683' AS DateTime), -1)
INSERT [dbo].[SLIDE] ([ID], [TenSlide], [Metatitle], [Anh], [Link], [NgayTao], [TrangThai]) VALUES (11, N'slide the thao nam', N'slide-the-thao-nam', N'/Data/images/Upload/sanpham/files/off-white-air-jordan-1-lead-1400x747.jpg', N'http://localhost:14518/DanhMuc/Index/6', CAST(N'2021-04-02T10:35:52.930' AS DateTime), -1)
INSERT [dbo].[SLIDE] ([ID], [TenSlide], [Metatitle], [Anh], [Link], [NgayTao], [TrangThai]) VALUES (12, N'slide giay tre em', N'slide-giay-tre-em', N'/Data/images/Upload/sanpham/files/giay%20tre%20em/0203_giaytreemnua.jpg', N'http://localhost:14518/DanhMuc/Index/9', CAST(N'2021-04-02T11:55:30.847' AS DateTime), -1)
INSERT [dbo].[SLIDE] ([ID], [TenSlide], [Metatitle], [Anh], [Link], [NgayTao], [TrangThai]) VALUES (13, N'slide giay tre em', N'slide-giay-tre-em', N'/Data/images/Upload/sanpham/files/giay%20tre%20em/a7aad0c9e280f8a45fa2a1bf3c899674.jpg', N'http://localhost:14518/DanhMuc/Index/14', CAST(N'2021-04-02T11:57:18.820' AS DateTime), -1)
INSERT [dbo].[SLIDE] ([ID], [TenSlide], [Metatitle], [Anh], [Link], [NgayTao], [TrangThai]) VALUES (14, N'slide giay tre em', N'slide-giay-tre-em', N'/Data/images/Upload/sanpham/files/giay%20tre%20em/gi%C3%A0y-tr%E1%BA%BB-em-tphcm.jpg', N'http://localhost:14518/DanhMuc/Index/8', CAST(N'2021-04-02T11:59:04.283' AS DateTime), -1)
INSERT [dbo].[SLIDE] ([ID], [TenSlide], [Metatitle], [Anh], [Link], [NgayTao], [TrangThai]) VALUES (15, N'slide giay nu', N'slide-giay-nu', N'/Data/images/Upload/sanpham/files/giay%20nu/giaynu_2f0af471.jpg', N'http://localhost:14518/DanhMuc/Index/2', CAST(N'2021-04-02T12:05:48.920' AS DateTime), -1)
INSERT [dbo].[SLIDE] ([ID], [TenSlide], [Metatitle], [Anh], [Link], [NgayTao], [TrangThai]) VALUES (16, N'slide giay tre em', N'slide-giay-tre-em', N'/Data/images/Upload/sanpham/files/128_photo_thb.jpg', N'http://localhost:14518/DanhMuc/Index/9', CAST(N'2021-04-02T13:56:41.830' AS DateTime), -1)
INSERT [dbo].[SLIDE] ([ID], [TenSlide], [Metatitle], [Anh], [Link], [NgayTao], [TrangThai]) VALUES (17, N'slide giay tre em', N'slide-giay-tre-em', N'/Data/images/Upload/sanpham/files/4.png', N'http://localhost:14518/DanhMuc/Index/9', CAST(N'2021-04-02T13:58:35.807' AS DateTime), 2)
INSERT [dbo].[SLIDE] ([ID], [TenSlide], [Metatitle], [Anh], [Link], [NgayTao], [TrangThai]) VALUES (18, N'slide giay nu', N'slide-giay-nu', N'/Data/images/Upload/sanpham/files/giaynu_2f0af471.jpg', N'http://localhost:14518/DanhMuc/Index/5', CAST(N'2021-04-02T14:00:37.830' AS DateTime), 2)
INSERT [dbo].[SLIDE] ([ID], [TenSlide], [Metatitle], [Anh], [Link], [NgayTao], [TrangThai]) VALUES (19, N'slide the thao nam', N'slide-the-thao-nam', N'/Data/images/Upload/sanpham/files/off-white-air-jordan-1-lead-1400x747.jpg', N'http://localhost:14518/DanhMuc/Index/6', CAST(N'2021-04-02T14:01:20.713' AS DateTime), 2)
SET IDENTITY_INSERT [dbo].[SLIDE] OFF
GO
SET IDENTITY_INSERT [dbo].[TAIKHOAN] ON 

INSERT [dbo].[TAIKHOAN] ([ID], [TenTaiKhoan], [MatKhau], [HoTen], [DiaChi], [Email], [SoDienThoai], [QuyenHan], [NgayTao], [TrangThai]) VALUES (1, N'admin', N'kgVyzILwJchzhJVW35KKCPLhZelKCAC+cUEmNRuFzhxHgRru8A8=', N'Hữu Thành', N'Thủ Dầu Một', N'thanhd17pm03@gmail.com', N'01679323265', 1, CAST(N'2021-03-27T22:20:37.610' AS DateTime), 1)
INSERT [dbo].[TAIKHOAN] ([ID], [TenTaiKhoan], [MatKhau], [HoTen], [DiaChi], [Email], [SoDienThoai], [QuyenHan], [NgayTao], [TrangThai]) VALUES (4, N'thanhvien', N'kgVyzILwJchzhJVW35KKCPLhZelKCAC+cUEmNRuFzhxHgRru8A8=', N'Hữu Thành', N'Thủ Dầu Một', N'thanhd17pm03@gmail.com', N'0968927358', 0, CAST(N'2021-04-02T10:25:36.567' AS DateTime), 0)
INSERT [dbo].[TAIKHOAN] ([ID], [TenTaiKhoan], [MatKhau], [HoTen], [DiaChi], [Email], [SoDienThoai], [QuyenHan], [NgayTao], [TrangThai]) VALUES (5, N'thanhvienbikhoa', N'kgVyzILwJchzhJVW35KKCPLhZelKCAC+cUEmNRuFzhxHgRru8A8=', N'Hữu Thành', N'Thủ Dầu Một', N'thanhd17pm03@gmail.com', N'0968927358', 0, CAST(N'2021-04-02T11:32:22.507' AS DateTime), -1)
INSERT [dbo].[TAIKHOAN] ([ID], [TenTaiKhoan], [MatKhau], [HoTen], [DiaChi], [Email], [SoDienThoai], [QuyenHan], [NgayTao], [TrangThai]) VALUES (6, N'huuthanh', N'kgVyzILwJchzhJVW35KKCPLhZelKCAC+cUEmNRuFzhxHgRru8A8=', N'Bùi Hữu Thành', N'Thủ Dầu Một', N'thanhd17pm03@gmail.com', N'0968927358', 0, CAST(N'2021-04-02T11:33:27.387' AS DateTime), 1)
INSERT [dbo].[TAIKHOAN] ([ID], [TenTaiKhoan], [MatKhau], [HoTen], [DiaChi], [Email], [SoDienThoai], [QuyenHan], [NgayTao], [TrangThai]) VALUES (7, N'nguyenvana', N'UikZSUkm9Qx4s5umSY4mae/SCwkZIpII19GEpvSRpDTIpNcgXA==', N'Nguyễn Văn A', N'Hà Nội', N'nguyenvana@gmail.com', N'0123456789', NULL, CAST(N'2021-04-04T14:38:42.007' AS DateTime), 1)
INSERT [dbo].[TAIKHOAN] ([ID], [TenTaiKhoan], [MatKhau], [HoTen], [DiaChi], [Email], [SoDienThoai], [QuyenHan], [NgayTao], [TrangThai]) VALUES (8, N'nguyenvanb', N'8qgVtN9OTo2xVLeVh5XfiJHDsabdaPFR5e3e0CDYW2kvVHjR/PE=', N'N', NULL, NULL, NULL, NULL, CAST(N'2021-04-04T14:42:27.263' AS DateTime), 1)
INSERT [dbo].[TAIKHOAN] ([ID], [TenTaiKhoan], [MatKhau], [HoTen], [DiaChi], [Email], [SoDienThoai], [QuyenHan], [NgayTao], [TrangThai]) VALUES (9, N'tu', N'dYVjx78XcSqaDT59OEfJPBBsGSF91TSbTdq2nGw6TkOVMBlwWQ==', N'Nguyễn Văn C', NULL, NULL, NULL, NULL, CAST(N'2021-04-04T15:14:25.943' AS DateTime), 1)
INSERT [dbo].[TAIKHOAN] ([ID], [TenTaiKhoan], [MatKhau], [HoTen], [DiaChi], [Email], [SoDienThoai], [QuyenHan], [NgayTao], [TrangThai]) VALUES (10, N'abc', N'xNdPkt9On30Vg/An6YwPKRMH+COEO6hAdUAEINbvMSiMIoP1Mw==', N'abc', N'abc', N'a@gmail.com', N'0123-456-789', NULL, CAST(N'2021-04-04T16:37:55.980' AS DateTime), 1)
INSERT [dbo].[TAIKHOAN] ([ID], [TenTaiKhoan], [MatKhau], [HoTen], [DiaChi], [Email], [SoDienThoai], [QuyenHan], [NgayTao], [TrangThai]) VALUES (11, N'thanhvien1', N'cm8KF3jXWx/cr5BeziLKxZGI2QN7pGlZUZ02lRn8Fi7c+6HepDM=', N'Thành Viên', N'abc', N'a@gmail.com', N'0123-456-789', NULL, CAST(N'2021-04-11T10:44:16.320' AS DateTime), 1)
INSERT [dbo].[TAIKHOAN] ([ID], [TenTaiKhoan], [MatKhau], [HoTen], [DiaChi], [Email], [SoDienThoai], [QuyenHan], [NgayTao], [TrangThai]) VALUES (12, N'thanhvien11', N'JXGmexRxWtHgnzbGf5dKLqVysRqLwgGEW975Ld/Pve80I/Y+XA==', N'huuthanh', N'd@gmail.com', N'd@gmail.com', N'2323', NULL, CAST(N'2021-04-11T13:00:29.333' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[TAIKHOAN] OFF
GO
INSERT [dbo].[YeuThich] ([SanPhamId], [NguoiDungId], [NgayThem]) VALUES (47, 6, CAST(N'2021-04-17T23:22:47.563' AS DateTime))
GO
ALTER TABLE [dbo].[DANHMUCSANPHAM] ADD  CONSTRAINT [DF_DANHMUCSANPHAM_TenDanhMuc]  DEFAULT (N'Đang cập nhật') FOR [TenDanhMuc]
GO
ALTER TABLE [dbo].[DANHMUCSANPHAM] ADD  CONSTRAINT [DF_DANHMUCSANPHAM_IDCha]  DEFAULT ((0)) FOR [IDCha]
GO
ALTER TABLE [dbo].[DANHMUCSANPHAM] ADD  CONSTRAINT [DF_DANHMUCSANPHAM_NgayTao]  DEFAULT (getdate()) FOR [NgayTao]
GO
ALTER TABLE [dbo].[DANHMUCSANPHAM] ADD  CONSTRAINT [DF_DANHMUCSANPHAM_NguoiTao]  DEFAULT (N'Đang cập nhật') FOR [NguoiTao]
GO
ALTER TABLE [dbo].[DANHMUCSANPHAM] ADD  CONSTRAINT [DF_DANHMUCSANPHAM_TrangThai]  DEFAULT ((0)) FOR [TrangThai]
GO
ALTER TABLE [dbo].[DONHANG] ADD  CONSTRAINT [DF_DONHANG_NgayTao]  DEFAULT (getdate()) FOR [NgayTao]
GO
ALTER TABLE [dbo].[DONHANG] ADD  CONSTRAINT [DF_DONHANG_TenKhachHang]  DEFAULT (N'Đang cập nhật') FOR [TenKhachHang]
GO
ALTER TABLE [dbo].[DONHANG] ADD  CONSTRAINT [DF_DONHANG_TrangThai]  DEFAULT ((0)) FOR [TrangThai]
GO
ALTER TABLE [dbo].[HANG] ADD  CONSTRAINT [DF_HANG_ThongTinHang]  DEFAULT (N'Đang cập nhật') FOR [ThongTinHang]
GO
ALTER TABLE [dbo].[HANG] ADD  CONSTRAINT [DF_HANG_TrangThai]  DEFAULT ((0)) FOR [TrangThai]
GO
ALTER TABLE [dbo].[LIENHE] ADD  CONSTRAINT [DF_LIENHE_DateCreate]  DEFAULT (getdate()) FOR [DateCreate]
GO
ALTER TABLE [dbo].[LIENHE] ADD  CONSTRAINT [DF_LIENHE_Status]  DEFAULT ((0)) FOR [Status]
GO
ALTER TABLE [dbo].[MENU] ADD  CONSTRAINT [DF_MENU_Ten]  DEFAULT (N'Đang cập nhật') FOR [Ten]
GO
ALTER TABLE [dbo].[MENU] ADD  CONSTRAINT [DF_MENU_IDCha]  DEFAULT ((0)) FOR [IDCha]
GO
ALTER TABLE [dbo].[MENU] ADD  CONSTRAINT [DF_MENU_Link]  DEFAULT (N'#') FOR [Link]
GO
ALTER TABLE [dbo].[MENU] ADD  CONSTRAINT [DF_MENU_NgayTao]  DEFAULT (getdate()) FOR [NgayTao]
GO
ALTER TABLE [dbo].[MENU] ADD  CONSTRAINT [DF_MENU_NguoiTao]  DEFAULT (N'Đang cập nhật') FOR [NguoiTao]
GO
ALTER TABLE [dbo].[MENU] ADD  CONSTRAINT [DF_MENU_TrangThai]  DEFAULT ((0)) FOR [TrangThai]
GO
ALTER TABLE [dbo].[SANPHAM] ADD  CONSTRAINT [DF_SANPHAM_MoTaSP]  DEFAULT (N'Đang cập nhật') FOR [MoTaSP]
GO
ALTER TABLE [dbo].[SANPHAM] ADD  CONSTRAINT [DF_SANPHAM_ChiTietSP]  DEFAULT (N'Đang cập nhật') FOR [ChiTietSP]
GO
ALTER TABLE [dbo].[SANPHAM] ADD  CONSTRAINT [DF_SANPHAM_NgayTao]  DEFAULT (getdate()) FOR [NgayTao]
GO
ALTER TABLE [dbo].[SANPHAM] ADD  CONSTRAINT [DF_SANPHAM_LuotXem]  DEFAULT ((0)) FOR [LuotXem]
GO
ALTER TABLE [dbo].[SANPHAM] ADD  CONSTRAINT [DF_SANPHAM_TrangThai]  DEFAULT ((0)) FOR [TrangThai]
GO
ALTER TABLE [dbo].[SLIDE] ADD  CONSTRAINT [DF_SLIDE_NgayTao]  DEFAULT (getdate()) FOR [NgayTao]
GO
ALTER TABLE [dbo].[SLIDE] ADD  CONSTRAINT [DF_SLIDE_TrangThai]  DEFAULT ((0)) FOR [TrangThai]
GO
ALTER TABLE [dbo].[TAIKHOAN] ADD  CONSTRAINT [DF_TAIKHOAN_QuyenHan]  DEFAULT ((0)) FOR [QuyenHan]
GO
ALTER TABLE [dbo].[TAIKHOAN] ADD  CONSTRAINT [DF_TAIKHOAN_NgayTao]  DEFAULT (getdate()) FOR [NgayTao]
GO
ALTER TABLE [dbo].[TAIKHOAN] ADD  CONSTRAINT [DF_TAIKHOAN_TrangThai]  DEFAULT ((0)) FOR [TrangThai]
GO
/****** Object:  StoredProcedure [dbo].[sp_DonHang_ThongKeDoanhThuTheoThang]    Script Date: 18-Apr-21 12:09:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_DonHang_ThongKeDoanhThuTheoThang] 
AS
BEGIN
    SELECT DATEADD(MONTH, DATEDIFF(MONTH, 0, dh.NgayTao), 0) AS ThoiGian, SUM(ctdh.SoLuong) SoLuongSanPham, SUM(ctdh.SoLuong * ctdh.Gia) ThanhTien
	FROM dbo.DONHANG dh
	LEFT JOIN dbo.CHITIETDONHANG ctdh ON ctdh.IDDonHang = dh.ID
	GROUP BY DATEADD(MONTH, DATEDIFF(MONTH, 0, dh.NgayTao), 0)
END
GO
USE [master]
GO
ALTER DATABASE [doantotnghiep_webbangiay] SET  READ_WRITE 
GO
