USE [EnglishCenter]
GO
/****** Object:  UserDefinedFunction [dbo].[sp_KTTaiKhoan]    Script Date: 14/07/2020 11:09:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[sp_KTTaiKhoan]
(
	@id int,
	@manv nvarchar(100),
	@chucvu nvarchar(100)
)
returns varchar(5)
as
begin
	declare @ketqua varchar(5)
	set @ketqua='False';
	if(exists (select * from TaikhoanGiaoVien t
	where t.ChucVu= @chucvu
	and t.NhanVienId=@id
	and t.Username=@manv))
		set @ketqua ='True';
	else 
		set @ketqua= 'False';
return @ketqua
end
GO
/****** Object:  Table [dbo].[KhoaHoc]    Script Date: 14/07/2020 11:09:36 AM ******/
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
/****** Object:  Table [dbo].[LopHoc]    Script Date: 14/07/2020 11:09:36 AM ******/
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
/****** Object:  View [dbo].[dsLop]    Script Date: 14/07/2020 11:09:36 AM ******/
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
/****** Object:  Table [dbo].[HocVien]    Script Date: 14/07/2020 11:09:36 AM ******/
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
/****** Object:  Table [dbo].[PhieuThu]    Script Date: 14/07/2020 11:09:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhieuThu](
	[PhieuThuId] [int] IDENTITY(1,1) NOT NULL,
	[NgayThanhToan] [date] NULL,
	[PhuongThucThanhToan] [nvarchar](50) NULL,
	[HocVienId] [int] NOT NULL,
	[LopHocId] [int] NOT NULL,
	[SoTien] [money] NULL,
	[NhanVienId] [int] NULL,
 CONSTRAINT [PK_PhieuThu] PRIMARY KEY CLUSTERED 
(
	[PhieuThuId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[dsHocVien]    Script Date: 14/07/2020 11:09:36 AM ******/
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
/****** Object:  Table [dbo].[NhanVien]    Script Date: 14/07/2020 11:09:36 AM ******/
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
/****** Object:  Table [dbo].[Levels]    Script Date: 14/07/2020 11:09:36 AM ******/
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
/****** Object:  UserDefinedFunction [dbo].[fn_ListLopHocTheoKhoaHoc]    Script Date: 14/07/2020 11:09:36 AM ******/
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
    LopHoc.ThoiGianKetThuc_LH
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
/****** Object:  UserDefinedFunction [dbo].[fn_ListHocVienCuaLopHoc]    Script Date: 14/07/2020 11:09:36 AM ******/
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
/****** Object:  UserDefinedFunction [dbo].[fn_ListPhieuThu]    Script Date: 14/07/2020 11:09:36 AM ******/
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
    p.PhuongThucThanhToan,
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
/****** Object:  UserDefinedFunction [dbo].[fn_TimTenTrenPhieuThu]    Script Date: 14/07/2020 11:09:36 AM ******/
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
    p.PhuongThucThanhToan,
    p.NgayThanhToan,
    s.HocVienId
  FROM HocVien s
  JOIN PhieuThu p
    ON s.HocVienId = p.HocVienId
  JOIN NhanVien
    ON NhanVien.NhanVienId = p.NhanVienId
  WHERE p.LopHocId = @idlh
  AND s.TrangThai LIKE '1'
  AND s.HoTen_HV LIKE '%' + @ten + '%')
GO
/****** Object:  View [dbo].[view_ListKhoaHoc]    Script Date: 14/07/2020 11:09:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[view_ListKhoaHoc] 
as
	select Ma_KH, Ten_KH, MoTa from KhoaHoc;
GO
/****** Object:  UserDefinedFunction [dbo].[fn_LoadLevel]    Script Date: 14/07/2020 11:09:36 AM ******/
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
/****** Object:  UserDefinedFunction [dbo].[fn_ListNhanVien]    Script Date: 14/07/2020 11:09:36 AM ******/
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
/****** Object:  UserDefinedFunction [dbo].[fn_ListKhoaHoc]    Script Date: 14/07/2020 11:09:36 AM ******/
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
/****** Object:  UserDefinedFunction [dbo].[fn_ListLopHoc]    Script Date: 14/07/2020 11:09:36 AM ******/
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
    LopHoc.ThoiGianKetThuc_LH
  FROM LopHoc
  JOIN KhoaHoc
    ON KhoaHoc.KhoaHocId = LopHoc.KhoaHocId
  JOIN NhanVien
    ON NhanVien.NhanVienId = LopHoc.NhanVienId
  JOIN Levels
    ON Levels.LevelsId = LopHoc.LevelsId
  WHERE LopHoc.TrangThai LIKE '1')
