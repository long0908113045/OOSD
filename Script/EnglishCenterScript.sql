USE [master]
GO
/****** Object:  Database [EnglishCenter]    Script Date: 7/18/2020 6:15:45 PM ******/
CREATE DATABASE [EnglishCenter]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'EnglishCenter', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\EnglishCenter.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'EnglishCenter_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\EnglishCenter_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [EnglishCenter] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [EnglishCenter].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [EnglishCenter] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [EnglishCenter] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [EnglishCenter] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [EnglishCenter] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [EnglishCenter] SET ARITHABORT OFF 
GO
ALTER DATABASE [EnglishCenter] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [EnglishCenter] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [EnglishCenter] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [EnglishCenter] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [EnglishCenter] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [EnglishCenter] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [EnglishCenter] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [EnglishCenter] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [EnglishCenter] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [EnglishCenter] SET  DISABLE_BROKER 
GO
ALTER DATABASE [EnglishCenter] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [EnglishCenter] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [EnglishCenter] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [EnglishCenter] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [EnglishCenter] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [EnglishCenter] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [EnglishCenter] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [EnglishCenter] SET RECOVERY FULL 
GO
ALTER DATABASE [EnglishCenter] SET  MULTI_USER 
GO
ALTER DATABASE [EnglishCenter] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [EnglishCenter] SET DB_CHAINING OFF 
GO
ALTER DATABASE [EnglishCenter] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [EnglishCenter] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [EnglishCenter] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'EnglishCenter', N'ON'
GO
ALTER DATABASE [EnglishCenter] SET QUERY_STORE = OFF
GO
USE [EnglishCenter]
GO
/****** Object:  Table [dbo].[NhanVien]    Script Date: 7/18/2020 6:15:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhanVien](
	[NhanVienId] [int] IDENTITY(1,1) NOT NULL,
	[Ma_NV] [nvarchar](50) NULL,
	[HoTen_NV] [nvarchar](50) NULL,
	[ChucVu] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[SDT_NV] [nvarchar](50) NULL,
	[CMND] [nvarchar](50) NOT NULL,
	[Birthday] [datetime] NULL,
	[TrangThai] [nvarchar](50) NULL,
 CONSTRAINT [PK_NhanVien] PRIMARY KEY CLUSTERED 
(
	[NhanVienId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[view_ListGiaoVien]    Script Date: 7/18/2020 6:15:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[view_ListGiaoVien]

AS
SELECT
  NhanVien.HoTen_NV,
  NhanVien.Ma_NV,
  NhanVien.NhanVienId
FROM NhanVien
WHERE NhanVien.ChucVu LIKE N'Giáo Viên%'
AND NhanVien.TrangThai LIKE '1';
GO
/****** Object:  Table [dbo].[KhoaHoc]    Script Date: 7/18/2020 6:15:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhoaHoc](
	[KhoaHocId] [int] IDENTITY(1,1) NOT NULL,
	[Ma_KH] [nvarchar](50) NULL,
	[Ten_KH] [nvarchar](100) NULL,
	[MoTa] [nvarchar](100) NULL,
	[TrangThai] [nvarchar](50) NULL,
 CONSTRAINT [PK_KhoaHoc] PRIMARY KEY CLUSTERED 
(
	[KhoaHocId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Levels]    Script Date: 7/18/2020 6:15:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Levels](
	[LevelsId] [int] IDENTITY(1,1) NOT NULL,
	[Ma_Level] [nvarchar](50) NULL,
	[Ten_Level] [nvarchar](50) NULL,
	[MoTa] [nvarchar](50) NULL,
	[TrangThai] [nvarchar](50) NULL,
 CONSTRAINT [PK_Level] PRIMARY KEY CLUSTERED 
(
	[LevelsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LopHoc]    Script Date: 7/18/2020 6:15:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LopHoc](
	[LopHocId] [int] IDENTITY(1,1) NOT NULL,
	[Ma_LH] [nvarchar](100) NULL,
	[Ten_LH] [nvarchar](50) NULL,
	[ThoiGianBatDau_LH] [date] NULL,
	[ThoiGianKetThuc_LH] [date] NULL,
	[HocPhi] [numeric](18, 0) NULL,
	[NhanVienId] [int] NULL,
	[KhoaHocId] [int] NULL,
	[LevelsId] [int] NULL,
	[SoBuoiHoc] [int] NULL,
	[KhungGioHoc] [nvarchar](max) NULL,
	[SoLuongHocVien] [int] NULL,
	[TrangThai] [nvarchar](50) NULL,
 CONSTRAINT [PK_LopHoc] PRIMARY KEY CLUSTERED 
(
	[LopHocId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_TimLopTheoGiaoVien]    Script Date: 7/18/2020 6:15:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fn_TimLopTheoGiaoVien] (@idgv int)
RETURNS TABLE
AS
  RETURN (SELECT
    LopHoc.LopHocId,
    LopHoc.Ma_LH,
    LopHoc.Ten_LH,
    NhanVien.HoTen_NV,
    KhoaHoc.Ten_KH,
    Levels.Ten_Level,
    LopHoc.HocPhi,
    LopHoc.SoBuoiHoc,
    LopHoc.KhungGioHoc,
    LopHoc.ThoiGianBatDau_LH,
    LopHoc.ThoiGianKetThuc_LH,
	LopHoc.SoLuongHocVien
  FROM LopHoc
  JOIN KhoaHoc
    ON KhoaHoc.KhoaHocId = LopHoc.KhoaHocId
  JOIN NhanVien
    ON NhanVien.NhanVienId = LopHoc.NhanVienId
  JOIN Levels
    ON Levels.LevelsId = LopHoc.LevelsId
  WHERE NhanVien.NhanVienId = @idgv
  AND LopHoc.TrangThai LIKE '1'
  )
GO
/****** Object:  Table [dbo].[HocVien]    Script Date: 7/18/2020 6:15:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HocVien](
	[HocVienId] [int] IDENTITY(1,1) NOT NULL,
	[Ma_HV] [nvarchar](50) NULL,
	[HoTen_HV] [nvarchar](50) NULL,
	[DiaChi_HV] [nvarchar](100) NULL,
	[Email_HV] [nvarchar](50) NULL,
	[SDT_HV] [nvarchar](50) NULL,
	[TrangThai] [nvarchar](50) NULL,
 CONSTRAINT [PK_Table_1] PRIMARY KEY CLUSTERED 
(
	[HocVienId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_ListHocVien]    Script Date: 7/18/2020 6:15:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[fn_ListHocVien]
(
)
RETURNS TABLE
AS
  RETURN (SELECT
    *
  FROM HocVien
  WHERE TrangThai LIKE '1')
GO
/****** Object:  View [dbo].[dsLop]    Script Date: 7/18/2020 6:15:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[dsLop]
AS
SELECT
  Ma_LH,
  Ten_LH,
  ThoiGianBatDau_LH,
  ThoiGianKetThuc_LH,
  HocPhi,
  SoBuoiHoc,
  KhungGioHoc
FROM LopHoc l
JOIN KhoaHoc k
  ON l.KhoaHocId = k.KhoaHocId
GO
/****** Object:  Table [dbo].[PhieuThu]    Script Date: 7/18/2020 6:15:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhieuThu](
	[PhieuThuId] [int] IDENTITY(1,1) NOT NULL,
	[NgayThanhToan] [date] NULL,
	[HocVienId] [int] NOT NULL,
	[LopHocId] [int] NOT NULL,
	[SoTien] [decimal](18, 0) NULL,
	[NhanVienId] [int] NULL,
	[PhuongThucThanhToanId] [int] NULL,
 CONSTRAINT [PK_PhieuThu] PRIMARY KEY CLUSTERED 
(
	[PhieuThuId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[dsHocVien]    Script Date: 7/18/2020 6:15:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[dsHocVien]

AS
SELECT
  h.Ma_HV,
  h.HoTen_HV,
  h.SDT_HV
FROM HocVien h
JOIN PhieuThu p
  ON h.HocVienId = p.HocVienId
  AND p.LopHocId = (SELECT
    LopHocId
  FROM LopHoc
  WHERE Ma_LH = 'LH_1')
GO
/****** Object:  UserDefinedFunction [dbo].[fn_ListLopHocTheoKhoaHoc]    Script Date: 7/18/2020 6:15:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[fn_ListLopHocTheoKhoaHoc] (@idkh int)
RETURNS TABLE
AS
  RETURN (SELECT
    LopHoc.LopHocId,
    LopHoc.Ma_LH,
    LopHoc.Ten_LH,
    NhanVien.HoTen_NV,
    KhoaHoc.Ten_KH,
    Levels.Ten_Level,
    LopHoc.HocPhi,
    LopHoc.SoBuoiHoc,
    LopHoc.KhungGioHoc,
    LopHoc.ThoiGianBatDau_LH,
    LopHoc.ThoiGianKetThuc_LH,
	LopHoc.SoLuongHocVien
  FROM LopHoc
  JOIN KhoaHoc
    ON KhoaHoc.KhoaHocId = LopHoc.KhoaHocId
  JOIN NhanVien
    ON NhanVien.NhanVienId = LopHoc.NhanVienId
  JOIN Levels
    ON Levels.LevelsId = LopHoc.LevelsId
  WHERE LopHoc.TrangThai LIKE '1'
  AND KhoaHoc.KhoaHocId = @idkh)
GO
/****** Object:  UserDefinedFunction [dbo].[fn_ListHocVienCuaLopHoc]    Script Date: 7/18/2020 6:15:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fn_ListHocVienCuaLopHoc] (@idlh int)
RETURNS TABLE
AS
  RETURN (SELECT
    s.Ma_HV,
    s.HoTen_HV,
    s.DiaChi_HV,
    s.Email_HV,
    s.SDT_HV
  FROM HocVien s
  JOIN PhieuThu p
    ON s.HocVienId = p.HocVienId
  WHERE p.LopHocId = @idlh
  AND s.TrangThai LIKE '1')
GO
/****** Object:  Table [dbo].[PhuongThucThanhToan]    Script Date: 7/18/2020 6:15:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhuongThucThanhToan](
	[PhuongThucThanhToanId] [int] IDENTITY(1,1) NOT NULL,
	[Ten_PTTT] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PhuongThucThanhToanId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_TimTenTrenPhieuThu]    Script Date: 7/18/2020 6:15:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fn_TimTenTrenPhieuThu] (@idlh int,
@ten nvarchar(50))
RETURNS TABLE
AS
  RETURN (SELECT
    p.PhieuThuId,
    s.Ma_HV,
    s.HoTen_HV,
    NhanVien.HoTen_NV,
    p.SoTien,
    PhuongThucThanhToan.Ten_PTTT,
    p.NgayThanhToan,
    s.HocVienId
  FROM HocVien s
  JOIN PhieuThu p
    ON s.HocVienId = p.HocVienId
  JOIN NhanVien
    ON NhanVien.NhanVienId = p.NhanVienId
	JOIN PhuongThucThanhToan
    ON p.PhuongThucThanhToanId = PhuongThucThanhToan.PhuongThucThanhToanId
  WHERE p.LopHocId = @idlh
  AND s.TrangThai LIKE '1'
  AND s.HoTen_HV LIKE '%' + @ten + '%')
GO
/****** Object:  UserDefinedFunction [dbo].[fn_LoadLevel]    Script Date: 7/18/2020 6:15:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fn_LoadLevel]
()
RETURNS TABLE
AS
  RETURN (SELECT
    *
  FROM Levels
  WHERE Levels.TrangThai LIKE '1')
GO
/****** Object:  UserDefinedFunction [dbo].[fn_ListNhanVien]    Script Date: 7/18/2020 6:15:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fn_ListNhanVien]
()
RETURNS TABLE
AS
  RETURN (SELECT
    *
  FROM NhanVien
  WHERE TrangThai LIKE '1');
GO
/****** Object:  UserDefinedFunction [dbo].[fn_ListKhoaHoc]    Script Date: 7/18/2020 6:15:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fn_ListKhoaHoc]
()
RETURNS TABLE
AS
  RETURN (SELECT
    *
  FROM KhoaHoc
  WHERE TrangThai LIKE '1');
GO
/****** Object:  UserDefinedFunction [dbo].[fn_ListLopHoc]    Script Date: 7/18/2020 6:15:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[fn_ListLopHoc]
()
RETURNS TABLE
AS
  RETURN (SELECT
    LopHoc.LopHocId,
    LopHoc.Ten_LH,
    NhanVien.HoTen_NV,
    KhoaHoc.Ten_KH,
    Levels.Ten_Level,
    LopHoc.HocPhi,
    LopHoc.SoBuoiHoc,
    LopHoc.KhungGioHoc,
    LopHoc.ThoiGianBatDau_LH,
    LopHoc.ThoiGianKetThuc_LH,
	LopHoc.SoLuongHocVien
  FROM LopHoc
  JOIN KhoaHoc
    ON KhoaHoc.KhoaHocId = LopHoc.KhoaHocId
  JOIN NhanVien
    ON NhanVien.NhanVienId = LopHoc.NhanVienId
  JOIN Levels
    ON Levels.LevelsId = LopHoc.LevelsId
  WHERE LopHoc.TrangThai LIKE '1')
GO
/****** Object:  UserDefinedFunction [dbo].[fn_ListPhieuThu]    Script Date: 7/18/2020 6:15:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fn_ListPhieuThu] (@idlh int)
RETURNS TABLE
AS
  RETURN (SELECT
    p.PhieuThuId,
    s.Ma_HV,
    s.HoTen_HV,
    NhanVien.HoTen_NV,
    p.SoTien,
    p.PhuongThucThanhToanId,
    p.NgayThanhToan,
    s.HocVienId
  FROM HocVien s
  JOIN PhieuThu p
    ON s.HocVienId = p.HocVienId
  JOIN NhanVien
    ON NhanVien.NhanVienId = p.NhanVienId
  WHERE p.LopHocId = @idlh
  AND s.TrangThai LIKE '1')
GO
/****** Object:  Table [dbo].[PhanQuyen]    Script Date: 7/18/2020 6:15:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhanQuyen](
	[PhanQuyenId] [int] IDENTITY(1,1) NOT NULL,
	[Ten_PhanQuyen] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_PhanQuyen] PRIMARY KEY CLUSTERED 
(
	[PhanQuyenId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TaikhoanGiaoVien]    Script Date: 7/18/2020 6:15:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaikhoanGiaoVien](
	[TaiKhoanGiaoVienId] [int] IDENTITY(1,1) NOT NULL,
	[NhanVienId] [int] NOT NULL,
	[Username] [nvarchar](50) NOT NULL,
	[ChucVu] [nvarchar](50) NOT NULL,
	[PassWords] [nvarchar](50) NULL,
	[TrangThai] [nvarchar](50) NULL,
	[PhanQuyenId] [int] NULL,
 CONSTRAINT [PK_TaikhoanGiaoVien] PRIMARY KEY CLUSTERED 
(
	[TaiKhoanGiaoVienId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TaiKhoanHocVien]    Script Date: 7/18/2020 6:15:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaiKhoanHocVien](
	[TaiKhoanHocVienId] [int] IDENTITY(1,1) NOT NULL,
	[HocVienId] [int] NOT NULL,
	[Username] [nvarchar](50) NOT NULL,
	[TrangThai] [nvarchar](50) NULL,
	[PassWords] [nvarchar](50) NOT NULL,
	[PhanQuyenId] [int] NULL,
 CONSTRAINT [PK_TaiKhoanHocVien] PRIMARY KEY CLUSTERED 
(
	[HocVienId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[HocVien] ON 

INSERT [dbo].[HocVien] ([HocVienId], [Ma_HV], [HoTen_HV], [DiaChi_HV], [Email_HV], [SDT_HV], [TrangThai]) VALUES (1, NULL, N'Nguyễn văn Luật', N'17/12/Phạm Văn Đồng', N'Luat@gmail.com', N'0561694257', N'1')
INSERT [dbo].[HocVien] ([HocVienId], [Ma_HV], [HoTen_HV], [DiaChi_HV], [Email_HV], [SDT_HV], [TrangThai]) VALUES (2, NULL, N'Đào Bá Ngôn', N'18/2/Điện Biên Phủ', N'Ngon@gmail.com', N'0150315849', N'1')
INSERT [dbo].[HocVien] ([HocVienId], [Ma_HV], [HoTen_HV], [DiaChi_HV], [Email_HV], [SDT_HV], [TrangThai]) VALUES (3, NULL, N'Phạm Thị Xuân Hương', N'17/8/Hồ Xuân Hương', N'Huong@gmail.com', N'0125496875', N'1')
INSERT [dbo].[HocVien] ([HocVienId], [Ma_HV], [HoTen_HV], [DiaChi_HV], [Email_HV], [SDT_HV], [TrangThai]) VALUES (4, NULL, N'Phạm Thị Mai', N'145/2/Bái Đính', N'mai@gmail.com', N'02596487632', N'1')
SET IDENTITY_INSERT [dbo].[HocVien] OFF
GO
SET IDENTITY_INSERT [dbo].[KhoaHoc] ON 

INSERT [dbo].[KhoaHoc] ([KhoaHocId], [Ma_KH], [Ten_KH], [MoTa], [TrangThai]) VALUES (1, NULL, N'giao tiếp', N'Học Nói Tiếng Anh cùng Giáo Viên Nước Ngoài', N'1')
INSERT [dbo].[KhoaHoc] ([KhoaHocId], [Ma_KH], [Ten_KH], [MoTa], [TrangThai]) VALUES (2, NULL, N'Toiec', N'Luyện thi toiec 990', N'1')
INSERT [dbo].[KhoaHoc] ([KhoaHocId], [Ma_KH], [Ten_KH], [MoTa], [TrangThai]) VALUES (3, NULL, N'Ielts', N'Luyện thị ielts', N'1')
INSERT [dbo].[KhoaHoc] ([KhoaHocId], [Ma_KH], [Ten_KH], [MoTa], [TrangThai]) VALUES (4, NULL, N'Căn bản', N'Học căn bản mất gốc', N'1')
SET IDENTITY_INSERT [dbo].[KhoaHoc] OFF
GO
SET IDENTITY_INSERT [dbo].[Levels] ON 

INSERT [dbo].[Levels] ([LevelsId], [Ma_Level], [Ten_Level], [MoTa], [TrangThai]) VALUES (1, NULL, N'cơ bản', N'Cho học viên chưa biết gì hoặc mất gốc', N'1')
INSERT [dbo].[Levels] ([LevelsId], [Ma_Level], [Ten_Level], [MoTa], [TrangThai]) VALUES (2, NULL, N'Nâng cao', N'Cho các học viên đã có căn bản', N'1')
SET IDENTITY_INSERT [dbo].[Levels] OFF
GO
SET IDENTITY_INSERT [dbo].[LopHoc] ON 

INSERT [dbo].[LopHoc] ([LopHocId], [Ma_LH], [Ten_LH], [ThoiGianBatDau_LH], [ThoiGianKetThuc_LH], [HocPhi], [NhanVienId], [KhoaHocId], [LevelsId], [SoBuoiHoc], [KhungGioHoc], [SoLuongHocVien], [TrangThai]) VALUES (1, NULL, N'Lớp 1', CAST(N'2020-01-27' AS Date), CAST(N'2020-07-15' AS Date), CAST(3000000 AS Numeric(18, 0)), 3, 1, 1, 42, N'246', 3, N'1')
INSERT [dbo].[LopHoc] ([LopHocId], [Ma_LH], [Ten_LH], [ThoiGianBatDau_LH], [ThoiGianKetThuc_LH], [HocPhi], [NhanVienId], [KhoaHocId], [LevelsId], [SoBuoiHoc], [KhungGioHoc], [SoLuongHocVien], [TrangThai]) VALUES (2, NULL, N'Toiec 1', CAST(N'2020-01-27' AS Date), CAST(N'2020-07-15' AS Date), CAST(4500000 AS Numeric(18, 0)), 5, 2, 1, 50, N'246', 3, N'1')
INSERT [dbo].[LopHoc] ([LopHocId], [Ma_LH], [Ten_LH], [ThoiGianBatDau_LH], [ThoiGianKetThuc_LH], [HocPhi], [NhanVienId], [KhoaHocId], [LevelsId], [SoBuoiHoc], [KhungGioHoc], [SoLuongHocVien], [TrangThai]) VALUES (3, NULL, N'Toiec 1', CAST(N'2020-01-27' AS Date), CAST(N'2020-07-15' AS Date), CAST(4500000 AS Numeric(18, 0)), 3, 2, 1, 50, N'357', 3, N'1')
SET IDENTITY_INSERT [dbo].[LopHoc] OFF
GO
SET IDENTITY_INSERT [dbo].[NhanVien] ON 

INSERT [dbo].[NhanVien] ([NhanVienId], [Ma_NV], [HoTen_NV], [ChucVu], [Email], [SDT_NV], [CMND], [Birthday], [TrangThai]) VALUES (1, NULL, N'Hồ Phước Việt Long', N'Quản Lý', N'longmap@gmail.com', N'0614445556', N'061445', CAST(N'1999-01-01T00:00:00.000' AS DateTime), N'1')
INSERT [dbo].[NhanVien] ([NhanVienId], [Ma_NV], [HoTen_NV], [ChucVu], [Email], [SDT_NV], [CMND], [Birthday], [TrangThai]) VALUES (2, NULL, N'Nguyễn Thị Thanh Ngân', N'Kế Toán', N'Ngan@gmail.com', N'0614445556', N'015666', CAST(N'1999-06-17T15:20:44.000' AS DateTime), N'1')
INSERT [dbo].[NhanVien] ([NhanVienId], [Ma_NV], [HoTen_NV], [ChucVu], [Email], [SDT_NV], [CMND], [Birthday], [TrangThai]) VALUES (3, NULL, N'Nguyễn Trần Thanh Trúc', N'Giáo Viên', N'Truc@gmail.com', N'0122164894', N'164894', CAST(N'1999-07-16T11:07:17.000' AS DateTime), N'1')
INSERT [dbo].[NhanVien] ([NhanVienId], [Ma_NV], [HoTen_NV], [ChucVu], [Email], [SDT_NV], [CMND], [Birthday], [TrangThai]) VALUES (4, NULL, N'Đào Sơn Tùng', N'Nhân Viên', N'Tung@gmail.com', N'0126498894', N'012894', CAST(N'1999-07-09T11:08:45.000' AS DateTime), N'1')
INSERT [dbo].[NhanVien] ([NhanVienId], [Ma_NV], [HoTen_NV], [ChucVu], [Email], [SDT_NV], [CMND], [Birthday], [TrangThai]) VALUES (5, NULL, N'Phùng Thị Xuân Quyên', N'Giáo Viên', N'Quyen@gmail.com', N'023649518', N'36495', CAST(N'1999-07-16T11:20:24.000' AS DateTime), N'1')
INSERT [dbo].[NhanVien] ([NhanVienId], [Ma_NV], [HoTen_NV], [ChucVu], [Email], [SDT_NV], [CMND], [Birthday], [TrangThai]) VALUES (6, NULL, N'Nguyễn Huỳnh Như', N'Giáo Viên', N'nhu123@gmail.com', N'0123456', N'3025479', CAST(N'1999-10-25T17:09:40.000' AS DateTime), N'1')
INSERT [dbo].[NhanVien] ([NhanVienId], [Ma_NV], [HoTen_NV], [ChucVu], [Email], [SDT_NV], [CMND], [Birthday], [TrangThai]) VALUES (7, NULL, N'Phạm Ngọc Huỳnh Minh', N'Kế Toán', N'minhcho@gmail.com', N'023456', N'2014578', CAST(N'1999-02-02T17:10:56.000' AS DateTime), N'1')
INSERT [dbo].[NhanVien] ([NhanVienId], [Ma_NV], [HoTen_NV], [ChucVu], [Email], [SDT_NV], [CMND], [Birthday], [TrangThai]) VALUES (8, NULL, N'Đỗ Thị Thanh Ngân', N'Giáo Viên', N'ngan2911@gmail.com', N'123456', N'0235689', CAST(N'1994-05-23T17:19:45.000' AS DateTime), N'1')
INSERT [dbo].[NhanVien] ([NhanVienId], [Ma_NV], [HoTen_NV], [ChucVu], [Email], [SDT_NV], [CMND], [Birthday], [TrangThai]) VALUES (9, NULL, N'a', N'Giáo Viên', N'ab@gmail.com', N'123456', N'02357945', CAST(N'1999-11-12T00:00:00.000' AS DateTime), N'0')
INSERT [dbo].[NhanVien] ([NhanVienId], [Ma_NV], [HoTen_NV], [ChucVu], [Email], [SDT_NV], [CMND], [Birthday], [TrangThai]) VALUES (10, NULL, N'Huỳnh Thanh Xuân', N'Giáo Viên', N'xuan@gmail.com', N'0123456', N'021478546', CAST(N'1999-02-25T00:00:00.000' AS DateTime), N'1')
INSERT [dbo].[NhanVien] ([NhanVienId], [Ma_NV], [HoTen_NV], [ChucVu], [Email], [SDT_NV], [CMND], [Birthday], [TrangThai]) VALUES (11, NULL, N'Phan Thị Ngọc Tuyền', N'Giáo Viên', N'tuyenphan2502@gmail.com', N'0123456', N'789456', CAST(N'1999-02-25T18:08:52.000' AS DateTime), N'1')
SET IDENTITY_INSERT [dbo].[NhanVien] OFF
GO
SET IDENTITY_INSERT [dbo].[PhanQuyen] ON 

INSERT [dbo].[PhanQuyen] ([PhanQuyenId], [Ten_PhanQuyen]) VALUES (1, N'Quản Lý')
INSERT [dbo].[PhanQuyen] ([PhanQuyenId], [Ten_PhanQuyen]) VALUES (2, N'Giáo Viên')
INSERT [dbo].[PhanQuyen] ([PhanQuyenId], [Ten_PhanQuyen]) VALUES (3, N'Kế Toán')
SET IDENTITY_INSERT [dbo].[PhanQuyen] OFF
GO
SET IDENTITY_INSERT [dbo].[PhieuThu] ON 

INSERT [dbo].[PhieuThu] ([PhieuThuId], [NgayThanhToan], [HocVienId], [LopHocId], [SoTien], [NhanVienId], [PhuongThucThanhToanId]) VALUES (1, CAST(N'2020-07-16' AS Date), 1, 1, CAST(3000000 AS Decimal(18, 0)), 1, 2)
INSERT [dbo].[PhieuThu] ([PhieuThuId], [NgayThanhToan], [HocVienId], [LopHocId], [SoTien], [NhanVienId], [PhuongThucThanhToanId]) VALUES (2, NULL, 2, 1, NULL, 1, NULL)
INSERT [dbo].[PhieuThu] ([PhieuThuId], [NgayThanhToan], [HocVienId], [LopHocId], [SoTien], [NhanVienId], [PhuongThucThanhToanId]) VALUES (3, CAST(N'2020-07-16' AS Date), 1, 2, CAST(4275000 AS Decimal(18, 0)), 1, 1)
SET IDENTITY_INSERT [dbo].[PhieuThu] OFF
GO
SET IDENTITY_INSERT [dbo].[PhuongThucThanhToan] ON 

INSERT [dbo].[PhuongThucThanhToan] ([PhuongThucThanhToanId], [Ten_PTTT]) VALUES (1, N'Tien mat')
INSERT [dbo].[PhuongThucThanhToan] ([PhuongThucThanhToanId], [Ten_PTTT]) VALUES (2, N'The')
SET IDENTITY_INSERT [dbo].[PhuongThucThanhToan] OFF
GO
SET IDENTITY_INSERT [dbo].[TaikhoanGiaoVien] ON 

INSERT [dbo].[TaikhoanGiaoVien] ([TaiKhoanGiaoVienId], [NhanVienId], [Username], [ChucVu], [PassWords], [TrangThai], [PhanQuyenId]) VALUES (1, 1, N'longmap@gmail.com', N'Quản Lý', N'123456789', N'1', 1)
INSERT [dbo].[TaikhoanGiaoVien] ([TaiKhoanGiaoVienId], [NhanVienId], [Username], [ChucVu], [PassWords], [TrangThai], [PhanQuyenId]) VALUES (2, 9, N'ab@gmail.com', N'Giáo Viên', N'123456', N'0', 2)
INSERT [dbo].[TaikhoanGiaoVien] ([TaiKhoanGiaoVienId], [NhanVienId], [Username], [ChucVu], [PassWords], [TrangThai], [PhanQuyenId]) VALUES (3, 11, N'tuyenphan2502@gmail.com', N'Giáo Viên', N'0123456', N'1', 2)
SET IDENTITY_INSERT [dbo].[TaikhoanGiaoVien] OFF
GO
ALTER TABLE [dbo].[LopHoc]  WITH CHECK ADD  CONSTRAINT [fk_LH_KH] FOREIGN KEY([KhoaHocId])
REFERENCES [dbo].[KhoaHoc] ([KhoaHocId])
GO
ALTER TABLE [dbo].[LopHoc] CHECK CONSTRAINT [fk_LH_KH]
GO
ALTER TABLE [dbo].[LopHoc]  WITH CHECK ADD  CONSTRAINT [fk_LH_LV] FOREIGN KEY([LevelsId])
REFERENCES [dbo].[Levels] ([LevelsId])
GO
ALTER TABLE [dbo].[LopHoc] CHECK CONSTRAINT [fk_LH_LV]
GO
ALTER TABLE [dbo].[LopHoc]  WITH CHECK ADD  CONSTRAINT [fk_LH_NV] FOREIGN KEY([NhanVienId])
REFERENCES [dbo].[NhanVien] ([NhanVienId])
GO
ALTER TABLE [dbo].[LopHoc] CHECK CONSTRAINT [fk_LH_NV]
GO
ALTER TABLE [dbo].[PhieuThu]  WITH CHECK ADD  CONSTRAINT [FK_PhuongThucThanhToan] FOREIGN KEY([PhuongThucThanhToanId])
REFERENCES [dbo].[PhuongThucThanhToan] ([PhuongThucThanhToanId])
GO
ALTER TABLE [dbo].[PhieuThu] CHECK CONSTRAINT [FK_PhuongThucThanhToan]
GO
ALTER TABLE [dbo].[PhieuThu]  WITH CHECK ADD  CONSTRAINT [fk_PT_HV] FOREIGN KEY([HocVienId])
REFERENCES [dbo].[HocVien] ([HocVienId])
GO
ALTER TABLE [dbo].[PhieuThu] CHECK CONSTRAINT [fk_PT_HV]
GO
ALTER TABLE [dbo].[PhieuThu]  WITH CHECK ADD  CONSTRAINT [fk_PT_LH] FOREIGN KEY([LopHocId])
REFERENCES [dbo].[LopHoc] ([LopHocId])
GO
ALTER TABLE [dbo].[PhieuThu] CHECK CONSTRAINT [fk_PT_LH]
GO
ALTER TABLE [dbo].[PhieuThu]  WITH CHECK ADD  CONSTRAINT [fk_PT_NV] FOREIGN KEY([NhanVienId])
REFERENCES [dbo].[NhanVien] ([NhanVienId])
GO
ALTER TABLE [dbo].[PhieuThu] CHECK CONSTRAINT [fk_PT_NV]
GO
ALTER TABLE [dbo].[TaikhoanGiaoVien]  WITH CHECK ADD  CONSTRAINT [fk_PQ_GV] FOREIGN KEY([PhanQuyenId])
REFERENCES [dbo].[PhanQuyen] ([PhanQuyenId])
GO
ALTER TABLE [dbo].[TaikhoanGiaoVien] CHECK CONSTRAINT [fk_PQ_GV]
GO
ALTER TABLE [dbo].[TaikhoanGiaoVien]  WITH CHECK ADD  CONSTRAINT [fk_TKGV_GV] FOREIGN KEY([NhanVienId])
REFERENCES [dbo].[NhanVien] ([NhanVienId])
GO
ALTER TABLE [dbo].[TaikhoanGiaoVien] CHECK CONSTRAINT [fk_TKGV_GV]
GO
ALTER TABLE [dbo].[TaiKhoanHocVien]  WITH CHECK ADD  CONSTRAINT [fk_PQ_HV] FOREIGN KEY([PhanQuyenId])
REFERENCES [dbo].[PhanQuyen] ([PhanQuyenId])
GO
ALTER TABLE [dbo].[TaiKhoanHocVien] CHECK CONSTRAINT [fk_PQ_HV]
GO
ALTER TABLE [dbo].[TaiKhoanHocVien]  WITH CHECK ADD  CONSTRAINT [fk_TK_HV] FOREIGN KEY([HocVienId])
REFERENCES [dbo].[HocVien] ([HocVienId])
GO
ALTER TABLE [dbo].[TaiKhoanHocVien] CHECK CONSTRAINT [fk_TK_HV]
GO
/****** Object:  StoredProcedure [dbo].[sp_CapNhatPhieuThu]    Script Date: 7/18/2020 6:15:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[sp_CapNhatPhieuThu] @idpt int,
@ngaythanhtoan smalldatetime,
@sotien numeric(18, 0),
@idhv int,
@idlh int,
@idnv int,
@idpttt int
AS
BEGIN
  BEGIN TRY
    BEGIN TRAN;
      UPDATE PhieuThu
      SET NgayThanhToan = @ngaythanhtoan,
          SoTien = @sotien,
          NhanVienId = @idnv,
		  PhuongThucThanhToanId = @idpttt 
      WHERE HocVienId = @idhv
      AND LopHocId = @idlh
    COMMIT TRAN;
  END TRY
  BEGIN CATCH
    ROLLBACK TRAN
  END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[sp_demSoLuong]    Script Date: 7/18/2020 6:15:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[sp_demSoLuong] @lopHocId int = 0
AS

  SELECT
    COUNT(*)
  FROM PhieuThu p
  JOIN LopHoc l
    ON p.LopHocId = l.LopHocId
  WHERE l.LopHocId = @lopHocId;
GO
/****** Object:  StoredProcedure [dbo].[sp_getHocPhi]    Script Date: 7/18/2020 6:15:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[sp_getHocPhi] @lopHocId int = 0
AS

 return( SELECT  LopHoc.HocPhi from LopHoc where LopHoc.LopHocId = @lopHocId)
  
GO
/****** Object:  StoredProcedure [dbo].[sp_KiemTraTaiKhoanHV]    Script Date: 7/18/2020 6:15:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_KiemTraTaiKhoanHV] (@idpq int OUTPUT,
@idhv int OUTPUT,
@name nvarchar(100),
@pass nvarchar(100))
AS
BEGIN
  SELECT
    @idpq = PhanQuyenId,
    @idhv = HocVienId
  FROM TaiKhoanHocVien
  WHERE Username LIKE @name
  AND PassWords LIKE @pass
END
GO
/****** Object:  StoredProcedure [dbo].[sp_KiemTraTaiKhoanNV]    Script Date: 7/18/2020 6:15:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_KiemTraTaiKhoanNV] (@idpq int OUTPUT,
@idnv int OUTPUT,
@name nvarchar(100),
@pass nvarchar(100),
@chucvu nvarchar(100))
AS
BEGIN
  SELECT
    @idpq = PhanQuyenId,
    @idnv = NhanVienId
  FROM TaikhoanGiaoVien
  WHERE Username LIKE @name
  AND PassWords LIKE @pass
  AND ChucVu LIKE @chucvu
END
GO
/****** Object:  StoredProcedure [dbo].[sp_SuaHocVien]    Script Date: 7/18/2020 6:15:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[sp_SuaHocVien] @idhv int,
@hoten nvarchar(50),
@diachi nvarchar(100),
@email nvarchar(50),
@sdt nvarchar(50)
AS
BEGIN
  BEGIN TRY
    BEGIN TRAN;

      UPDATE HocVien
      SET HoTen_HV = @hoten,
          DiaChi_HV = @diachi,
          Email_HV = @email,
          SDT_HV = @sdt
      WHERE HocVienId = @idhv
    COMMIT TRAN;
  END TRY
  BEGIN CATCH
    ROLLBACK TRAN
  END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[sp_SuaKhoaHoc]    Script Date: 7/18/2020 6:15:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_SuaKhoaHoc] @id_KH int,

@tenkh nvarchar(100),
@mota nvarchar(100)
AS
BEGIN
  BEGIN TRY
    BEGIN TRAN;

      SET IDENTITY_INSERT KhoaHoc OFF;
      UPDATE KhoaHoc
      SET Ten_KH = @tenkh,
          MoTa = @mota
      WHERE KhoaHocId = @id_KH
    COMMIT TRAN;
  END TRY
  BEGIN CATCH
    ROLLBACK TRAN
  END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[sp_SuaLevel]    Script Date: 7/18/2020 6:15:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_SuaLevel] @idlv int,
@mota nvarchar(50),
@tenlv nvarchar(50)
AS
BEGIN
  BEGIN TRY
    BEGIN TRAN;

      SET IDENTITY_INSERT Levels OFF;
      UPDATE Levels
      SET Ten_Level = @tenlv,
          MoTa = @mota
      WHERE LevelsId = @idlv
    COMMIT TRAN;
  END TRY
  BEGIN CATCH
    ROLLBACK TRAN
  END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[sp_SuaLopHoc]    Script Date: 7/18/2020 6:15:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[sp_SuaLopHoc] @lopHocID int,
@tenlh nvarchar(100),
@thoigianbatdau smalldatetime,
@thoigianketthuc smalldatetime,
@hocphi numeric(18, 0),
@idnv int,
@idkh int,
@idlv int,
@sobuoihoc int,
@khunggiohoc nvarchar(max),
@soluonghocvien int
AS
BEGIN
  BEGIN TRY
    BEGIN TRAN;

      UPDATE LopHoc
      SET Ten_LH = @tenlh,
          ThoiGianBatDau_LH = @thoigianbatdau,
          ThoiGianKetThuc_LH = @thoigianketthuc,
          HocPhi = @hocphi,
          NhanVienId = @idnv,
          KhoaHocId = @idkh,
          LevelsId = @idlv,
          SoBuoiHoc = @sobuoihoc,
          KhungGioHoc = @khunggiohoc,
		  SoLuongHocVien = @soluonghocvien
      WHERE LopHocId = @lopHocID
    COMMIT TRAN;
  END TRY
  BEGIN CATCH
    ROLLBACK TRAN
  END CATCH

END
GO
/****** Object:  StoredProcedure [dbo].[sp_SuaNhanVien]    Script Date: 7/18/2020 6:15:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_SuaNhanVien] @id_nv int,
@hoten nvarchar(50),
@chucvu nvarchar(50),
@email nvarchar(50),
@sdt nvarchar(50),
@cmnd nvarchar(50),
@ngaysinh datetime
AS
BEGIN
  BEGIN TRY
    BEGIN TRAN;

      SET IDENTITY_INSERT NhanVien OFF;
      UPDATE NhanVien
      SET HoTen_NV = @hoten,
          ChucVu = @chucvu,
          Email = @email,
          SDT_NV = @sdt,
          CMND = @cmnd,
          Birthday = @ngaysinh
      WHERE NhanVienId = @id_nv;
    COMMIT TRAN;
  END TRY
  BEGIN CATCH
    ROLLBACK TRAN
  END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[sp_ThemHocVien]    Script Date: 7/18/2020 6:15:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[sp_ThemHocVien] @hoten nvarchar(50),
@diachi nvarchar(100),
@email nvarchar(50),
@sdt nvarchar(50)
AS
BEGIN
  BEGIN TRY
    BEGIN TRAN;

      SET IDENTITY_INSERT HocVien OFF;
      INSERT INTO HocVien (HoTen_HV, DiaChi_HV, Email_HV, SDT_HV, TrangThai)
        VALUES (@hoten, @diachi, @email, @sdt, 1);
    COMMIT TRAN;
  END TRY
  BEGIN CATCH
    ROLLBACK TRAN
  END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[sp_ThemKhoaHoc]    Script Date: 7/18/2020 6:15:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[sp_ThemKhoaHoc] @tenkh nvarchar(100),
@mota nvarchar(100)
AS
BEGIN
  IF (EXISTS (SELECT
      *
    FROM KhoaHoc
    WHERE (Ten_KH LIKE @tenkh)
    AND TrangThai LIKE '1')
    )
    RETURN -1;
  ELSE
  BEGIN TRY
    BEGIN TRAN;

      SET IDENTITY_INSERT KhoaHoc OFF;
      INSERT INTO KhoaHoc (Ten_KH, MoTa, TrangThai)
        VALUES (@tenkh, @mota, 1);
    COMMIT TRAN;
  END TRY
  BEGIN CATCH
    ROLLBACK TRAN
  END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[sp_ThemLevel]    Script Date: 7/18/2020 6:15:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[sp_ThemLevel] @tenlv nvarchar(50),
@mota nvarchar(50)
AS
BEGIN
  IF (EXISTS (SELECT
      *
    FROM Levels
    WHERE (Ten_Level LIKE @tenlv)
    AND TrangThai LIKE '1')
    )
    RETURN -1;
  ELSE
  BEGIN TRY
    BEGIN TRAN;

      SET IDENTITY_INSERT Levels OFF;
      INSERT INTO Levels (Ten_Level, MoTa, TrangThai)
        VALUES (@tenlv, @mota, 1);
    COMMIT TRAN;
  END TRY
  BEGIN CATCH
    ROLLBACK TRAN
  END CATCH

END
GO
/****** Object:  StoredProcedure [dbo].[sp_ThemLopHoc]    Script Date: 7/18/2020 6:15:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[sp_ThemLopHoc] @tenlh nvarchar(100),
@thoigianbatdau smalldatetime,
@thoigianketthuc smalldatetime,
@hocphi numeric(18, 0),
@idnv int,
@idkh int,
@idlv int,
@sobuoihoc int,
@khunggiohoc nvarchar(100),
@soluonghocvien int
AS
BEGIN
  SET IDENTITY_INSERT LopHoc OFF;
  INSERT INTO LopHoc (Ten_LH, ThoiGianBatDau_LH, ThoiGianKetThuc_LH, HocPhi, NhanVienId
  , KhoaHocId, LevelsId, SoBuoiHoc, KhungGioHoc, SoLuongHocVien, TrangThai)
    VALUES (@tenlh, @thoigianbatdau, @thoigianketthuc, @hocphi, @idnv, @idkh, @idlv, @sobuoihoc, @khunggiohoc, @soluonghocvien, 1);
END
GO
/****** Object:  StoredProcedure [dbo].[sp_ThemNhanVien]    Script Date: 7/18/2020 6:15:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_ThemNhanVien] @hoten nvarchar(50),
@chucvu nvarchar(50),
@email nvarchar(50),
@sdt nvarchar(50),
@cmnd nvarchar(50),
@ngaysinh datetime

AS
BEGIN
  IF (EXISTS (SELECT
      *
    FROM NhanVien
    WHERE CMND = @cmnd
    AND TrangThai LIKE '1')
    )
    RETURN -1;
  ELSE
  BEGIN TRY
    BEGIN TRAN;

      SET IDENTITY_INSERT NhanVien OFF;
      INSERT INTO NhanVien (HoTen_NV, ChucVu, Email, SDT_NV, CMND, Birthday, TrangThai)
        VALUES (@hoten, @chucvu, @email, @sdt, @cmnd, @ngaysinh, 1);
    COMMIT TRAN;
  END TRY
  BEGIN CATCH
    ROLLBACK TRAN
  END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[sp_ThemPhieuThu]    Script Date: 7/18/2020 6:15:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[sp_ThemPhieuThu] @idhv int,
@idlh int,
@idnv int
AS
BEGIN
  IF (EXISTS (SELECT
      *
    FROM PhieuThu
    WHERE HocVienId = @idhv
    AND LopHocId = @idlh)
    )
    RETURN -1;

  ELSE
  BEGIN TRY
    BEGIN TRAN;

      SET IDENTITY_INSERT PhieuThu OFF;
      INSERT INTO PhieuThu (HocVienId, LopHocId, NhanVienId)
        VALUES (@idhv, @idlh, @idnv);
    COMMIT TRAN;
  END TRY
  BEGIN CATCH
    ROLLBACK TRAN
  END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[sp_TimHocVienTheoTen]    Script Date: 7/18/2020 6:15:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_TimHocVienTheoTen] @ten nvarchar(50)
AS
  SELECT
    *
  FROM HocVien
  WHERE UPPER(HocVien.HoTen_HV) LIKE '%' + @ten + '%'
  AND TrangThai LIKE '1'
GO
/****** Object:  StoredProcedure [dbo].[sp_TimNhanVienTheoTen]    Script Date: 7/18/2020 6:15:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_TimNhanVienTheoTen] @ten nvarchar(50),
@chucvu nvarchar(50) = NULL
AS
BEGIN
  IF (@chucvu IS NULL)
    SELECT
      *
    FROM NhanVien
    WHERE UPPER(NhanVien.HoTen_NV) LIKE '%' + @ten + '%';
  ELSE
    SELECT
      *
    FROM NhanVien
    WHERE UPPER(NhanVien.HoTen_NV) LIKE '%' + @ten + '%'
    AND NhanVien.ChucVu LIKE @chucvu
END
GO
/****** Object:  StoredProcedure [dbo].[sp_XoaHocVien]    Script Date: 7/18/2020 6:15:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_XoaHocVien] @id_hv int
AS
  UPDATE HocVien
  SET TrangThai = '0'
  WHERE HocVienId = @id_hv;
GO
/****** Object:  StoredProcedure [dbo].[sp_XoaKhoaHoc]    Script Date: 7/18/2020 6:15:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_XoaKhoaHoc] @id_kh int
AS
  UPDATE KhoaHoc
  SET TrangThai = '0'
  WHERE KhoaHocId = @id_kh
GO
/****** Object:  StoredProcedure [dbo].[sp_XoaLevel]    Script Date: 7/18/2020 6:15:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_XoaLevel] @idlv int
AS
  UPDATE Levels
  SET TrangThai = '0'
  WHERE Levels.LevelsId = @idlv;
GO
/****** Object:  StoredProcedure [dbo].[sp_XoaLopHoc]    Script Date: 7/18/2020 6:15:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_XoaLopHoc] @idlh int
AS
  UPDATE LopHoc
  SET TrangThai = '0'
  WHERE LopHocId = @idlh;
GO
/****** Object:  StoredProcedure [dbo].[sp_XoaNhanVien]    Script Date: 7/18/2020 6:15:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_XoaNhanVien] @id_nv int
AS
  UPDATE NhanVien
  SET TrangThai = '0'
  WHERE NhanVienId = @id_nv;
GO
USE [master]
GO
ALTER DATABASE [EnglishCenter] SET  READ_WRITE 
GO
