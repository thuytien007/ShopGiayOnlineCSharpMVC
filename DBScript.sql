USE [master]
GO
/****** Object:  Database [ShopGiayOnline]    Script Date: 2020.06.14 9:21:21 PM ******/
CREATE DATABASE [ShopGiayOnline]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ShopGiayOnline', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\ShopGiayOnline.mdf' , SIZE = 9408KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'ShopGiayOnline_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\ShopGiayOnline_log.ldf' , SIZE = 3200KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [ShopGiayOnline] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ShopGiayOnline].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ShopGiayOnline] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ShopGiayOnline] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ShopGiayOnline] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ShopGiayOnline] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ShopGiayOnline] SET ARITHABORT OFF 
GO
ALTER DATABASE [ShopGiayOnline] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [ShopGiayOnline] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ShopGiayOnline] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ShopGiayOnline] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ShopGiayOnline] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ShopGiayOnline] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ShopGiayOnline] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ShopGiayOnline] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ShopGiayOnline] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ShopGiayOnline] SET  ENABLE_BROKER 
GO
ALTER DATABASE [ShopGiayOnline] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ShopGiayOnline] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ShopGiayOnline] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ShopGiayOnline] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ShopGiayOnline] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ShopGiayOnline] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ShopGiayOnline] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ShopGiayOnline] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ShopGiayOnline] SET  MULTI_USER 
GO
ALTER DATABASE [ShopGiayOnline] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ShopGiayOnline] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ShopGiayOnline] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ShopGiayOnline] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [ShopGiayOnline] SET DELAYED_DURABILITY = DISABLED 
GO
USE [ShopGiayOnline]
GO
/****** Object:  User [Jakie]    Script Date: 2020.06.14 9:21:21 PM ******/
CREATE USER [Jakie] FOR LOGIN [Jakie] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [Jakie]
GO
/****** Object:  Table [dbo].[Banner]    Script Date: 2020.06.14 9:21:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Banner](
	[Id] [int] NOT NULL,
	[Image] [varchar](max) NULL,
	[Link] [nvarchar](max) NULL,
	[Meta] [nvarchar](50) NULL,
	[Hide] [bit] NULL,
	[Order] [int] NULL,
	[DateBegin] [smalldatetime] NULL,
 CONSTRAINT [PK_Banner] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ChiTietDonHang]    Script Date: 2020.06.14 9:21:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietDonHang](
	[MaHD] [int] NOT NULL,
	[MaCTSP] [int] NOT NULL,
	[SoLuong] [int] NULL,
	[Meta] [nvarchar](50) NULL,
	[Hide] [bit] NULL,
	[Order] [int] NULL,
	[DateBegin] [smalldatetime] NULL,
 CONSTRAINT [PK_ChiTietDonHang_1] PRIMARY KEY CLUSTERED 
(
	[MaHD] ASC,
	[MaCTSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ChiTietSanPham]    Script Date: 2020.06.14 9:21:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ChiTietSanPham](
	[MaCTSP] [int] IDENTITY(1,1) NOT NULL,
	[MaSP] [int] NOT NULL,
	[Mau] [nvarchar](50) NULL,
	[Size] [varchar](10) NULL,
	[Meta] [nvarchar](50) NULL,
	[Hide] [bit] NULL,
	[Order] [int] NULL,
	[DateBegin] [smalldatetime] NULL,
 CONSTRAINT [PK_ChiTietSanPham_1] PRIMARY KEY CLUSTERED 
(
	[MaCTSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 2020.06.14 9:21:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[Customer](
	[MaKH] [int] IDENTITY(1,1) NOT NULL,
	[TenKH] [nvarchar](50) NULL,
	[DiaChi] [nvarchar](50) NULL,
	[SDT] [varchar](50) NULL,
	[Meta] [nvarchar](50) NULL,
	[Hide] [bit] NULL,
	[Order] [int] NULL,
	[DateBegin] [smalldatetime] NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[MaKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DonHang]    Script Date: 2020.06.14 9:21:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DonHang](
	[MaHD] [int] IDENTITY(1,1) NOT NULL,
	[NgayDatHang] [smalldatetime] NULL,
	[TongTien] [int] NULL,
	[MaKH] [int] NULL,
	[TrangThai] [bit] NULL,
	[Meta] [nvarchar](50) NULL,
	[Hide] [bit] NULL,
	[Order] [int] NULL,
	[DateBegin] [smalldatetime] NULL,
 CONSTRAINT [PK_HoaDon] PRIMARY KEY CLUSTERED 
(
	[MaHD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LoginAdmin]    Script Date: 2020.06.14 9:21:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LoginAdmin](
	[Username] [varchar](50) NOT NULL,
	[Password] [varchar](50) NOT NULL,
 CONSTRAINT [PK_LoginAdmin] PRIMARY KEY CLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Menu]    Script Date: 2020.06.14 9:21:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Menu](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Link] [nvarchar](max) NULL,
	[Meta] [nvarchar](50) NULL,
	[Hide] [bit] NULL,
	[Order] [int] NULL,
	[DateBegin] [smalldatetime] NULL,
 CONSTRAINT [PK_Menu] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[NhomSanPham]    Script Date: 2020.06.14 9:21:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhomSanPham](
	[MaNhom] [int] IDENTITY(1,1) NOT NULL,
	[TenNhom] [nvarchar](50) NULL,
	[Meta] [nvarchar](50) NULL,
	[Hide] [bit] NULL,
	[Order] [int] NULL,
	[DateBegin] [smalldatetime] NULL,
 CONSTRAINT [PK_NhomSanPham] PRIMARY KEY CLUSTERED 
(
	[MaNhom] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SanPham]    Script Date: 2020.06.14 9:21:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SanPham](
	[MaSP] [int] IDENTITY(1,1) NOT NULL,
	[MaNhom] [int] NOT NULL,
	[TenSP] [nvarchar](50) NULL,
	[Gia] [int] NULL,
	[MoTa] [nvarchar](500) NULL,
	[Img] [varchar](max) NULL,
	[Moi] [bit] NULL,
	[Meta] [nvarchar](50) NULL,
	[Hide] [bit] NULL,
	[Order] [int] NULL,
	[DateBegin] [smalldatetime] NULL,
 CONSTRAINT [PK_SanPham_1] PRIMARY KEY CLUSTERED 
(
	[MaSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Banner] ([Id], [Image], [Link], [Meta], [Hide], [Order], [DateBegin]) VALUES (1, N'Adidas.jpg', NULL, N'banner-1', 0, 1, CAST(N'2020-05-21 00:00:00' AS SmallDateTime))
INSERT [dbo].[Banner] ([Id], [Image], [Link], [Meta], [Hide], [Order], [DateBegin]) VALUES (2, N'Bitis.jpg', NULL, N'banner-2', 0, 2, CAST(N'2020-05-21 00:00:00' AS SmallDateTime))
INSERT [dbo].[Banner] ([Id], [Image], [Link], [Meta], [Hide], [Order], [DateBegin]) VALUES (3, N'NewBalance.jpg', NULL, N'banner-3', 0, 3, CAST(N'2020-05-21 00:00:00' AS SmallDateTime))
INSERT [dbo].[Banner] ([Id], [Image], [Link], [Meta], [Hide], [Order], [DateBegin]) VALUES (4, N'Nike.jpg', NULL, N'banner-4', 0, 4, CAST(N'2020-05-21 00:00:00' AS SmallDateTime))
INSERT [dbo].[Banner] ([Id], [Image], [Link], [Meta], [Hide], [Order], [DateBegin]) VALUES (5, N'Vans.jpg', NULL, N'banner-5', 0, 5, CAST(N'2020-05-21 00:00:00' AS SmallDateTime))
INSERT [dbo].[ChiTietDonHang] ([MaHD], [MaCTSP], [SoLuong], [Meta], [Hide], [Order], [DateBegin]) VALUES (1, 1, 1, N'chi-tiet-dh-1', 0, 1, CAST(N'2020-06-01 00:00:00' AS SmallDateTime))
INSERT [dbo].[ChiTietDonHang] ([MaHD], [MaCTSP], [SoLuong], [Meta], [Hide], [Order], [DateBegin]) VALUES (2, 2, 1, N'chi-tiet-dh-2', 0, 2, CAST(N'2020-06-01 00:00:00' AS SmallDateTime))
INSERT [dbo].[ChiTietDonHang] ([MaHD], [MaCTSP], [SoLuong], [Meta], [Hide], [Order], [DateBegin]) VALUES (3, 4, 3, N'chi-tiet-dh-3', 0, 4, CAST(N'2020-06-01 00:00:00' AS SmallDateTime))
SET IDENTITY_INSERT [dbo].[ChiTietSanPham] ON 

INSERT [dbo].[ChiTietSanPham] ([MaCTSP], [MaSP], [Mau], [Size], [Meta], [Hide], [Order], [DateBegin]) VALUES (1, 1, N'Trắng', N'40', N'adidas-trang-40', 0, 1, CAST(N'2020-06-01 00:00:00' AS SmallDateTime))
INSERT [dbo].[ChiTietSanPham] ([MaCTSP], [MaSP], [Mau], [Size], [Meta], [Hide], [Order], [DateBegin]) VALUES (2, 2, N'Cam', N'41', N'bitis-orange-41', 0, 2, CAST(N'2020-06-01 00:00:00' AS SmallDateTime))
INSERT [dbo].[ChiTietSanPham] ([MaCTSP], [MaSP], [Mau], [Size], [Meta], [Hide], [Order], [DateBegin]) VALUES (3, 2, N'Cam', N'42', N'bitis-orange-42', 0, 3, CAST(N'2020-06-01 00:00:00' AS SmallDateTime))
INSERT [dbo].[ChiTietSanPham] ([MaCTSP], [MaSP], [Mau], [Size], [Meta], [Hide], [Order], [DateBegin]) VALUES (4, 2, N'Cam', N'43', N'bitis-orange-43', 0, 4, CAST(N'2020-06-13 00:00:00' AS SmallDateTime))
INSERT [dbo].[ChiTietSanPham] ([MaCTSP], [MaSP], [Mau], [Size], [Meta], [Hide], [Order], [DateBegin]) VALUES (5, 3, N'Trắng', N'40', N'converse-erx-40', 0, 5, CAST(N'2020-06-13 00:00:00' AS SmallDateTime))
INSERT [dbo].[ChiTietSanPham] ([MaCTSP], [MaSP], [Mau], [Size], [Meta], [Hide], [Order], [DateBegin]) VALUES (6, 3, N'Trắng', N'41', N'converse-erx-41', 0, 6, CAST(N'2020-06-13 00:00:00' AS SmallDateTime))
INSERT [dbo].[ChiTietSanPham] ([MaCTSP], [MaSP], [Mau], [Size], [Meta], [Hide], [Order], [DateBegin]) VALUES (7, 3, N'Trắng', N'42', N'converse-erx-42', 0, 7, CAST(N'2020-06-13 00:00:00' AS SmallDateTime))
INSERT [dbo].[ChiTietSanPham] ([MaCTSP], [MaSP], [Mau], [Size], [Meta], [Hide], [Order], [DateBegin]) VALUES (8, 4, N'Đỏ', N'41', N'jordan-max-aura-41', 0, 8, CAST(N'2020-06-13 00:00:00' AS SmallDateTime))
INSERT [dbo].[ChiTietSanPham] ([MaCTSP], [MaSP], [Mau], [Size], [Meta], [Hide], [Order], [DateBegin]) VALUES (9, 4, N'Đỏ', N'43', N'jordan-max-aura-43', 0, 9, CAST(N'2020-06-13 00:00:00' AS SmallDateTime))
INSERT [dbo].[ChiTietSanPham] ([MaCTSP], [MaSP], [Mau], [Size], [Meta], [Hide], [Order], [DateBegin]) VALUES (10, 5, N'Xám', N'41', N'new-balance-41', 0, 10, CAST(N'2020-06-13 00:00:00' AS SmallDateTime))
INSERT [dbo].[ChiTietSanPham] ([MaCTSP], [MaSP], [Mau], [Size], [Meta], [Hide], [Order], [DateBegin]) VALUES (11, 6, N'Xám', N'42', N'nike-air-max-2090-42', 0, 11, CAST(N'2020-06-13 00:00:00' AS SmallDateTime))
INSERT [dbo].[ChiTietSanPham] ([MaCTSP], [MaSP], [Mau], [Size], [Meta], [Hide], [Order], [DateBegin]) VALUES (12, 6, N'Xám', N'43', N'nike-air-max-2090-43', 0, 12, CAST(N'2020-06-13 00:00:00' AS SmallDateTime))
INSERT [dbo].[ChiTietSanPham] ([MaCTSP], [MaSP], [Mau], [Size], [Meta], [Hide], [Order], [DateBegin]) VALUES (13, 6, N'Xám', N'44', N'nike-air-max-2090-44', 0, 13, CAST(N'2020-06-13 00:00:00' AS SmallDateTime))
INSERT [dbo].[ChiTietSanPham] ([MaCTSP], [MaSP], [Mau], [Size], [Meta], [Hide], [Order], [DateBegin]) VALUES (14, 7, N'Xanh-Trắng', N'39', N'pp-1101-jamaican-flag-39', 0, 14, CAST(N'2020-06-13 00:00:00' AS SmallDateTime))
INSERT [dbo].[ChiTietSanPham] ([MaCTSP], [MaSP], [Mau], [Size], [Meta], [Hide], [Order], [DateBegin]) VALUES (15, 7, N'Xanh-Trắng', N'40', N'pp-1101-jaimaican-flag-40', 0, 15, CAST(N'2020-06-13 00:00:00' AS SmallDateTime))
INSERT [dbo].[ChiTietSanPham] ([MaCTSP], [MaSP], [Mau], [Size], [Meta], [Hide], [Order], [DateBegin]) VALUES (16, 8, N'Đỏ', N'39', N'vans-old-skool-39', 0, 16, CAST(N'2020-06-13 00:00:00' AS SmallDateTime))
INSERT [dbo].[ChiTietSanPham] ([MaCTSP], [MaSP], [Mau], [Size], [Meta], [Hide], [Order], [DateBegin]) VALUES (17, 11, N'Trắng', N'39', N'bitis-hunter-core-39', 0, 17, CAST(N'2020-06-13 00:00:00' AS SmallDateTime))
INSERT [dbo].[ChiTietSanPham] ([MaCTSP], [MaSP], [Mau], [Size], [Meta], [Hide], [Order], [DateBegin]) VALUES (18, 11, N'Trắng', N'40', N'bitis-hunter-core-40', 0, 18, CAST(N'2020-06-13 00:00:00' AS SmallDateTime))
INSERT [dbo].[ChiTietSanPham] ([MaCTSP], [MaSP], [Mau], [Size], [Meta], [Hide], [Order], [DateBegin]) VALUES (19, 11, N'Trắng', N'41', N'bitis-hunter-core-41', 0, 19, CAST(N'2020-06-13 00:00:00' AS SmallDateTime))
INSERT [dbo].[ChiTietSanPham] ([MaCTSP], [MaSP], [Mau], [Size], [Meta], [Hide], [Order], [DateBegin]) VALUES (20, 11, N'Trắng', N'42', N'bitis-hunter-core-42', 0, 20, CAST(N'2020-06-13 00:00:00' AS SmallDateTime))
INSERT [dbo].[ChiTietSanPham] ([MaCTSP], [MaSP], [Mau], [Size], [Meta], [Hide], [Order], [DateBegin]) VALUES (21, 11, N'Trắng', N'43', N'bitis-hunter-core-43', 0, 21, CAST(N'2020-06-13 00:00:00' AS SmallDateTime))
INSERT [dbo].[ChiTietSanPham] ([MaCTSP], [MaSP], [Mau], [Size], [Meta], [Hide], [Order], [DateBegin]) VALUES (22, 11, N'Trắng', N'44', N'bitis-hunter-core-44', 0, 22, CAST(N'2020-06-13 00:00:00' AS SmallDateTime))
INSERT [dbo].[ChiTietSanPham] ([MaCTSP], [MaSP], [Mau], [Size], [Meta], [Hide], [Order], [DateBegin]) VALUES (23, 12, N'Đen', N'41', N'bitis-hunter-x-bkl-41', 0, 23, CAST(N'2020-06-13 00:00:00' AS SmallDateTime))
INSERT [dbo].[ChiTietSanPham] ([MaCTSP], [MaSP], [Mau], [Size], [Meta], [Hide], [Order], [DateBegin]) VALUES (24, 12, N'Đen', N'44', N'bitis-hunter-x-bkl-44', 0, 24, CAST(N'2020-06-13 00:00:00' AS SmallDateTime))
INSERT [dbo].[ChiTietSanPham] ([MaCTSP], [MaSP], [Mau], [Size], [Meta], [Hide], [Order], [DateBegin]) VALUES (25, 13, N'Xám', N'37', N'adidas-gazelle-37', 0, 25, CAST(N'2020-06-13 00:00:00' AS SmallDateTime))
INSERT [dbo].[ChiTietSanPham] ([MaCTSP], [MaSP], [Mau], [Size], [Meta], [Hide], [Order], [DateBegin]) VALUES (26, 13, N'Xám', N'38', N'adidas-gazelle-38', 0, 26, CAST(N'2020-06-13 00:00:00' AS SmallDateTime))
INSERT [dbo].[ChiTietSanPham] ([MaCTSP], [MaSP], [Mau], [Size], [Meta], [Hide], [Order], [DateBegin]) VALUES (27, 13, N'Xám', N'39', N'adidas-gazelle-39', 0, 27, CAST(N'2020-06-13 00:00:00' AS SmallDateTime))
INSERT [dbo].[ChiTietSanPham] ([MaCTSP], [MaSP], [Mau], [Size], [Meta], [Hide], [Order], [DateBegin]) VALUES (28, 14, N'Xám', N'37', N'balenciaga-triple-s-37', 0, 28, CAST(N'2020-06-13 00:00:00' AS SmallDateTime))
INSERT [dbo].[ChiTietSanPham] ([MaCTSP], [MaSP], [Mau], [Size], [Meta], [Hide], [Order], [DateBegin]) VALUES (29, 14, N'Xám', N'39', N'balenciaga-triple-s-39', 0, 29, CAST(N'2020-06-13 00:00:00' AS SmallDateTime))
INSERT [dbo].[ChiTietSanPham] ([MaCTSP], [MaSP], [Mau], [Size], [Meta], [Hide], [Order], [DateBegin]) VALUES (30, 15, N'Trắng', N'37', N'bitis-hunter-core-37', 0, 30, CAST(N'2020-06-13 00:00:00' AS SmallDateTime))
INSERT [dbo].[ChiTietSanPham] ([MaCTSP], [MaSP], [Mau], [Size], [Meta], [Hide], [Order], [DateBegin]) VALUES (31, 15, N'Trắng', N'38', N'bitis-hunter-core-38', 0, 31, CAST(N'2020-06-13 00:00:00' AS SmallDateTime))
INSERT [dbo].[ChiTietSanPham] ([MaCTSP], [MaSP], [Mau], [Size], [Meta], [Hide], [Order], [DateBegin]) VALUES (32, 15, N'Trắng', N'39', N'bitis-hunter-core-39', 0, 32, CAST(N'2020-06-13 00:00:00' AS SmallDateTime))
INSERT [dbo].[ChiTietSanPham] ([MaCTSP], [MaSP], [Mau], [Size], [Meta], [Hide], [Order], [DateBegin]) VALUES (33, 15, N'Trắng', N'40', N'bitis-hunter-core-40', 0, 33, CAST(N'2020-06-13 00:00:00' AS SmallDateTime))
INSERT [dbo].[ChiTietSanPham] ([MaCTSP], [MaSP], [Mau], [Size], [Meta], [Hide], [Order], [DateBegin]) VALUES (34, 16, N'Đen', N'35', N'converse-all-star-denim-35', 0, 34, CAST(N'2020-06-13 00:00:00' AS SmallDateTime))
INSERT [dbo].[ChiTietSanPham] ([MaCTSP], [MaSP], [Mau], [Size], [Meta], [Hide], [Order], [DateBegin]) VALUES (35, 16, N'Đen', N'36', N'converse-all-star-denim-36', 0, 35, CAST(N'2020-06-13 00:00:00' AS SmallDateTime))
INSERT [dbo].[ChiTietSanPham] ([MaCTSP], [MaSP], [Mau], [Size], [Meta], [Hide], [Order], [DateBegin]) VALUES (36, 16, N'Đen', N'37', N'converse-all-star-denim-37', 0, 36, CAST(N'2020-06-13 00:00:00' AS SmallDateTime))
INSERT [dbo].[ChiTietSanPham] ([MaCTSP], [MaSP], [Mau], [Size], [Meta], [Hide], [Order], [DateBegin]) VALUES (37, 16, N'Đen', N'38', N'converse-all-star-denim-38', 0, 37, CAST(N'2020-06-13 00:00:00' AS SmallDateTime))
INSERT [dbo].[ChiTietSanPham] ([MaCTSP], [MaSP], [Mau], [Size], [Meta], [Hide], [Order], [DateBegin]) VALUES (38, 16, N'Đen', N'39', N'converse-all-star-denim-39', 0, 38, CAST(N'2020-06-13 00:00:00' AS SmallDateTime))
INSERT [dbo].[ChiTietSanPham] ([MaCTSP], [MaSP], [Mau], [Size], [Meta], [Hide], [Order], [DateBegin]) VALUES (39, 17, N'Xám-Đen', N'34', N'newbalance-fresh-foan-roav-34', 0, 39, CAST(N'2020-06-13 00:00:00' AS SmallDateTime))
INSERT [dbo].[ChiTietSanPham] ([MaCTSP], [MaSP], [Mau], [Size], [Meta], [Hide], [Order], [DateBegin]) VALUES (40, 17, N'Xám-Đen', N'35', N'newbalance-fresh-foan-roav-35', 0, 40, CAST(N'2020-06-13 00:00:00' AS SmallDateTime))
INSERT [dbo].[ChiTietSanPham] ([MaCTSP], [MaSP], [Mau], [Size], [Meta], [Hide], [Order], [DateBegin]) VALUES (41, 17, N'Xám-Den', N'38', N'newbalance-fresh-foan-roav-38', 0, 41, CAST(N'2020-06-13 00:00:00' AS SmallDateTime))
INSERT [dbo].[ChiTietSanPham] ([MaCTSP], [MaSP], [Mau], [Size], [Meta], [Hide], [Order], [DateBegin]) VALUES (42, 18, N'Xám', N'36', N'nike-roshe-g-36', 0, 42, CAST(N'2020-06-13 00:00:00' AS SmallDateTime))
INSERT [dbo].[ChiTietSanPham] ([MaCTSP], [MaSP], [Mau], [Size], [Meta], [Hide], [Order], [DateBegin]) VALUES (43, 18, N'Xám', N'37', N'nike-roshe-g-37', 0, 43, CAST(N'2020-06-13 00:00:00' AS SmallDateTime))
INSERT [dbo].[ChiTietSanPham] ([MaCTSP], [MaSP], [Mau], [Size], [Meta], [Hide], [Order], [DateBegin]) VALUES (44, 18, N'Xám', N'38', N'nike-roshe-g-38', 0, 44, CAST(N'2020-06-13 00:00:00' AS SmallDateTime))
INSERT [dbo].[ChiTietSanPham] ([MaCTSP], [MaSP], [Mau], [Size], [Meta], [Hide], [Order], [DateBegin]) VALUES (45, 19, N'Đen', N'35', N'vans-ua-old-skool-35', 0, 45, CAST(N'2020-06-13 00:00:00' AS SmallDateTime))
INSERT [dbo].[ChiTietSanPham] ([MaCTSP], [MaSP], [Mau], [Size], [Meta], [Hide], [Order], [DateBegin]) VALUES (46, 19, N'Đen', N'36', N'vans-ua-old-skool-36', 0, 46, CAST(N'2020-06-13 00:00:00' AS SmallDateTime))
INSERT [dbo].[ChiTietSanPham] ([MaCTSP], [MaSP], [Mau], [Size], [Meta], [Hide], [Order], [DateBegin]) VALUES (47, 20, N'Xám', N'37', N'converse-chuck-taylor-37', 0, 47, CAST(N'2020-06-13 00:00:00' AS SmallDateTime))
INSERT [dbo].[ChiTietSanPham] ([MaCTSP], [MaSP], [Mau], [Size], [Meta], [Hide], [Order], [DateBegin]) VALUES (48, 20, N'Xám', N'38', N'converse-chuck-taylor-38', 0, 48, CAST(N'2020-06-13 00:00:00' AS SmallDateTime))
SET IDENTITY_INSERT [dbo].[ChiTietSanPham] OFF
SET IDENTITY_INSERT [dbo].[Customer] ON 

INSERT [dbo].[Customer] ([MaKH], [TenKH], [DiaChi], [SDT], [Meta], [Hide], [Order], [DateBegin]) VALUES (1, N'Lam', N'Gò Vấp', N'0923741980', N'khach-hang-lam', 0, 1, CAST(N'2020-05-27 00:00:00' AS SmallDateTime))
INSERT [dbo].[Customer] ([MaKH], [TenKH], [DiaChi], [SDT], [Meta], [Hide], [Order], [DateBegin]) VALUES (2, N'Đạt', N'Linh Trung Thủ Đức', N'05147893256', N'khach-hang-dat', 0, 2, CAST(N'2020-05-27 00:00:00' AS SmallDateTime))
INSERT [dbo].[Customer] ([MaKH], [TenKH], [DiaChi], [SDT], [Meta], [Hide], [Order], [DateBegin]) VALUES (3, N'Tiên', N'Quận 8', N'03256987412', N'khach-hang-tien', 0, 3, CAST(N'2020-05-27 00:00:00' AS SmallDateTime))
SET IDENTITY_INSERT [dbo].[Customer] OFF
SET IDENTITY_INSERT [dbo].[DonHang] ON 

INSERT [dbo].[DonHang] ([MaHD], [NgayDatHang], [TongTien], [MaKH], [TrangThai], [Meta], [Hide], [Order], [DateBegin]) VALUES (1, CAST(N'2020-02-27 00:00:00' AS SmallDateTime), 899000, 1, 1, N'don-hang-1', 0, 1, CAST(N'2020-05-27 00:00:00' AS SmallDateTime))
INSERT [dbo].[DonHang] ([MaHD], [NgayDatHang], [TongTien], [MaKH], [TrangThai], [Meta], [Hide], [Order], [DateBegin]) VALUES (2, CAST(N'2020-05-25 00:00:00' AS SmallDateTime), 7000000, 2, 1, N'don-hang-2', 0, 2, CAST(N'2020-05-25 00:00:00' AS SmallDateTime))
INSERT [dbo].[DonHang] ([MaHD], [NgayDatHang], [TongTien], [MaKH], [TrangThai], [Meta], [Hide], [Order], [DateBegin]) VALUES (3, CAST(N'2020-05-24 00:00:00' AS SmallDateTime), 200000, 3, 0, N'don-hang-3', 0, 3, CAST(N'2020-05-24 00:00:00' AS SmallDateTime))
SET IDENTITY_INSERT [dbo].[DonHang] OFF
INSERT [dbo].[LoginAdmin] ([Username], [Password]) VALUES (N'tiennguyen@gmail.com', N'331212tt')
INSERT [dbo].[Menu] ([Id], [Name], [Link], [Meta], [Hide], [Order], [DateBegin]) VALUES (1, N'Trang Chủ', NULL, N'trang-chu', 0, 1, CAST(N'2020-05-12 00:00:00' AS SmallDateTime))
INSERT [dbo].[Menu] ([Id], [Name], [Link], [Meta], [Hide], [Order], [DateBegin]) VALUES (2, N'Giày Nam', NULL, N'san-pham/giay-nam', 0, 2, CAST(N'2020-05-12 00:00:00' AS SmallDateTime))
INSERT [dbo].[Menu] ([Id], [Name], [Link], [Meta], [Hide], [Order], [DateBegin]) VALUES (3, N'Giày Nữ', NULL, N'san-pham/giay-nu', 0, 3, CAST(N'2020-05-12 00:00:00' AS SmallDateTime))
INSERT [dbo].[Menu] ([Id], [Name], [Link], [Meta], [Hide], [Order], [DateBegin]) VALUES (4, N'Giày Trẻ Em', NULL, N'san-pham/giay-tre-em', 1, 4, CAST(N'2020-05-12 00:00:00' AS SmallDateTime))
INSERT [dbo].[Menu] ([Id], [Name], [Link], [Meta], [Hide], [Order], [DateBegin]) VALUES (5, N'Sale', NULL, N'sale', 1, 5, CAST(N'2020-05-12 00:00:00' AS SmallDateTime))
INSERT [dbo].[Menu] ([Id], [Name], [Link], [Meta], [Hide], [Order], [DateBegin]) VALUES (6, N'Liên Hệ', NULL, N'lien-he', 0, 6, CAST(N'2020-05-12 00:00:00' AS SmallDateTime))
SET IDENTITY_INSERT [dbo].[NhomSanPham] ON 

INSERT [dbo].[NhomSanPham] ([MaNhom], [TenNhom], [Meta], [Hide], [Order], [DateBegin]) VALUES (1, N'Nam', N'giay-nam', 0, 1, CAST(N'2020-05-25 00:00:00' AS SmallDateTime))
INSERT [dbo].[NhomSanPham] ([MaNhom], [TenNhom], [Meta], [Hide], [Order], [DateBegin]) VALUES (2, N'Nữ', N'giay-nu', 0, 2, CAST(N'2020-05-25 00:00:00' AS SmallDateTime))
SET IDENTITY_INSERT [dbo].[NhomSanPham] OFF
SET IDENTITY_INSERT [dbo].[SanPham] ON 

INSERT [dbo].[SanPham] ([MaSP], [MaNhom], [TenSP], [Gia], [MoTa], [Img], [Moi], [Meta], [Hide], [Order], [DateBegin]) VALUES (1, 1, N'Adidas Hoops Mid 2.0', 1514000, N'adidas', N'M_AdidasHoopsMid2-0.jpg', NULL, N'giayadidas', 0, 1, CAST(N'2020-05-25 00:00:00' AS SmallDateTime))
INSERT [dbo].[SanPham] ([MaSP], [MaNhom], [TenSP], [Gia], [MoTa], [Img], [Moi], [Meta], [Hide], [Order], [DateBegin]) VALUES (2, 1, N'Bitis Hunter X 2K18 Sunrise', 899000, N'bitis', N'M_BitisHunterX2K18.jpg', NULL, N'giay-bitis', 0, 2, CAST(N'2020-05-25 00:00:00' AS SmallDateTime))
INSERT [dbo].[SanPham] ([MaSP], [MaNhom], [TenSP], [Gia], [MoTa], [Img], [Moi], [Meta], [Hide], [Order], [DateBegin]) VALUES (3, 1, N'Converse ERX 260 MID', 1863000, N'converse', N'M_ConverseERX260MID.jpg', NULL, N'giay-converse', 0, 3, CAST(N'2020-05-25 00:00:00' AS SmallDateTime))
INSERT [dbo].[SanPham] ([MaSP], [MaNhom], [TenSP], [Gia], [MoTa], [Img], [Moi], [Meta], [Hide], [Order], [DateBegin]) VALUES (4, 1, N'Jordan Max Aura', 1560000, N'jordan', N'M_JordanMaxAura.jpg', NULL, N'giay-jordan', 0, 4, CAST(N'2020-05-25 00:00:00' AS SmallDateTime))
INSERT [dbo].[SanPham] ([MaSP], [MaNhom], [TenSP], [Gia], [MoTa], [Img], [Moi], [Meta], [Hide], [Order], [DateBegin]) VALUES (5, 1, N'New Balance 997S', 1629000, N'newblance', N'M_NewBalance997S.jpeg', NULL, N'giay-newblance', 1, 5, CAST(N'2020-05-25 00:00:00' AS SmallDateTime))
INSERT [dbo].[SanPham] ([MaSP], [MaNhom], [TenSP], [Gia], [MoTa], [Img], [Moi], [Meta], [Hide], [Order], [DateBegin]) VALUES (6, 1, N'Nike Air Max 2090', 4109000, N'nike', N'M_NikeAirMax2090.jpg', NULL, N'giay-nike', 0, 6, CAST(N'2020-05-25 00:00:00' AS SmallDateTime))
INSERT [dbo].[SanPham] ([MaSP], [MaNhom], [TenSP], [Gia], [MoTa], [Img], [Moi], [Meta], [Hide], [Order], [DateBegin]) VALUES (7, 1, N'PP 1101 Jamaican Flag', 1100000, N'paperplanes', N'M_PaperPlanes1101JamaicanFlag.jpg', NULL, N'giay-paperplanes', 0, 7, CAST(N'2020-05-25 00:00:00' AS SmallDateTime))
INSERT [dbo].[SanPham] ([MaSP], [MaNhom], [TenSP], [Gia], [MoTa], [Img], [Moi], [Meta], [Hide], [Order], [DateBegin]) VALUES (8, 1, N'Vans Old Skool Pro', 1750000, N'vans', N'M_VansOldSkoolPro.jpg', NULL, N'giay-vans', 1, 8, CAST(N'2020-05-25 00:00:00' AS SmallDateTime))
INSERT [dbo].[SanPham] ([MaSP], [MaNhom], [TenSP], [Gia], [MoTa], [Img], [Moi], [Meta], [Hide], [Order], [DateBegin]) VALUES (9, 1, N'Balenciaga Triple-S', 5000000, N'balenciaga', N'M_BalenciagaTriple-S.jpg', NULL, N'giay-balenciaga', 1, 9, CAST(N'2020-05-25 00:00:00' AS SmallDateTime))
INSERT [dbo].[SanPham] ([MaSP], [MaNhom], [TenSP], [Gia], [MoTa], [Img], [Moi], [Meta], [Hide], [Order], [DateBegin]) VALUES (10, 1, N'Nike Tanjun', 2000000, N'nike', N'M_NikeTanjun.jpg', NULL, N'giay-nike', 1, 10, CAST(N'2020-05-25 00:00:00' AS SmallDateTime))
INSERT [dbo].[SanPham] ([MaSP], [MaNhom], [TenSP], [Gia], [MoTa], [Img], [Moi], [Meta], [Hide], [Order], [DateBegin]) VALUES (11, 1, N'Bitis Hunter Core', 899000, N'bitis', N'M_BitisHunterCore.jpg', NULL, N'giay-bitis', 0, 11, CAST(N'2020-05-26 00:00:00' AS SmallDateTime))
INSERT [dbo].[SanPham] ([MaSP], [MaNhom], [TenSP], [Gia], [MoTa], [Img], [Moi], [Meta], [Hide], [Order], [DateBegin]) VALUES (12, 1, N'Bitis Hunter X BKL', 999000, N'bitis', N'M_BitisHunterXBKL.jpg', NULL, N'giay-bitis', 0, 12, CAST(N'2020-05-26 00:00:00' AS SmallDateTime))
INSERT [dbo].[SanPham] ([MaSP], [MaNhom], [TenSP], [Gia], [MoTa], [Img], [Moi], [Meta], [Hide], [Order], [DateBegin]) VALUES (13, 2, N'Adidas Gazelle', 2500000, N'adidas', N'W_AdidasGazelleAthletic.jpg', NULL, N'giay-adidas', 0, 13, CAST(N'2020-05-26 00:00:00' AS SmallDateTime))
INSERT [dbo].[SanPham] ([MaSP], [MaNhom], [TenSP], [Gia], [MoTa], [Img], [Moi], [Meta], [Hide], [Order], [DateBegin]) VALUES (14, 2, N'Balenciaga Triple S', 5000000, N'balenciaga', N'W_BalenciagaTripleS.jpg', NULL, N'giay-balenciaga', 0, 14, CAST(N'2020-05-26 00:00:00' AS SmallDateTime))
INSERT [dbo].[SanPham] ([MaSP], [MaNhom], [TenSP], [Gia], [MoTa], [Img], [Moi], [Meta], [Hide], [Order], [DateBegin]) VALUES (15, 2, N'Bitis Hunter Core', 899000, N'bitis', N'W_BitisHunterCore.jpg', NULL, N'giay-bitis', 0, 15, CAST(N'2020-05-26 00:00:00' AS SmallDateTime))
INSERT [dbo].[SanPham] ([MaSP], [MaNhom], [TenSP], [Gia], [MoTa], [Img], [Moi], [Meta], [Hide], [Order], [DateBegin]) VALUES (16, 2, N'Converse All Star Denim', 1300000, N'converse', N'W_ConverseChuckTaylorAllStarDenimFloral.jpg', NULL, N'giay-converse', 0, 16, CAST(N'2020-05-26 00:00:00' AS SmallDateTime))
INSERT [dbo].[SanPham] ([MaSP], [MaNhom], [TenSP], [Gia], [MoTa], [Img], [Moi], [Meta], [Hide], [Order], [DateBegin]) VALUES (17, 2, N'Fresh Foam Roav', 2800000, N'newbalance', N'W_FreshFoamRoav.jpg', NULL, N'giay-newbalance', 0, 17, CAST(N'2020-05-26 00:00:00' AS SmallDateTime))
INSERT [dbo].[SanPham] ([MaSP], [MaNhom], [TenSP], [Gia], [MoTa], [Img], [Moi], [Meta], [Hide], [Order], [DateBegin]) VALUES (18, 2, N'Nike Roshe G', 1800000, N'nike', N'W_NikeRosheG.jpg', NULL, N'giay-nike', 0, 18, CAST(N'2020-05-26 00:00:00' AS SmallDateTime))
INSERT [dbo].[SanPham] ([MaSP], [MaNhom], [TenSP], [Gia], [MoTa], [Img], [Moi], [Meta], [Hide], [Order], [DateBegin]) VALUES (19, 2, N'Vans Ua Old Skool', 1800000, N'vans', N'W_VansUaOldSkool.jpg', NULL, N'giay-vans', 0, 19, CAST(N'2020-05-26 00:00:00' AS SmallDateTime))
INSERT [dbo].[SanPham] ([MaSP], [MaNhom], [TenSP], [Gia], [MoTa], [Img], [Moi], [Meta], [Hide], [Order], [DateBegin]) VALUES (20, 2, N'Converse Chuck Taylor', 1400000, N'converse', N'W_ConverseChuckTaylor.jpg', NULL, N'giay-converse', 0, 20, CAST(N'2020-05-26 00:00:00' AS SmallDateTime))
SET IDENTITY_INSERT [dbo].[SanPham] OFF
ALTER TABLE [dbo].[ChiTietDonHang]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietDonHang_ChiTietSanPham] FOREIGN KEY([SoLuong])
REFERENCES [dbo].[ChiTietSanPham] ([MaCTSP])
GO
ALTER TABLE [dbo].[ChiTietDonHang] CHECK CONSTRAINT [FK_ChiTietDonHang_ChiTietSanPham]
GO
ALTER TABLE [dbo].[ChiTietDonHang]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietHoaDon_HoaDon] FOREIGN KEY([MaHD])
REFERENCES [dbo].[DonHang] ([MaHD])
GO
ALTER TABLE [dbo].[ChiTietDonHang] CHECK CONSTRAINT [FK_ChiTietHoaDon_HoaDon]
GO
ALTER TABLE [dbo].[ChiTietSanPham]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietSanPham_SanPham] FOREIGN KEY([MaSP])
REFERENCES [dbo].[SanPham] ([MaSP])
GO
ALTER TABLE [dbo].[ChiTietSanPham] CHECK CONSTRAINT [FK_ChiTietSanPham_SanPham]
GO
ALTER TABLE [dbo].[DonHang]  WITH CHECK ADD  CONSTRAINT [FK_HoaDon_Customer] FOREIGN KEY([MaKH])
REFERENCES [dbo].[Customer] ([MaKH])
GO
ALTER TABLE [dbo].[DonHang] CHECK CONSTRAINT [FK_HoaDon_Customer]
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD  CONSTRAINT [FK_SanPham_NhomSanPham] FOREIGN KEY([MaNhom])
REFERENCES [dbo].[NhomSanPham] ([MaNhom])
GO
ALTER TABLE [dbo].[SanPham] CHECK CONSTRAINT [FK_SanPham_NhomSanPham]
GO
USE [master]
GO
ALTER DATABASE [ShopGiayOnline] SET  READ_WRITE 
GO