GO
/****** Object:  View [dbo].[view_ListGiaoVien]    Script Date: 14/07/2020 11:09:36 AM ******/
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
/****** Object:  UserDefinedFunction [dbo].[fn_TimLopTheoGiaoVien]    Script Date: 14/07/2020 11:09:36 AM ******/
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
    LopHoc.ThoiGianKetThuc_LH
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
/****** Object:  UserDefinedFunction [dbo].[fn_ListHocVien]    Script Date: 14/07/2020 11:09:36 AM ******/
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
/****** Object:  Table [dbo].[NhanVien_audits]    Script Date: 14/07/2020 11:09:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhanVien_audits](
	[Change_id] [int] IDENTITY(1,1) NOT NULL,
	[Ma_NV] [nvarchar](100) NOT NULL,
	[HoTen_NV] [nvarchar](100) NOT NULL,
	[ChucVu] [nvarchar](100) NOT NULL,
	[Email] [nvarchar](100) NOT NULL,
	[SDT_NV] [nvarchar](100) NOT NULL,
	[CMND_NV] [nvarchar](100) NOT NULL,
	[Birthday] [datetime] NULL,
	[Update_at] [datetime] NOT NULL,
	[Operation] [char](3) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Change_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PhanQuyen]    Script Date: 14/07/2020 11:09:36 AM ******/
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
/****** Object:  Table [dbo].[TaikhoanGiaoVien]    Script Date: 14/07/2020 11:09:36 AM ******/
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
/****** Object:  Table [dbo].[TaiKhoanHocVien]    Script Date: 14/07/2020 11:09:36 AM ******/
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

INSERT [dbo].[HocVien] ([HocVienId], [Ma_HV], [HoTen_HV], [DiaChi_HV], [Email_HV], [SDT_HV], [TrangThai]) VALUES (7, N'HV_08', N'Trần Đình Trí', N'Long An', N'tritran@gmail.com', N'0813236339', N'0')
INSERT [dbo].[HocVien] ([HocVienId], [Ma_HV], [HoTen_HV], [DiaChi_HV], [Email_HV], [SDT_HV], [TrangThai]) VALUES (8, N'HV_10', N'Nguyen van a', N'tien giang', N'a@gmail.com', N'1234', N'0')
INSERT [dbo].[HocVien] ([HocVienId], [Ma_HV], [HoTen_HV], [DiaChi_HV], [Email_HV], [SDT_HV], [TrangThai]) VALUES (1007, N'HV_01', N'Lê Thị Kim Ngân', N'Quận 9', N'ngan@gmail.com', N'025868227', N'0')
INSERT [dbo].[HocVien] ([HocVienId], [Ma_HV], [HoTen_HV], [DiaChi_HV], [Email_HV], [SDT_HV], [TrangThai]) VALUES (1008, N'HV_02', N'Phan Thị Ngọc Tuyền', N'Tiền Giang', N'tuyenphan@gmail.com', N'123456789', N'0')
INSERT [dbo].[HocVien] ([HocVienId], [Ma_HV], [HoTen_HV], [DiaChi_HV], [Email_HV], [SDT_HV], [TrangThai]) VALUES (1009, N'HV_10', N'Nguyen van a', N'hcm', N'a@gmail.com', N'1234', N'0')
INSERT [dbo].[HocVien] ([HocVienId], [Ma_HV], [HoTen_HV], [DiaChi_HV], [Email_HV], [SDT_HV], [TrangThai]) VALUES (1010, N'HV_01', N'A', N'hcm', N'123@gmail.com', N'12356', N'0')
INSERT [dbo].[HocVien] ([HocVienId], [Ma_HV], [HoTen_HV], [DiaChi_HV], [Email_HV], [SDT_HV], [TrangThai]) VALUES (1011, N'HV_02', N'Nguyễn Văn B', N'Tiền Giang', N'bNguyen@gmail.com', N'987654', N'0')
INSERT [dbo].[HocVien] ([HocVienId], [Ma_HV], [HoTen_HV], [DiaChi_HV], [Email_HV], [SDT_HV], [TrangThai]) VALUES (1012, N'HV_02', N'Lê Đào Anh Trung', N'Yên Bái', N'trung@gmail.com', N'013345', N'1')
INSERT [dbo].[HocVien] ([HocVienId], [Ma_HV], [HoTen_HV], [DiaChi_HV], [Email_HV], [SDT_HV], [TrangThai]) VALUES (1013, N'HV_03', N'Phạm Nguyễn Tiên Vy', N'HCM', N'vy@gmail.com', N'0258', N'1')
INSERT [dbo].[HocVien] ([HocVienId], [Ma_HV], [HoTen_HV], [DiaChi_HV], [Email_HV], [SDT_HV], [TrangThai]) VALUES (1014, N'HV_04', N'Đặng Nguyễn Phúc Nhân', N'Hải Phòng', N'nhan@gmail.com', N'147', N'1')
INSERT [dbo].[HocVien] ([HocVienId], [Ma_HV], [HoTen_HV], [DiaChi_HV], [Email_HV], [SDT_HV], [TrangThai]) VALUES (1015, N'HV_05', N'Ngan', N'1 vvn', N'ngan@gmail.com', N'12345', N'1')
INSERT [dbo].[HocVien] ([HocVienId], [Ma_HV], [HoTen_HV], [DiaChi_HV], [Email_HV], [SDT_HV], [TrangThai]) VALUES (1016, NULL, N'truc', N'bd', N'truc', N'123', N'0')
INSERT [dbo].[HocVien] ([HocVienId], [Ma_HV], [HoTen_HV], [DiaChi_HV], [Email_HV], [SDT_HV], [TrangThai]) VALUES (1017, NULL, N'long', N'1vvn', N'long', N'12345', N'1')
SET IDENTITY_INSERT [dbo].[HocVien] OFF
GO
SET IDENTITY_INSERT [dbo].[KhoaHoc] ON 

