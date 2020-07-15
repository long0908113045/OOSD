USE [EnglishCenter]
GO
/****** Object:  Table [dbo].[NhanVien]    Script Date: 15/07/2020 2:12:09 PM ******/
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
/****** Object:  View [dbo].[view_ListGiaoVien]    Script Date: 15/07/2020 2:12:09 PM ******/
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
/****** Object:  Table [dbo].[KhoaHoc]    Script Date: 15/07/2020 2:12:09 PM ******/
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
/****** Object:  Table [dbo].[Levels]    Script Date: 15/07/2020 2:12:09 PM ******/
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
/****** Object:  Table [dbo].[LopHoc]    Script Date: 15/07/2020 2:12:09 PM ******/
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
/****** Object:  UserDefinedFunction [dbo].[fn_TimLopTheoGiaoVien]    Script Date: 15/07/2020 2:12:09 PM ******/
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
/****** Object:  Table [dbo].[HocVien]    Script Date: 15/07/2020 2:12:09 PM ******/
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
/****** Object:  UserDefinedFunction [dbo].[fn_ListHocVien]    Script Date: 15/07/2020 2:12:09 PM ******/
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
/****** Object:  View [dbo].[dsLop]    Script Date: 15/07/2020 2:12:09 PM ******/
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
/****** Object:  Table [dbo].[PhieuThu]    Script Date: 15/07/2020 2:12:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhieuThu](
	[PhieuThuId] [int] IDENTITY(1,1) NOT NULL,
	[NgayThanhToan] [date] NULL,
	[HocVienId] [int] NOT NULL,
	[LopHocId] [int] NOT NULL,
	[SoTien] [money] NULL,
	[NhanVienId] [int] NULL,
	[PhuongThucThanhToanId] [int] NULL,
 CONSTRAINT [PK_PhieuThu] PRIMARY KEY CLUSTERED 
(
	[PhieuThuId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[dsHocVien]    Script Date: 15/07/2020 2:12:09 PM ******/
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
/****** Object:  UserDefinedFunction [dbo].[fn_ListLopHocTheoKhoaHoc]    Script Date: 15/07/2020 2:12:09 PM ******/
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
/****** Object:  UserDefinedFunction [dbo].[fn_ListHocVienCuaLopHoc]    Script Date: 15/07/2020 2:12:09 PM ******/
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
/****** Object:  UserDefinedFunction [dbo].[fn_ListPhieuThu]    Script Date: 15/07/2020 2:12:09 PM ******/
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
/****** Object:  Table [dbo].[PhuongThucThanhToan]    Script Date: 15/07/2020 2:12:09 PM ******/
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
/****** Object:  UserDefinedFunction [dbo].[fn_TimTenTrenPhieuThu]    Script Date: 15/07/2020 2:12:09 PM ******/
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
/****** Object:  UserDefinedFunction [dbo].[fn_LoadLevel]    Script Date: 15/07/2020 2:12:09 PM ******/
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
/****** Object:  UserDefinedFunction [dbo].[fn_ListNhanVien]    Script Date: 15/07/2020 2:12:09 PM ******/
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
/****** Object:  UserDefinedFunction [dbo].[fn_ListKhoaHoc]    Script Date: 15/07/2020 2:12:09 PM ******/
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
/****** Object:  UserDefinedFunction [dbo].[fn_ListLopHoc]    Script Date: 15/07/2020 2:12:09 PM ******/
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
/****** Object:  Table [dbo].[PhanQuyen]    Script Date: 15/07/2020 2:12:09 PM ******/
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
/****** Object:  Table [dbo].[TaikhoanGiaoVien]    Script Date: 15/07/2020 2:12:09 PM ******/
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
/****** Object:  Table [dbo].[TaiKhoanHocVien]    Script Date: 15/07/2020 2:12:09 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_CapNhatPhieuThu]    Script Date: 15/07/2020 2:12:09 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_demSoLuong]    Script Date: 15/07/2020 2:12:09 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_KiemTraTaiKhoanHV]    Script Date: 15/07/2020 2:12:09 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_KiemTraTaiKhoanNV]    Script Date: 15/07/2020 2:12:09 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_SuaHocVien]    Script Date: 15/07/2020 2:12:09 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_SuaKhoaHoc]    Script Date: 15/07/2020 2:12:09 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_SuaLevel]    Script Date: 15/07/2020 2:12:09 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_SuaLopHoc]    Script Date: 15/07/2020 2:12:09 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_SuaNhanVien]    Script Date: 15/07/2020 2:12:09 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_ThemHocVien]    Script Date: 15/07/2020 2:12:09 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_ThemKhoaHoc]    Script Date: 15/07/2020 2:12:09 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_ThemLevel]    Script Date: 15/07/2020 2:12:09 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_ThemLopHoc]    Script Date: 15/07/2020 2:12:09 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_ThemNhanVien]    Script Date: 15/07/2020 2:12:09 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_ThemPhieuThu]    Script Date: 15/07/2020 2:12:09 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_ThemTaiKhoanNV]    Script Date: 15/07/2020 2:12:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_ThemTaiKhoanNV] @nhanvienid int,
@username nvarchar(50),
@chucvu nvarchar(50),
@passwords nvarchar(50),
@trangthai nvarchar(50),
@phanquyenid int

AS
BEGIN
  IF (EXISTS (SELECT
      *
    FROM TaikhoanGiaoVien
    WHERE Username = @username
    AND TrangThai LIKE '1')
    )
    RETURN -1;
  ELSE
  BEGIN TRY
    BEGIN TRAN;

      SET IDENTITY_INSERT TaiKhoanGiaoVien OFF;
      INSERT INTO TaiKhoanGiaoVien (NhanVienId, Username, ChucVu, PassWords, TrangThai, PhanQuyenId)
        VALUES (@nhanvienid, @username, @chucvu, @passwords, @trangthai, @phanquyenid)
    COMMIT TRAN;
  END TRY
  BEGIN CATCH
    ROLLBACK TRAN
  END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[sp_TimHocVienTheoTen]    Script Date: 15/07/2020 2:12:09 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_TimNhanVienTheoTen]    Script Date: 15/07/2020 2:12:09 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_XoaHocVien]    Script Date: 15/07/2020 2:12:09 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_XoaKhoaHoc]    Script Date: 15/07/2020 2:12:09 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_XoaLevel]    Script Date: 15/07/2020 2:12:09 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_XoaLopHoc]    Script Date: 15/07/2020 2:12:09 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_XoaNhanVien]    Script Date: 15/07/2020 2:12:09 PM ******/
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
