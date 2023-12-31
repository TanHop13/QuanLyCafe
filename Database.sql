USE [master]
GO
/****** Object:  Database [QuanLyCafe]    Script Date: 10/24/2023 3:52:09 PM ******/
CREATE DATABASE [QuanLyCafe]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QuanLyCafe', FILENAME = N'D:\QuanLyCafe.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'QuanLyCafe_log', FILENAME = N'D:\QuanLyCafe_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [QuanLyCafe] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QuanLyCafe].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QuanLyCafe] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QuanLyCafe] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QuanLyCafe] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QuanLyCafe] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QuanLyCafe] SET ARITHABORT OFF 
GO
ALTER DATABASE [QuanLyCafe] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [QuanLyCafe] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QuanLyCafe] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QuanLyCafe] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QuanLyCafe] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QuanLyCafe] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QuanLyCafe] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QuanLyCafe] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QuanLyCafe] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QuanLyCafe] SET  DISABLE_BROKER 
GO
ALTER DATABASE [QuanLyCafe] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QuanLyCafe] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QuanLyCafe] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QuanLyCafe] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QuanLyCafe] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QuanLyCafe] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QuanLyCafe] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QuanLyCafe] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [QuanLyCafe] SET  MULTI_USER 
GO
ALTER DATABASE [QuanLyCafe] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QuanLyCafe] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QuanLyCafe] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QuanLyCafe] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [QuanLyCafe] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [QuanLyCafe] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [QuanLyCafe] SET QUERY_STORE = ON
GO
ALTER DATABASE [QuanLyCafe] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [QuanLyCafe]
GO
/****** Object:  Table [dbo].[CaLamViec]    Script Date: 10/24/2023 3:52:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CaLamViec](
	[MaCLV] [nvarchar](10) NOT NULL,
	[CaLamViec] [nvarchar](50) NULL,
	[GioBD] [time](7) NULL,
	[GioKT] [time](7) NULL,
 CONSTRAINT [PK_CaLamViec] PRIMARY KEY CLUSTERED 
(
	[MaCLV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChiTietHoaDon]    Script Date: 10/24/2023 3:52:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietHoaDon](
	[MaChiTiet] [nvarchar](10) NOT NULL,
	[SoLuong] [int] NULL,
	[MaDD] [nvarchar](10) NULL,
	[MaHD] [nvarchar](10) NULL,
 CONSTRAINT [PK_ChiTietHoaDon] PRIMARY KEY CLUSTERED 
(
	[MaChiTiet] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DD_HH]    Script Date: 10/24/2023 3:52:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DD_HH](
	[MaHH] [nvarchar](10) NOT NULL,
	[MaDD] [nvarchar](10) NOT NULL,
	[MaHH_DD] [nvarchar](10) NOT NULL,
 CONSTRAINT [PK_DD_HH] PRIMARY KEY CLUSTERED 
(
	[MaHH] ASC,
	[MaDD] ASC,
	[MaHH_DD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DoDung]    Script Date: 10/24/2023 3:52:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DoDung](
	[MaDD] [nvarchar](10) NOT NULL,
	[TenDD] [nvarchar](50) NULL,
	[Gia] [decimal](18, 0) NULL,
	[MaLDD] [nvarchar](10) NULL,
	[HinhDD] [nvarchar](50) NULL,
	[SoLuong] [int] NULL,
 CONSTRAINT [PK_DoDung] PRIMARY KEY CLUSTERED 
(
	[MaDD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HangHoa]    Script Date: 10/24/2023 3:52:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HangHoa](
	[MaHH] [nvarchar](10) NOT NULL,
	[TenHH] [nvarchar](50) NULL,
	[Gia] [money] NULL,
	[DonViTinh] [nvarchar](20) NULL,
 CONSTRAINT [PK_HangHoa] PRIMARY KEY CLUSTERED 
(
	[MaHH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HH_NCC]    Script Date: 10/24/2023 3:52:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HH_NCC](
	[MaHH] [nvarchar](10) NOT NULL,
	[MaNCC] [nvarchar](10) NOT NULL,
	[MaHH_NCC] [nvarchar](10) NOT NULL,
	[SoLuong] [int] NULL,
 CONSTRAINT [PK_HH_NCC] PRIMARY KEY CLUSTERED 
(
	[MaHH] ASC,
	[MaNCC] ASC,
	[MaHH_NCC] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HoaDon]    Script Date: 10/24/2023 3:52:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HoaDon](
	[MaHD] [nvarchar](10) NOT NULL,
	[NgayTaoHD] [datetime] NOT NULL,
	[TongTien] [money] NULL,
	[MaKH] [nvarchar](10) NULL,
	[MaUser] [nvarchar](10) NULL,
 CONSTRAINT [PK_HoaDon] PRIMARY KEY CLUSTERED 
(
	[MaHD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KhachHang]    Script Date: 10/24/2023 3:52:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhachHang](
	[MaKH] [nvarchar](10) NOT NULL,
	[TenKH] [nvarchar](50) NULL,
	[SDT] [char](15) NULL,
	[MaLoaiKH] [nvarchar](10) NULL,
 CONSTRAINT [PK_KhachHang] PRIMARY KEY CLUSTERED 
(
	[MaKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LoaiDoDung]    Script Date: 10/24/2023 3:52:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiDoDung](
	[MaLoaiDD] [nvarchar](10) NOT NULL,
	[TenLoai] [nvarchar](50) NULL,
	[MoTa] [nvarchar](50) NULL,
 CONSTRAINT [PK_LoaiHangHoa] PRIMARY KEY CLUSTERED 
(
	[MaLoaiDD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LoaiKhachHang]    Script Date: 10/24/2023 3:52:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiKhachHang](
	[MaLoaiKH] [nvarchar](10) NOT NULL,
	[TenLoai] [nvarchar](50) NULL,
	[GiamGia] [float] NULL,
 CONSTRAINT [PK_LoaiKhachHang] PRIMARY KEY CLUSTERED 
(
	[MaLoaiKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NgayLam]    Script Date: 10/24/2023 3:52:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NgayLam](
	[MaNL] [int] IDENTITY(1,1) NOT NULL,
	[MaCLV] [nvarchar](10) NOT NULL,
	[MaUser] [nvarchar](10) NOT NULL,
	[NgayLamViec] [nvarchar](50) NULL,
 CONSTRAINT [PK_NgayLam_1] PRIMARY KEY CLUSTERED 
(
	[MaNL] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NhaCungCap]    Script Date: 10/24/2023 3:52:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhaCungCap](
	[MaNCC] [nvarchar](10) NOT NULL,
	[TenNCC] [nvarchar](100) NULL,
	[DiaChi] [nvarchar](100) NULL,
	[SDT] [char](15) NULL,
 CONSTRAINT [PK_NhaCungCap] PRIMARY KEY CLUSTERED 
(
	[MaNCC] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PhanHoiSuCo]    Script Date: 10/24/2023 3:52:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhanHoiSuCo](
	[MaPH] [nvarchar](10) NOT NULL,
	[MoTa] [nvarchar](50) NULL,
	[MaUser] [nvarchar](10) NULL,
 CONSTRAINT [PK_PhanHoiSuCo] PRIMARY KEY CLUSTERED 
(
	[MaPH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 10/24/2023 3:52:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[MaUser] [nvarchar](10) NOT NULL,
	[TenUser] [nvarchar](50) NULL,
	[DiaChi] [nvarchar](50) NULL,
	[SDT] [char](15) NULL,
	[PhanQuyen] [int] NOT NULL,
	[MatKhau] [nvarchar](max) NULL,
	[activate] [nvarchar](50) NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[MaUser] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[CaLamViec] ([MaCLV], [CaLamViec], [GioBD], [GioKT]) VALUES (N'1', N'1', CAST(N'07:00:00' AS Time), CAST(N'11:00:00' AS Time))
INSERT [dbo].[CaLamViec] ([MaCLV], [CaLamViec], [GioBD], [GioKT]) VALUES (N'2', N'2', CAST(N'11:00:00' AS Time), CAST(N'18:00:00' AS Time))
INSERT [dbo].[CaLamViec] ([MaCLV], [CaLamViec], [GioBD], [GioKT]) VALUES (N'3', N'3', CAST(N'18:00:00' AS Time), CAST(N'22:00:00' AS Time))
GO
INSERT [dbo].[DoDung] ([MaDD], [TenDD], [Gia], [MaLDD], [HinhDD], [SoLuong]) VALUES (N'DD01', N'Lon CocaCola', CAST(20000 AS Decimal(18, 0)), N'L1', N'image/CocaCola.jpg', 14)
INSERT [dbo].[DoDung] ([MaDD], [TenDD], [Gia], [MaLDD], [HinhDD], [SoLuong]) VALUES (N'DD02', N'Lon 7up', CAST(20000 AS Decimal(18, 0)), N'L1', N'image/7up.jpg', 29)
INSERT [dbo].[DoDung] ([MaDD], [TenDD], [Gia], [MaLDD], [HinhDD], [SoLuong]) VALUES (N'DD03', N'Nước dừa', CAST(22000 AS Decimal(18, 0)), N'L2', N'image/NuocDua.png', 5)
INSERT [dbo].[DoDung] ([MaDD], [TenDD], [Gia], [MaLDD], [HinhDD], [SoLuong]) VALUES (N'DD04', N'Nước ép xoài', CAST(25000 AS Decimal(18, 0)), N'L2', N'image/NuocEpXoai.jpg', 4)
INSERT [dbo].[DoDung] ([MaDD], [TenDD], [Gia], [MaLDD], [HinhDD], [SoLuong]) VALUES (N'DD05', N'Cafe đen', CAST(20000 AS Decimal(18, 0)), N'L5', N'image/CafeDen.jpg', 12)
INSERT [dbo].[DoDung] ([MaDD], [TenDD], [Gia], [MaLDD], [HinhDD], [SoLuong]) VALUES (N'DD06', N'Cafe sữa', CAST(20000 AS Decimal(18, 0)), N'L5', N'image/CafeSua.jpg', 13)
INSERT [dbo].[DoDung] ([MaDD], [TenDD], [Gia], [MaLDD], [HinhDD], [SoLuong]) VALUES (N'DD07', N'BimBim', CAST(10000 AS Decimal(18, 0)), N'L4', N'image/BimBim.jpg', 14)
INSERT [dbo].[DoDung] ([MaDD], [TenDD], [Gia], [MaLDD], [HinhDD], [SoLuong]) VALUES (N'DD08', N'Bánh cốm', CAST(15000 AS Decimal(18, 0)), N'L3', N'image/BanhCom.jpg', 15)
INSERT [dbo].[DoDung] ([MaDD], [TenDD], [Gia], [MaLDD], [HinhDD], [SoLuong]) VALUES (N'DD09', N'Sinh tố dâu', CAST(30000 AS Decimal(18, 0)), N'L2', N'image/SinhToDau.jpg', 20)
INSERT [dbo].[DoDung] ([MaDD], [TenDD], [Gia], [MaLDD], [HinhDD], [SoLuong]) VALUES (N'DD10', N'Soda Bạc Hà', CAST(35000 AS Decimal(18, 0)), N'L5', N'image/SodaBacHa.jpg', 25)
INSERT [dbo].[DoDung] ([MaDD], [TenDD], [Gia], [MaLDD], [HinhDD], [SoLuong]) VALUES (N'DD11', N'Soda Việt Quất', CAST(35000 AS Decimal(18, 0)), N'L5', N'image/SodaVietQuat.jpg', 25)
INSERT [dbo].[DoDung] ([MaDD], [TenDD], [Gia], [MaLDD], [HinhDD], [SoLuong]) VALUES (N'DD12', N'C2', CAST(15000 AS Decimal(18, 0)), N'L1', N'image/C2.jpg', 50)
INSERT [dbo].[DoDung] ([MaDD], [TenDD], [Gia], [MaLDD], [HinhDD], [SoLuong]) VALUES (N'DD13', N'Sữa Nuti', CAST(15000 AS Decimal(18, 0)), N'L5', N'image/SuaNuti.png', 40)
INSERT [dbo].[DoDung] ([MaDD], [TenDD], [Gia], [MaLDD], [HinhDD], [SoLuong]) VALUES (N'DD14', N'Trà sữa', CAST(25000 AS Decimal(18, 0)), N'L5', N'image/tra-sua.jpeg', 30)
INSERT [dbo].[DoDung] ([MaDD], [TenDD], [Gia], [MaLDD], [HinhDD], [SoLuong]) VALUES (N'DD15', N'Bánh đậu xanh', CAST(20000 AS Decimal(18, 0)), N'L3', N'image/BanhDauXanh.jpg', 45)
GO
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [Gia], [DonViTinh]) VALUES (N'HH01', N'Đường', 12000.0000, N'kg')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [Gia], [DonViTinh]) VALUES (N'HH02', N'Cafe', 130000.0000, N'kg')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [Gia], [DonViTinh]) VALUES (N'HH03', N'Xoài', 30000.0000, N'kg')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [Gia], [DonViTinh]) VALUES (N'HH04', N'Dừa', 5000.0000, N'trái')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [Gia], [DonViTinh]) VALUES (N'HH05', N'CocaCola', 210000.0000, N'thùng')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [Gia], [DonViTinh]) VALUES (N'HH06', N'7up', 230000.0000, N'thùng')
GO
INSERT [dbo].[HH_NCC] ([MaHH], [MaNCC], [MaHH_NCC], [SoLuong]) VALUES (N'HH01', N'NCC3', N'M1', 50)
INSERT [dbo].[HH_NCC] ([MaHH], [MaNCC], [MaHH_NCC], [SoLuong]) VALUES (N'HH02', N'NCC1', N'M2', 60)
INSERT [dbo].[HH_NCC] ([MaHH], [MaNCC], [MaHH_NCC], [SoLuong]) VALUES (N'HH02', N'NCC2', N'M3', 55)
INSERT [dbo].[HH_NCC] ([MaHH], [MaNCC], [MaHH_NCC], [SoLuong]) VALUES (N'HH03', N'NCC6', N'M4', 25)
INSERT [dbo].[HH_NCC] ([MaHH], [MaNCC], [MaHH_NCC], [SoLuong]) VALUES (N'HH04', N'NCC7', N'M5', 36)
INSERT [dbo].[HH_NCC] ([MaHH], [MaNCC], [MaHH_NCC], [SoLuong]) VALUES (N'HH05', N'NCC4', N'M6', 10)
INSERT [dbo].[HH_NCC] ([MaHH], [MaNCC], [MaHH_NCC], [SoLuong]) VALUES (N'HH05', N'NCC5', N'M7', 10)
INSERT [dbo].[HH_NCC] ([MaHH], [MaNCC], [MaHH_NCC], [SoLuong]) VALUES (N'HH06', N'NCC4', N'M8', 10)
GO
INSERT [dbo].[HoaDon] ([MaHD], [NgayTaoHD], [TongTien], [MaKH], [MaUser]) VALUES (N'HD01', CAST(N'2023-10-06T00:00:00.000' AS DateTime), 200000.0000, N'KH01', N'NV03')
INSERT [dbo].[HoaDon] ([MaHD], [NgayTaoHD], [TongTien], [MaKH], [MaUser]) VALUES (N'HD02', CAST(N'2023-10-09T00:00:00.000' AS DateTime), 250000.0000, N'KH01', N'NV03')
INSERT [dbo].[HoaDon] ([MaHD], [NgayTaoHD], [TongTien], [MaKH], [MaUser]) VALUES (N'hd03', CAST(N'2023-10-11T00:00:00.000' AS DateTime), 2200000.0000, N'KH01', N'NV03')
INSERT [dbo].[HoaDon] ([MaHD], [NgayTaoHD], [TongTien], [MaKH], [MaUser]) VALUES (N'HD04', CAST(N'2023-10-23T16:54:38.000' AS DateTime), 160000.0000, N'KH01', N'NV03')
INSERT [dbo].[HoaDon] ([MaHD], [NgayTaoHD], [TongTien], [MaKH], [MaUser]) VALUES (N'HD05', CAST(N'2023-10-23T12:40:44.000' AS DateTime), 200000.0000, N'KH02', N'NV03')
INSERT [dbo].[HoaDon] ([MaHD], [NgayTaoHD], [TongTien], [MaKH], [MaUser]) VALUES (N'HD06', CAST(N'2023-10-23T16:59:54.000' AS DateTime), 210000.0000, N'KH02', N'NV03')
INSERT [dbo].[HoaDon] ([MaHD], [NgayTaoHD], [TongTien], [MaKH], [MaUser]) VALUES (N'HD07', CAST(N'2023-10-23T17:02:33.000' AS DateTime), 45000.0000, N'KH02', N'NV03')
INSERT [dbo].[HoaDon] ([MaHD], [NgayTaoHD], [TongTien], [MaKH], [MaUser]) VALUES (N'HD08', CAST(N'2023-10-23T17:06:50.000' AS DateTime), 20000.0000, N'KH02', N'NV03')
GO
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [SDT], [MaLoaiKH]) VALUES (N'KH01', N'Vũ Hoàng Phan', N'0388143327     ', N'L2')
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [SDT], [MaLoaiKH]) VALUES (N'KH02', N'Đặng Phạm Đình Chương', N'0383571443     ', N'L3')
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [SDT], [MaLoaiKH]) VALUES (N'KH03', N'Gia Phú', N'0396434712     ', N'L1')
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [SDT], [MaLoaiKH]) VALUES (N'KH04', N'Nguyễn Tấn Cường', N'0389572947     ', N'L1')
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [SDT], [MaLoaiKH]) VALUES (N'KH05', N'Thanh Thanh', N'0975421913     ', N'L2')
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [SDT], [MaLoaiKH]) VALUES (N'KH06', N'Đa Đa', N'0967633611     ', N'L3')
GO
INSERT [dbo].[LoaiDoDung] ([MaLoaiDD], [TenLoai], [MoTa]) VALUES (N'L1', N'Nước có ga', N'Những thức uống có ga trong thành phần')
INSERT [dbo].[LoaiDoDung] ([MaLoaiDD], [TenLoai], [MoTa]) VALUES (N'L2', N'Nước trái cây', N'Những thức uống được pha chế bằng trái cây')
INSERT [dbo].[LoaiDoDung] ([MaLoaiDD], [TenLoai], [MoTa]) VALUES (N'L3', N'Bánh ngọt', N'Những món ăn được làm từ bột mì và trứng')
INSERT [dbo].[LoaiDoDung] ([MaLoaiDD], [TenLoai], [MoTa]) VALUES (N'L4', N'Đồ ăn vặt', N'Những món thực phẩm được đóng gói ăn liền')
INSERT [dbo].[LoaiDoDung] ([MaLoaiDD], [TenLoai], [MoTa]) VALUES (N'L5', N'Đồ uống khác', N'Những món không thuộc L1 và L2')
GO
INSERT [dbo].[LoaiKhachHang] ([MaLoaiKH], [TenLoai], [GiamGia]) VALUES (N'L1', N'Khách quen', 0.1)
INSERT [dbo].[LoaiKhachHang] ([MaLoaiKH], [TenLoai], [GiamGia]) VALUES (N'L2', N'Khách thân thiết', 0.15)
INSERT [dbo].[LoaiKhachHang] ([MaLoaiKH], [TenLoai], [GiamGia]) VALUES (N'L3', N'Khách VIP', 0.2)
GO
SET IDENTITY_INSERT [dbo].[NgayLam] ON 

INSERT [dbo].[NgayLam] ([MaNL], [MaCLV], [MaUser], [NgayLamViec]) VALUES (1, N'2', N'NV02', N'25-10-2023')
INSERT [dbo].[NgayLam] ([MaNL], [MaCLV], [MaUser], [NgayLamViec]) VALUES (2, N'3', N'NV03', N'21-10-2023')
INSERT [dbo].[NgayLam] ([MaNL], [MaCLV], [MaUser], [NgayLamViec]) VALUES (3, N'1', N'NV04', N'25-10-2023')
INSERT [dbo].[NgayLam] ([MaNL], [MaCLV], [MaUser], [NgayLamViec]) VALUES (4, N'1', N'NV05', N'27-10-2023')
SET IDENTITY_INSERT [dbo].[NgayLam] OFF
GO
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SDT]) VALUES (N'NCC1', N'Buôn Mê Coffee', N'35/4A Ao Đôi, Bình Trị Đông, Quận Bình Tân, Tp Hồ Chí Minh ', N'0918555302     ')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SDT]) VALUES (N'NCC2', N'Drai Farm', N'xã Quảng Hiệp, huyện Cư M’gar, tỉnh DakLak', N'0956803447     ')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SDT]) VALUES (N'NCC3', N'Công Ty TNHH MTV Huỳnh Gia Khiêm', N'113 Lê Đại Hành, P. 6, Q. 11, Tp. Hồ Chí Minh', N'0985250038     ')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SDT]) VALUES (N'NCC4', N'Đại lý bia nước ngọt Khương Duу (TP.HCM)', N'44/3a 13 Đường TTH10, Khu phố 3, phường Tân Thới Hiệp, Quận 12, Tp Hồ Chí Minh', N'01633344084    ')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SDT]) VALUES (N'NCC5', N'Đại lý bia nước ngọt Vạn Hưng (TP.HCM)', N'702/1H Sư Vạn Hạnh, Phường 12, Quận 10, Tp Hồ Chí Minh', N'0938881257     ')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SDT]) VALUES (N'NCC6', N'
Nông Sản Galaxy Agro - Công Ty TNHH Galaxy Agro', N'
Số 14/16, Đường 990, Khu Phố 4, Phường Phú Hữu, Quận 9, Tp. Hồ Chí Minh', N'0983373877     ')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SDT]) VALUES (N'NCC7', N'Siêu Thị Vạn Phước', N'67/16 Bình Hưng Hòa B, Q. Bình Tân, Tp. Hồ Chí Minh', N'0899339611     ')
GO
INSERT [dbo].[User] ([MaUser], [TenUser], [DiaChi], [SDT], [PhanQuyen], [MatKhau], [activate]) VALUES (N'NV00', N'Hòa', N'DN', N'0123129310     ', 1, N'202cb962ac59075b964b07152d234b70', N'Yes')
INSERT [dbo].[User] ([MaUser], [TenUser], [DiaChi], [SDT], [PhanQuyen], [MatKhau], [activate]) VALUES (N'NV01', N'Nguyễn Tấn Hợp', N'DN', N'0123129310     ', 1, N'd9b1d7db4cd6e70935368a1efb10e377', N'Yes')
INSERT [dbo].[User] ([MaUser], [TenUser], [DiaChi], [SDT], [PhanQuyen], [MatKhau], [activate]) VALUES (N'NV02', N'Tú', N'DN', N'0123129310     ', 0, N'1cc39ffd758234422e1f75beadfc5fb2', N'Yes')
INSERT [dbo].[User] ([MaUser], [TenUser], [DiaChi], [SDT], [PhanQuyen], [MatKhau], [activate]) VALUES (N'NV03', N'Lê Bằng', N'Thủ Đức', N'0123129310     ', 0, N'202cb962ac59075b964b07152d234b70', N'Yes')
INSERT [dbo].[User] ([MaUser], [TenUser], [DiaChi], [SDT], [PhanQuyen], [MatKhau], [activate]) VALUES (N'NV04', N'Thanh Hoàng', N'TP. Hồ Chí Minh', N'0383579543     ', 0, N'202cb962ac59075b964b07152d234b70', N'Yes')
INSERT [dbo].[User] ([MaUser], [TenUser], [DiaChi], [SDT], [PhanQuyen], [MatKhau], [activate]) VALUES (N'NV05', N'Thị Hồng', N'TP. Hồ Chí Minh', N'0386743932     ', 0, N'202cb962ac59075b964b07152d234b70', N'Yes')
GO
ALTER TABLE [dbo].[ChiTietHoaDon]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietHoaDon_DoDung] FOREIGN KEY([MaDD])
REFERENCES [dbo].[DoDung] ([MaDD])
GO
ALTER TABLE [dbo].[ChiTietHoaDon] CHECK CONSTRAINT [FK_ChiTietHoaDon_DoDung]
GO
ALTER TABLE [dbo].[ChiTietHoaDon]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietHoaDon_HoaDon] FOREIGN KEY([MaHD])
REFERENCES [dbo].[HoaDon] ([MaHD])
GO
ALTER TABLE [dbo].[ChiTietHoaDon] CHECK CONSTRAINT [FK_ChiTietHoaDon_HoaDon]
GO
ALTER TABLE [dbo].[DD_HH]  WITH CHECK ADD  CONSTRAINT [FK_DD_HH_DoDung] FOREIGN KEY([MaDD])
REFERENCES [dbo].[DoDung] ([MaDD])
GO
ALTER TABLE [dbo].[DD_HH] CHECK CONSTRAINT [FK_DD_HH_DoDung]
GO
ALTER TABLE [dbo].[DD_HH]  WITH CHECK ADD  CONSTRAINT [FK_DD_HH_HangHoa] FOREIGN KEY([MaHH])
REFERENCES [dbo].[HangHoa] ([MaHH])
GO
ALTER TABLE [dbo].[DD_HH] CHECK CONSTRAINT [FK_DD_HH_HangHoa]
GO
ALTER TABLE [dbo].[DoDung]  WITH CHECK ADD  CONSTRAINT [FK_DoDung_LoaiDoDung] FOREIGN KEY([MaLDD])
REFERENCES [dbo].[LoaiDoDung] ([MaLoaiDD])
GO
ALTER TABLE [dbo].[DoDung] CHECK CONSTRAINT [FK_DoDung_LoaiDoDung]
GO
ALTER TABLE [dbo].[HH_NCC]  WITH CHECK ADD  CONSTRAINT [FK_HH_NCC_HangHoa] FOREIGN KEY([MaHH])
REFERENCES [dbo].[HangHoa] ([MaHH])
GO
ALTER TABLE [dbo].[HH_NCC] CHECK CONSTRAINT [FK_HH_NCC_HangHoa]
GO
ALTER TABLE [dbo].[HH_NCC]  WITH CHECK ADD  CONSTRAINT [FK_HH_NCC_NhaCungCap] FOREIGN KEY([MaNCC])
REFERENCES [dbo].[NhaCungCap] ([MaNCC])
GO
ALTER TABLE [dbo].[HH_NCC] CHECK CONSTRAINT [FK_HH_NCC_NhaCungCap]
GO
ALTER TABLE [dbo].[HoaDon]  WITH CHECK ADD  CONSTRAINT [FK_HoaDon_KhachHang] FOREIGN KEY([MaKH])
REFERENCES [dbo].[KhachHang] ([MaKH])
GO
ALTER TABLE [dbo].[HoaDon] CHECK CONSTRAINT [FK_HoaDon_KhachHang]
GO
ALTER TABLE [dbo].[HoaDon]  WITH CHECK ADD  CONSTRAINT [FK_HoaDon_User] FOREIGN KEY([MaUser])
REFERENCES [dbo].[User] ([MaUser])
GO
ALTER TABLE [dbo].[HoaDon] CHECK CONSTRAINT [FK_HoaDon_User]
GO
ALTER TABLE [dbo].[KhachHang]  WITH CHECK ADD  CONSTRAINT [FK_KhachHang_LoaiKhachHang] FOREIGN KEY([MaLoaiKH])
REFERENCES [dbo].[LoaiKhachHang] ([MaLoaiKH])
GO
ALTER TABLE [dbo].[KhachHang] CHECK CONSTRAINT [FK_KhachHang_LoaiKhachHang]
GO
ALTER TABLE [dbo].[NgayLam]  WITH CHECK ADD  CONSTRAINT [FK_NgayLam_CaLamViec] FOREIGN KEY([MaCLV])
REFERENCES [dbo].[CaLamViec] ([MaCLV])
GO
ALTER TABLE [dbo].[NgayLam] CHECK CONSTRAINT [FK_NgayLam_CaLamViec]
GO
ALTER TABLE [dbo].[NgayLam]  WITH CHECK ADD  CONSTRAINT [FK_NgayLam_User] FOREIGN KEY([MaUser])
REFERENCES [dbo].[User] ([MaUser])
GO
ALTER TABLE [dbo].[NgayLam] CHECK CONSTRAINT [FK_NgayLam_User]
GO
ALTER TABLE [dbo].[PhanHoiSuCo]  WITH CHECK ADD  CONSTRAINT [FK_PhanHoiSuCo_User] FOREIGN KEY([MaUser])
REFERENCES [dbo].[User] ([MaUser])
GO
ALTER TABLE [dbo].[PhanHoiSuCo] CHECK CONSTRAINT [FK_PhanHoiSuCo_User]
GO
/****** Object:  StoredProcedure [dbo].[ThongKe]    Script Date: 10/24/2023 3:52:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[ThongKe]
	@year int
as
begin
	select YEAR(NgayTaoHD) AS Years, SUM(TongTien) as Total
	FROM HoaDon
	where YEAR(NgayTaoHD) = @year
	group by YEAR(NgayTaoHD)
	order by YEAR(NgayTaoHD)
end
GO
USE [master]
GO
ALTER DATABASE [QuanLyCafe] SET  READ_WRITE 
GO