INSERT [dbo].[KhoaHoc] ([KhoaHocId], [Ma_KH], [Ten_KH], [MoTa], [TrangThai]) VALUES (5, N'KH_01', N'Toeic', N'Có', N'1')
INSERT [dbo].[KhoaHoc] ([KhoaHocId], [Ma_KH], [Ten_KH], [MoTa], [TrangThai]) VALUES (6, N'KH_02', N'ielts', N'Không', N'1')
INSERT [dbo].[KhoaHoc] ([KhoaHocId], [Ma_KH], [Ten_KH], [MoTa], [TrangThai]) VALUES (7, N'KH_03', N'Giao Tiếp', N'Không có!', N'0')
INSERT [dbo].[KhoaHoc] ([KhoaHocId], [Ma_KH], [Ten_KH], [MoTa], [TrangThai]) VALUES (8, N'KH_04', N'tttt', N'Không', N'0')
INSERT [dbo].[KhoaHoc] ([KhoaHocId], [Ma_KH], [Ten_KH], [MoTa], [TrangThai]) VALUES (9, N'KH_03', N'Giao Tiếp', N'không', N'1')
SET IDENTITY_INSERT [dbo].[KhoaHoc] OFF
GO
SET IDENTITY_INSERT [dbo].[Levels] ON 

INSERT [dbo].[Levels] ([LevelsId], [Ma_Level], [Ten_Level], [MoTa], [TrangThai]) VALUES (51, N'LV_01', N'Cơ Bản', N'Không Có!', N'1')
INSERT [dbo].[Levels] ([LevelsId], [Ma_Level], [Ten_Level], [MoTa], [TrangThai]) VALUES (52, N'LV_02', N'Nâng Cao', N'Không có!', N'1')
INSERT [dbo].[Levels] ([LevelsId], [Ma_Level], [Ten_Level], [MoTa], [TrangThai]) VALUES (53, N'LV_03', N'Luyện Đề', N'Không Có!', N'1')
SET IDENTITY_INSERT [dbo].[Levels] OFF
GO
SET IDENTITY_INSERT [dbo].[LopHoc] ON 

INSERT [dbo].[LopHoc] ([LopHocId], [Ma_LH], [Ten_LH], [ThoiGianBatDau_LH], [ThoiGianKetThuc_LH], [HocPhi], [NhanVienId], [KhoaHocId], [LevelsId], [SoBuoiHoc], [KhungGioHoc], [SoLuongHocVien], [TrangThai]) VALUES (1010, N'TCB_01', N'Toeic Cơ Bản', CAST(N'2019-12-10' AS Date), CAST(N'2020-02-22' AS Date), CAST(5600000 AS Numeric(18, 0)), 15, 5, 51, 42, N'2-4-6 19h30 đến 21h', NULL, N'1')
INSERT [dbo].[LopHoc] ([LopHocId], [Ma_LH], [Ten_LH], [ThoiGianBatDau_LH], [ThoiGianKetThuc_LH], [HocPhi], [NhanVienId], [KhoaHocId], [LevelsId], [SoBuoiHoc], [KhungGioHoc], [SoLuongHocVien], [TrangThai]) VALUES (1011, N'TNC_01', N'Toeic Nâng Cao ', CAST(N'2020-02-22' AS Date), CAST(N'2020-05-21' AS Date), CAST(5900000 AS Numeric(18, 0)), 15, 5, 52, 32, N'2-4-6 18h đến 19h30', NULL, N'1')
INSERT [dbo].[LopHoc] ([LopHocId], [Ma_LH], [Ten_LH], [ThoiGianBatDau_LH], [ThoiGianKetThuc_LH], [HocPhi], [NhanVienId], [KhoaHocId], [LevelsId], [SoBuoiHoc], [KhungGioHoc], [SoLuongHocVien], [TrangThai]) VALUES (1012, N'il_01', N'ielts', CAST(N'2020-07-02' AS Date), CAST(N'2020-02-22' AS Date), CAST(9000000 AS Numeric(18, 0)), 15, 6, 53, 42, N'3-5-7 19h đến 21h', NULL, N'0')
INSERT [dbo].[LopHoc] ([LopHocId], [Ma_LH], [Ten_LH], [ThoiGianBatDau_LH], [ThoiGianKetThuc_LH], [HocPhi], [NhanVienId], [KhoaHocId], [LevelsId], [SoBuoiHoc], [KhungGioHoc], [SoLuongHocVien], [TrangThai]) VALUES (1013, N'GTCB_01', N'Giao tiếp cơ bản', CAST(N'2019-12-09' AS Date), CAST(N'2020-12-01' AS Date), CAST(6000000 AS Numeric(18, 0)), 1017, 9, 51, 42, N'3-5-7 19h - 21h', NULL, N'1')
SET IDENTITY_INSERT [dbo].[LopHoc] OFF
GO
SET IDENTITY_INSERT [dbo].[NhanVien] ON 

INSERT [dbo].[NhanVien] ([NhanVienId], [Ma_NV], [HoTen_NV], [ChucVu], [Email], [SDT_NV], [CMND], [Birthday], [TrangThai]) VALUES (13, N'NV_15', N'Trần Huỳnh Phương', N'Kế Toán', N'phuongtran@gmail.com', N'123456798', N'54236985', CAST(N'1991-06-10T21:30:52.000' AS DateTime), N'0')
INSERT [dbo].[NhanVien] ([NhanVienId], [Ma_NV], [HoTen_NV], [ChucVu], [Email], [SDT_NV], [CMND], [Birthday], [TrangThai]) VALUES (14, N'NV_16', N'Trần Phước Tài', N'Admin', N'ewiiẻtregr', N'123456', N'754561254', CAST(N'1994-09-26T21:32:13.000' AS DateTime), N'1')
INSERT [dbo].[NhanVien] ([NhanVienId], [Ma_NV], [HoTen_NV], [ChucVu], [Email], [SDT_NV], [CMND], [Birthday], [TrangThai]) VALUES (15, N'NV_17', N'Trần Minh Nhân', N'Giáo Viên', N'nhan123@gmail.com', N'1234569', N'553558884', CAST(N'1995-06-18T21:33:17.000' AS DateTime), N'1')
INSERT [dbo].[NhanVien] ([NhanVienId], [Ma_NV], [HoTen_NV], [ChucVu], [Email], [SDT_NV], [CMND], [Birthday], [TrangThai]) VALUES (1014, N'NV_01', N'Admin', N'Admin', N'admin@gmail.com', N'123456789', N'3024688885', CAST(N'1993-03-27T00:00:00.000' AS DateTime), N'0')
INSERT [dbo].[NhanVien] ([NhanVienId], [Ma_NV], [HoTen_NV], [ChucVu], [Email], [SDT_NV], [CMND], [Birthday], [TrangThai]) VALUES (1015, N'NV_02', N'Phạm Trần Huệ Phi', N'Giáo Viên', N'phi@gmail.com', N'0937269861', N'025678', CAST(N'1999-08-20T13:32:00.000' AS DateTime), N'0')
INSERT [dbo].[NhanVien] ([NhanVienId], [Ma_NV], [HoTen_NV], [ChucVu], [Email], [SDT_NV], [CMND], [Birthday], [TrangThai]) VALUES (1016, N'NV_03', N'Võ Ngọc Tuyết Hân', N'Giáo Viên', N'han@gmail.com', N'0764', N'12345', CAST(N'1999-12-09T13:33:44.000' AS DateTime), N'1')
INSERT [dbo].[NhanVien] ([NhanVienId], [Ma_NV], [HoTen_NV], [ChucVu], [Email], [SDT_NV], [CMND], [Birthday], [TrangThai]) VALUES (1017, N'NV_04', N'Nguyễn Ngọc Tú Duyên', N'Kế Toán', N'duyen@gmail.com', N'0906951108', N'98765415', CAST(N'1999-12-09T13:50:11.000' AS DateTime), N'1')
INSERT [dbo].[NhanVien] ([NhanVienId], [Ma_NV], [HoTen_NV], [ChucVu], [Email], [SDT_NV], [CMND], [Birthday], [TrangThai]) VALUES (1018, N'NV_05', N'Phan Xuân Tuấn Anh', N'Giáo Viên', N'anh@gmail.com', N'3698741', N'0258963147', CAST(N'1999-12-09T13:52:50.000' AS DateTime), N'1')
INSERT [dbo].[NhanVien] ([NhanVienId], [Ma_NV], [HoTen_NV], [ChucVu], [Email], [SDT_NV], [CMND], [Birthday], [TrangThai]) VALUES (1019, N'NV_06', N'Phạm Minh Thi', N'Admin', N'thipham2911@gmail.com', N'12312', N'7854210', CAST(N'1994-02-20T17:13:27.000' AS DateTime), N'1')
SET IDENTITY_INSERT [dbo].[NhanVien] OFF
GO
SET IDENTITY_INSERT [dbo].[NhanVien_audits] ON 

INSERT [dbo].[NhanVien_audits] ([Change_id], [Ma_NV], [HoTen_NV], [ChucVu], [Email], [SDT_NV], [CMND_NV], [Birthday], [Update_at], [Operation]) VALUES (1, N'NV-6', N'Truc', N'Giao vien', N'email', N'0123', N'025', CAST(N'1999-08-10T00:00:00.000' AS DateTime), CAST(N'2019-11-30T20:11:39.310' AS DateTime), N'INS')
INSERT [dbo].[NhanVien_audits] ([Change_id], [Ma_NV], [HoTen_NV], [ChucVu], [Email], [SDT_NV], [CMND_NV], [Birthday], [Update_at], [Operation]) VALUES (2, N'NV-6', N'Truc', N'Giao vien', N'email', N'0123', N'025', CAST(N'1999-08-10T00:00:00.000' AS DateTime), CAST(N'2019-12-01T02:56:05.550' AS DateTime), N'DEL')
INSERT [dbo].[NhanVien_audits] ([Change_id], [Ma_NV], [HoTen_NV], [ChucVu], [Email], [SDT_NV], [CMND_NV], [Birthday], [Update_at], [Operation]) VALUES (3, N'NV_11', N'tuyen', N'tro giang', N'uyen', N'vd', N'12344', CAST(N'1999-02-25T00:00:00.000' AS DateTime), CAST(N'2019-12-05T11:35:46.500' AS DateTime), N'INS')
INSERT [dbo].[NhanVien_audits] ([Change_id], [Ma_NV], [HoTen_NV], [ChucVu], [Email], [SDT_NV], [CMND_NV], [Birthday], [Update_at], [Operation]) VALUES (4, N'NV-7', N'Admin', N'Giáo Viên', N'123', N'0123456', N'123456', CAST(N'2019-01-09T00:00:00.000' AS DateTime), CAST(N'2019-12-05T11:35:48.830' AS DateTime), N'INS')
INSERT [dbo].[NhanVien_audits] ([Change_id], [Ma_NV], [HoTen_NV], [ChucVu], [Email], [SDT_NV], [CMND_NV], [Birthday], [Update_at], [Operation]) VALUES (5, N'NV_11', N'tuyen', N'tro giang', N'uyen', N'vd', N'12344', CAST(N'1999-02-25T00:00:00.000' AS DateTime), CAST(N'2019-12-05T11:38:11.407' AS DateTime), N'INS')
INSERT [dbo].[NhanVien_audits] ([Change_id], [Ma_NV], [HoTen_NV], [ChucVu], [Email], [SDT_NV], [CMND_NV], [Birthday], [Update_at], [Operation]) VALUES (6, N'NV-7', N'Admin', N'Giáo Viên', N'123', N'0123456', N'123456', CAST(N'2019-01-09T00:00:00.000' AS DateTime), CAST(N'2019-12-05T11:38:13.773' AS DateTime), N'INS')
INSERT [dbo].[NhanVien_audits] ([Change_id], [Ma_NV], [HoTen_NV], [ChucVu], [Email], [SDT_NV], [CMND_NV], [Birthday], [Update_at], [Operation]) VALUES (10, N'NV_06', N'Phạm Minh Thi', N'Admin', N'thipham2911@gmail.com', N'1222', N'7854210', CAST(N'1994-02-20T17:13:27.000' AS DateTime), CAST(N'2020-07-13T22:50:56.280' AS DateTime), N'INS')
INSERT [dbo].[NhanVien_audits] ([Change_id], [Ma_NV], [HoTen_NV], [ChucVu], [Email], [SDT_NV], [CMND_NV], [Birthday], [Update_at], [Operation]) VALUES (11, N'NV_01', N'Admin', N'Admin', N'admin@gmail.com', N'123456789', N'3024688885', CAST(N'1993-03-27T00:00:00.000' AS DateTime), CAST(N'2020-07-13T22:51:21.107' AS DateTime), N'INS')
INSERT [dbo].[NhanVien_audits] ([Change_id], [Ma_NV], [HoTen_NV], [ChucVu], [Email], [SDT_NV], [CMND_NV], [Birthday], [Update_at], [Operation]) VALUES (14, N'NV_06', N'Phạm Minh Thi', N'Admin', N'thipham2911@gmail.com', N'123', N'7854210', CAST(N'1994-02-20T17:13:27.000' AS DateTime), CAST(N'2020-07-13T23:07:11.053' AS DateTime), N'INS')
INSERT [dbo].[NhanVien_audits] ([Change_id], [Ma_NV], [HoTen_NV], [ChucVu], [Email], [SDT_NV], [CMND_NV], [Birthday], [Update_at], [Operation]) VALUES (15, N'NV_06', N'Phạm Minh Thi', N'Admin', N'thipham2911@gmail.com', N'12312', N'7854210', CAST(N'1994-02-20T17:13:27.000' AS DateTime), CAST(N'2020-07-13T23:09:05.590' AS DateTime), N'INS')
SET IDENTITY_INSERT [dbo].[NhanVien_audits] OFF
GO
SET IDENTITY_INSERT [dbo].[PhanQuyen] ON 

INSERT [dbo].[PhanQuyen] ([PhanQuyenId], [Ten_PhanQuyen]) VALUES (1, N'Admin')
INSERT [dbo].[PhanQuyen] ([PhanQuyenId], [Ten_PhanQuyen]) VALUES (2, N'Giáo Viên')
INSERT [dbo].[PhanQuyen] ([PhanQuyenId], [Ten_PhanQuyen]) VALUES (3, N'Kế Toán')
INSERT [dbo].[PhanQuyen] ([PhanQuyenId], [Ten_PhanQuyen]) VALUES (4, N'Học Viên')
SET IDENTITY_INSERT [dbo].[PhanQuyen] OFF
GO
SET IDENTITY_INSERT [dbo].[PhieuThu] ON 

INSERT [dbo].[PhieuThu] ([PhieuThuId], [NgayThanhToan], [PhuongThucThanhToan], [HocVienId], [LopHocId], [SoTien], [NhanVienId]) VALUES (1, CAST(N'2019-12-09' AS Date), N'tiền mặt', 8, 1010, 3900000.0000, 1014)
INSERT [dbo].[PhieuThu] ([PhieuThuId], [NgayThanhToan], [PhuongThucThanhToan], [HocVienId], [LopHocId], [SoTien], [NhanVienId]) VALUES (2, CAST(N'2019-12-09' AS Date), N'Tiền mặt', 1012, 1010, 5000000.0000, 1014)
INSERT [dbo].[PhieuThu] ([PhieuThuId], [NgayThanhToan], [PhuongThucThanhToan], [HocVienId], [LopHocId], [SoTien], [NhanVienId]) VALUES (3, CAST(N'2019-12-09' AS Date), N'tiền mặt', 1013, 1011, 5000000.0000, 1014)
INSERT [dbo].[PhieuThu] ([PhieuThuId], [NgayThanhToan], [PhuongThucThanhToan], [HocVienId], [LopHocId], [SoTien], [NhanVienId]) VALUES (4, NULL, NULL, 1014, 1010, NULL, 1014)
SET IDENTITY_INSERT [dbo].[PhieuThu] OFF
GO
SET IDENTITY_INSERT [dbo].[TaikhoanGiaoVien] ON 

INSERT [dbo].[TaikhoanGiaoVien] ([TaiKhoanGiaoVienId], [NhanVienId], [Username], [ChucVu], [PassWords], [TrangThai], [PhanQuyenId]) VALUES (5, 13, N'Trần Huỳnh Phương', N'Kế Toán', N'123456798', N'0', 3)
INSERT [dbo].[TaikhoanGiaoVien] ([TaiKhoanGiaoVienId], [NhanVienId], [Username], [ChucVu], [PassWords], [TrangThai], [PhanQuyenId]) VALUES (6, 15, N'Trần Minh Nhân', N'Giáo Viên', N'1234569', N'1', 2)
INSERT [dbo].[TaikhoanGiaoVien] ([TaiKhoanGiaoVienId], [NhanVienId], [Username], [ChucVu], [PassWords], [TrangThai], [PhanQuyenId]) VALUES (1005, 1014, N'Admin', N'Admin', N'123456789', N'0', 1)
INSERT [dbo].[TaikhoanGiaoVien] ([TaiKhoanGiaoVienId], [NhanVienId], [Username], [ChucVu], [PassWords], [TrangThai], [PhanQuyenId]) VALUES (1006, 1015, N'Phạm Trần Huệ Phi', N'Giáo Viên', N'0937269861', N'0', 2)
INSERT [dbo].[TaikhoanGiaoVien] ([TaiKhoanGiaoVienId], [NhanVienId], [Username], [ChucVu], [PassWords], [TrangThai], [PhanQuyenId]) VALUES (1007, 1016, N'Võ Ngọc Tuyết Hân', N'Giáo Viên', N'0764', N'1', 2)
INSERT [dbo].[TaikhoanGiaoVien] ([TaiKhoanGiaoVienId], [NhanVienId], [Username], [ChucVu], [PassWords], [TrangThai], [PhanQuyenId]) VALUES (1008, 14, N'Trần Phước Tài', N'Admin', N'123456', N'1', 1)
INSERT [dbo].[TaikhoanGiaoVien] ([TaiKhoanGiaoVienId], [NhanVienId], [Username], [ChucVu], [PassWords], [TrangThai], [PhanQuyenId]) VALUES (1009, 1015, N'Phạm Trần Huệ Phi', N'Giáo Viên', N'0937269861', N'0', 2)
INSERT [dbo].[TaikhoanGiaoVien] ([TaiKhoanGiaoVienId], [NhanVienId], [Username], [ChucVu], [PassWords], [TrangThai], [PhanQuyenId]) VALUES (1010, 1017, N'Nguyễn Ngọc Tú Duyên', N'Kế Toán', N'0906951108', N'1', 3)
INSERT [dbo].[TaikhoanGiaoVien] ([TaiKhoanGiaoVienId], [NhanVienId], [Username], [ChucVu], [PassWords], [TrangThai], [PhanQuyenId]) VALUES (1011, 1018, N'Phan Xuân Tuấn Anh', N'Giáo Viên', N'3698741', N'1', 2)
INSERT [dbo].[TaikhoanGiaoVien] ([TaiKhoanGiaoVienId], [NhanVienId], [Username], [ChucVu], [PassWords], [TrangThai], [PhanQuyenId]) VALUES (1012, 1019, N'Phạm Minh Thi', N'Admin', N'12312', N'1', 1)
INSERT [dbo].[TaikhoanGiaoVien] ([TaiKhoanGiaoVienId], [NhanVienId], [Username], [ChucVu], [PassWords], [TrangThai], [PhanQuyenId]) VALUES (1013, 1016, N'Võ Ngọc Tuyết Hân', N'Giáo Viên', N'0764', N'1', 2)
INSERT [dbo].[TaikhoanGiaoVien] ([TaiKhoanGiaoVienId], [NhanVienId], [Username], [ChucVu], [PassWords], [TrangThai], [PhanQuyenId]) VALUES (1014, 1017, N'Nguyễn Ngọc Tú Duyên', N'Kế Toán', N'0906951108', N'1', 3)
SET IDENTITY_INSERT [dbo].[TaikhoanGiaoVien] OFF
GO
SET IDENTITY_INSERT [dbo].[TaiKhoanHocVien] ON 

INSERT [dbo].[TaiKhoanHocVien] ([TaiKhoanHocVienId], [HocVienId], [Username], [TrangThai], [PassWords], [PhanQuyenId]) VALUES (4, 7, N'Trần Đình Trí', N'0', N'0813236339', 4)
INSERT [dbo].[TaiKhoanHocVien] ([TaiKhoanHocVienId], [HocVienId], [Username], [TrangThai], [PassWords], [PhanQuyenId]) VALUES (5, 8, N'Đỗ Trần Ngọc Tuệ', N'0', N'0367628918', 4)
INSERT [dbo].[TaiKhoanHocVien] ([TaiKhoanHocVienId], [HocVienId], [Username], [TrangThai], [PassWords], [PhanQuyenId]) VALUES (1004, 1007, N'Lê Thị Kim Ngân', N'0', N'025868227', 4)
INSERT [dbo].[TaiKhoanHocVien] ([TaiKhoanHocVienId], [HocVienId], [Username], [TrangThai], [PassWords], [PhanQuyenId]) VALUES (1005, 1008, N'Phan Thị Ngọc Tuyền', N'0', N'123456789', 4)
INSERT [dbo].[TaiKhoanHocVien] ([TaiKhoanHocVienId], [HocVienId], [Username], [TrangThai], [PassWords], [PhanQuyenId]) VALUES (1006, 1009, N'Nguyen van a', N'0', N'1234', 4)
INSERT [dbo].[TaiKhoanHocVien] ([TaiKhoanHocVienId], [HocVienId], [Username], [TrangThai], [PassWords], [PhanQuyenId]) VALUES (1007, 1010, N'A', N'0', N'12356', 4)
INSERT [dbo].[TaiKhoanHocVien] ([TaiKhoanHocVienId], [HocVienId], [Username], [TrangThai], [PassWords], [PhanQuyenId]) VALUES (1008, 1011, N'Nguyễn Văn B', N'0', N'987654', 4)
INSERT [dbo].[TaiKhoanHocVien] ([TaiKhoanHocVienId], [HocVienId], [Username], [TrangThai], [PassWords], [PhanQuyenId]) VALUES (1009, 1012, N'Lê Đào Anh Trung', N'1', N'013345', 4)
INSERT [dbo].[TaiKhoanHocVien] ([TaiKhoanHocVienId], [HocVienId], [Username], [TrangThai], [PassWords], [PhanQuyenId]) VALUES (1010, 1013, N'Phạm Nguyễn Tiên Vy', N'1', N'0258', 4)
INSERT [dbo].[TaiKhoanHocVien] ([TaiKhoanHocVienId], [HocVienId], [Username], [TrangThai], [PassWords], [PhanQuyenId]) VALUES (1011, 1014, N'Đặng Nguyễn Phúc Nhân', N'1', N'147', 4)
INSERT [dbo].[TaiKhoanHocVien] ([TaiKhoanHocVienId], [HocVienId], [Username], [TrangThai], [PassWords], [PhanQuyenId]) VALUES (1012, 1016, N'truc', N'0', N'123', 4)
INSERT [dbo].[TaiKhoanHocVien] ([TaiKhoanHocVienId], [HocVienId], [Username], [TrangThai], [PassWords], [PhanQuyenId]) VALUES (1013, 1017, N'long', N'1', N'12345', 4)
SET IDENTITY_INSERT [dbo].[TaiKhoanHocVien] OFF
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
ALTER TABLE [dbo].[NhanVien_audits]  WITH CHECK ADD CHECK  (([operation]='INS' OR [operation]='DEL'))
GO
/****** Object:  StoredProcedure [dbo].[sp_CapNhatPhieuThu]    Script Date: 14/07/2020 11:09:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[sp_CapNhatPhieuThu] @idpt int,
@ngaythanhtoan smalldatetime,
@phuongthucthanhtoan nvarchar(50),
@sotien numeric(18, 0),
@idhv int,
@idlh int,
@idnv int
AS
BEGIN
  BEGIN TRY
    BEGIN TRAN;
      UPDATE PhieuThu
      SET NgayThanhToan = @ngaythanhtoan,
          PhuongThucThanhToan = @phuongthucthanhtoan,
          SoTien = @sotien,
          NhanVienId = @idnv
      WHERE HocVienId = @idhv
      AND LopHocId = @idlh
    COMMIT TRAN;
  END TRY
  BEGIN CATCH
    ROLLBACK TRAN
  END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[sp_demSoLuong]    Script Date: 14/07/2020 11:09:36 AM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_KiemTraTaiKhoanHV]    Script Date: 14/07/2020 11:09:36 AM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_KiemTraTaiKhoanNV]    Script Date: 14/07/2020 11:09:36 AM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_ListKhoaHoc]    Script Date: 14/07/2020 11:09:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_ListKhoaHoc] 
as
	select * from KhoaHoc;
GO
/****** Object:  StoredProcedure [dbo].[sp_ListNhanVien]    Script Date: 14/07/2020 11:09:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_ListNhanVien] 
as
	select * from NhanVien;
GO
/****** Object:  StoredProcedure [dbo].[sp_LoadLevel]    Script Date: 14/07/2020 11:09:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_LoadLevel] 
as
	select * from Levels
GO
/****** Object:  StoredProcedure [dbo].[sp_SuaHocVien]    Script Date: 14/07/2020 11:09:36 AM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_SuaKhoaHoc]    Script Date: 14/07/2020 11:09:36 AM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_SuaLevel]    Script Date: 14/07/2020 11:09:36 AM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_SuaLopHoc]    Script Date: 14/07/2020 11:09:36 AM ******/
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
@khunggiohoc nvarchar(max)
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
          KhungGioHoc = @khunggiohoc
      WHERE LopHocId = @lopHocID
    COMMIT TRAN;
  END TRY
  BEGIN CATCH
    ROLLBACK TRAN
  END CATCH

END
GO
/****** Object:  StoredProcedure [dbo].[sp_SuaNhanVien]    Script Date: 14/07/2020 11:09:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_SuaNhanVien] 
@id_nv int,
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
/****** Object:  StoredProcedure [dbo].[sp_ThemHocVien]    Script Date: 14/07/2020 11:09:36 AM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_ThemKhoaHoc]    Script Date: 14/07/2020 11:09:36 AM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_ThemLevel]    Script Date: 14/07/2020 11:09:36 AM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_ThemLopHoc]    Script Date: 14/07/2020 11:09:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[sp_ThemLopHoc]
@tenlh nvarchar(100),
@thoigianbatdau smalldatetime,
@thoigianketthuc smalldatetime,
@hocphi numeric(18, 0),
@idnv int,
@idkh int,
@idlv int,
@sobuoihoc int,
@khunggiohoc nvarchar(100)
AS
BEGIN
	set identity_insert LopHoc off;
				insert into LopHoc(Ten_LH,ThoiGianBatDau_LH,ThoiGianKetThuc_LH,HocPhi,NhanVienId
				,KhoaHocId,LevelsId,SoBuoiHoc,KhungGioHoc, TrangThai)
				values (@tenlh, @thoigianbatdau,@thoigianketthuc,@hocphi,@idnv,@idkh,@idlv,@sobuoihoc,@khunggiohoc, 1);	
END
GO
/****** Object:  StoredProcedure [dbo].[sp_ThemNhanVien]    Script Date: 14/07/2020 11:09:36 AM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_ThemPhanQuyen]    Script Date: 14/07/2020 11:09:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_ThemPhanQuyen]
	@ten nvarchar(100)
as
begin 
	 if(exists (select * from PhanQuyen 
				where  (Ten_PhanQuyen= @ten)))
				return -1;
	else
		begin tran ;
			begin try 
				set identity_insert PhanQuyen off;
				insert into PhanQuyen(Ten_PhanQuyen)
				values (@ten);	
				waitfor delay '00:00:05';			
				commit tran;
				return 0;
			end try
			begin catch
				rollback tran
			end catch

end
GO
/****** Object:  StoredProcedure [dbo].[sp_ThemPhieuThu]    Script Date: 14/07/2020 11:09:36 AM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_TimHocVienTheoTen]    Script Date: 14/07/2020 11:09:36 AM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_TimNhanVienTheoTen]    Script Date: 14/07/2020 11:09:36 AM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_XoaHocVien]    Script Date: 14/07/2020 11:09:36 AM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_XoaKhoaHoc]    Script Date: 14/07/2020 11:09:36 AM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_XoaLevel]    Script Date: 14/07/2020 11:09:36 AM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_XoaLopHoc]    Script Date: 14/07/2020 11:09:36 AM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_XoaNhanVien]    Script Date: 14/07/2020 11:09:36 AM ******/
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
