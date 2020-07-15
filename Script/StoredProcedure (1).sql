USE EnglishCenter;
GO
--2.Thêm level
USE EnglishCenter;

IF OBJECT_ID('sp_ThemLevel') IS NOT NULL
  DROP PROC sp_ThemLevel;
GO

CREATE PROC sp_ThemLevel @tenlv nvarchar(50),
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


--4.Sửa thông tin level
IF OBJECT_ID('sp_SuaLevel') IS NOT NULL
  DROP PROC sp_SuaLevel
GO
CREATE PROC sp_SuaLevel @idlv int,
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
--6.List level
IF OBJECT_ID('fn_LoadLevel') IS NOT NULL
  DROP FUNCTION fn_LoadLevel
GO
CREATE FUNCTION fn_LoadLevel
()
RETURNS TABLE
AS
  RETURN (SELECT
    *
  FROM Levels
  WHERE Levels.TrangThai LIKE '1')
GO
--7.Xóa Level
IF OBJECT_ID('sp_XoaLevel') IS NOT NULL
  DROP PROC sp_XoaLevel
GO
CREATE PROC sp_XoaLevel @idlv int
AS
  UPDATE Levels
  SET TrangThai = '0'
  WHERE Levels.LevelsId = @idlv;
GO

--8.Thêm Nhân Viên
IF OBJECT_ID('sp_ThemNhanVien') IS NOT NULL
  DROP PROC sp_ThemNhanVien
GO
CREATE PROC sp_ThemNhanVien @hoten nvarchar(50),
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

--9.Sửa Nhân Viên
IF OBJECT_ID('sp_SuaNhanVien') IS NOT NULL
  DROP PROC sp_SuaNhanVien
GO
CREATE PROC sp_SuaNhanVien @id_nv int,
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

--10.Xóa Nhân Viên
IF OBJECT_ID('sp_XoaNhanVien') IS NOT NULL
  DROP PROC sp_XoaNhanVien
GO
CREATE PROC sp_XoaNhanVien @id_nv int
AS
  UPDATE NhanVien
  SET TrangThai = '0'
  WHERE NhanVienId = @id_nv;
GO


--11.List Nhân Viên
USE EnglishCenter;
GO
IF OBJECT_ID('fn_ListNhanVien') IS NOT NULL
  DROP FUNCTION fn_ListNhanVien
GO
CREATE FUNCTION fn_ListNhanVien
()
RETURNS TABLE
AS
  RETURN (SELECT
    *
  FROM NhanVien
  WHERE TrangThai LIKE '1');
GO

--10.Tìm nhân viên theo tên
USE EnglishCenter;
GO
IF OBJECT_ID('sp_TimNhanVienTheoTen') IS NOT NULL
  DROP PROC sp_TimNhanVienTheoTen
GO
CREATE PROC sp_TimNhanVienTheoTen @ten nvarchar(50),
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

EXEC dbo.sp_TimNhanVienTheoTen N'',
                               N'Giáo Viên';
--12. Thêm Khóa Học
USE EnglishCenter;

IF OBJECT_ID('sp_ThemKhoaHoc') IS NOT NULL
  DROP PROC sp_ThemKhoaHoc;
GO

CREATE PROC sp_ThemKhoaHoc @tenkh nvarchar(100),
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

--17.Sửa thông tin khóa học
IF OBJECT_ID('sp_SuaKhoaHoc') IS NOT NULL
  DROP PROC sp_SuaKhoaHoc
GO
CREATE PROC sp_SuaKhoaHoc @id_KH int,

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


--18.Xóa Khóa Học
USE EnglishCenter;
IF OBJECT_ID('sp_XoaKhoaHoc') IS NOT NULL
  DROP PROC sp_XoaKhoaHoc
GO
CREATE PROC sp_XoaKhoaHoc @id_kh int
AS
  UPDATE KhoaHoc
  SET TrangThai = '0'
  WHERE KhoaHocId = @id_kh
GO
--13.List Khoa Học
IF OBJECT_ID('fn_ListKhoaHoc') IS NOT NULL
  DROP FUNCTION fn_ListKhoaHoc
GO
CREATE FUNCTION fn_ListKhoaHoc
()
RETURNS TABLE
AS
  RETURN (SELECT
    *
  FROM KhoaHoc
  WHERE TrangThai LIKE '1');
GO
--20.Thêm Lớp Học
USE EnglishCenter;

IF OBJECT_ID('sp_ThemLopHoc') IS NOT NULL
  DROP PROC sp_ThemLopHoc;
GO

CREATE PROC sp_ThemLopHoc @tenlh nvarchar(100),
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



--21.Sửa Lớp Học
USE EnglishCenter;

IF OBJECT_ID('sp_SuaLopHoc') IS NOT NULL
  DROP PROC sp_SuaLopHoc;
GO

CREATE PROC sp_SuaLopHoc @lopHocID int,
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
--22.Xóa Lớp Học
IF OBJECT_ID('sp_XoaLopHoc') IS NOT NULL
  DROP PROC sp_XoaLopHoc
GO
CREATE PROC sp_XoaLopHoc @idlh int
AS
  UPDATE LopHoc
  SET TrangThai = '0'
  WHERE LopHocId = @idlh;
GO
--23.List Lớp Học
USE EnglishCenter;

IF OBJECT_ID('fn_ListLopHoc') IS NOT NULL
  DROP FUNCTION fn_ListLopHoc;
GO

CREATE FUNCTION fn_ListLopHoc
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


--24.List Giáo Viên 
USE EnglishCenter;

IF OBJECT_ID('view_ListGiaoVien') IS NOT NULL
  DROP VIEW view_ListGiaoVien;
GO

CREATE VIEW view_ListGiaoVien

AS
SELECT
  NhanVien.HoTen_NV,
  NhanVien.Ma_NV,
  NhanVien.NhanVienId
FROM NhanVien
WHERE NhanVien.ChucVu LIKE N'Giáo Viên%'
AND NhanVien.TrangThai LIKE '1';
GO

SELECT
  *
FROM dbo.view_ListGiaoVien;

--25.Lấy Lớp Học Theo Giáo Viên 
USE EnglishCenter;
IF OBJECT_ID('fn_TimLopTheoGiaoVien') IS NOT NULL
  DROP FUNCTION fn_TimLopTheoGiaoVien
GO
CREATE FUNCTION fn_TimLopTheoGiaoVien (@idgv int)
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

SET STATISTICS IO, time ON;
USE EnglishCenter;
SELECT
  *
FROM dbo.fn_TimLopTheoGiaoVien(3);



--26 Thêm Học Viên 
USE EnglishCenter;

IF OBJECT_ID('sp_ThemHocVien') IS NOT NULL
  DROP PROC sp_ThemHocVien;
GO

CREATE PROC sp_ThemHocVien @hoten nvarchar(50),
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

--26 Sửa Học Viên 
USE EnglishCenter;

IF OBJECT_ID('sp_SuaHocVien') IS NOT NULL
  DROP PROC sp_SuaHocVien;
GO

CREATE PROC sp_SuaHocVien @idhv int,
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
--27.Xóa Học Viên 
IF OBJECT_ID('sp_XoaHocVien') IS NOT NULL
  DROP PROC sp_XoaHocVien
GO
CREATE PROC sp_XoaHocVien @id_hv int
AS
  UPDATE HocVien
  SET TrangThai = '0'
  WHERE HocVienId = @id_hv;
GO
EXEC dbo.sp_XoaHocVien 1007;
--28.List Học Viên

USE EnglishCenter;

IF OBJECT_ID('fn_ListHocVien') IS NOT NULL
  DROP FUNCTION fn_ListHocVien;
GO

CREATE FUNCTION fn_ListHocVien
(
)
RETURNS TABLE
AS
  RETURN (SELECT
    *
  FROM HocVien
  WHERE TrangThai LIKE '1')
GO
--29. Tìm Học Viên Theo Tên
USE EnglishCenter;
GO
IF OBJECT_ID('sp_TimHocVienTheoTen') IS NOT NULL
  DROP PROC sp_TimHocVienTheoTen
GO
CREATE PROC sp_TimHocVienTheoTen @ten nvarchar(50)
AS
  SELECT
    *
  FROM HocVien
  WHERE UPPER(HocVien.HoTen_HV) LIKE '%' + @ten + '%'
  AND TrangThai LIKE '1'
GO







--Đặt điều kiện lớp không được > 20 học viên



USE EnglishCenter;
GO

IF OBJECT_ID('sp_demSoLuong') IS NOT NULL
  DROP PROC sp_demSoLuong
GO

CREATE PROC sp_demSoLuong @lopHocId int = 0
AS

  SELECT
    COUNT(*)
  FROM PhieuThu p
  JOIN LopHoc l
    ON p.LopHocId = l.LopHocId
  WHERE l.LopHocId = @lopHocId;
GO

--declare @soluong int;
--exec @soluong = sp_demSoLuong  1010;
--print 'count: '+ convert(varchar,@soluong);


--create a view 
USE EnglishCenter;
GO
IF OBJECT_ID('dsLop') IS NOT NULL
  DROP VIEW dsLop;
GO
CREATE VIEW dsLop
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

USE EnglishCenter;
GO
IF OBJECT_ID('dsHocVien') IS NOT NULL
  DROP VIEW dsHocVien;
GO
CREATE VIEW dsHocVien

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

--Them phieu thu
USE EnglishCenter;

IF OBJECT_ID('sp_ThemPhieuThu') IS NOT NULL
  DROP PROC sp_ThemPhieuThu;
GO

CREATE PROC sp_ThemPhieuThu @idhv int,
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

--Them tai khoan gv
USE EnglishCenter;
GO
IF OBJECT_ID('tr_ThemTaiKhoanGV') IS NOT NULL
  DROP TRIGGER tr_ThemTaiKhoanGV
GO

CREATE TRIGGER tr_ThemTaiKhoanGV
ON NhanVien
AFTER INSERT, UPDATE
AS
  IF (EXISTS (SELECT
      *
    FROM TaikhoanGiaoVien
    JOIN inserted
      ON TaikhoanGiaoVien.NhanVienId = inserted.NhanVienId)
    )
    UPDATE TaikhoanGiaoVien
    SET Username = NhanVien.Email,
        ChucVu = NhanVien.ChucVu,
        PassWords = NhanVien.SDT_NV,
        PhanQuyenId = PhanQuyen.PhanQuyenId
    FROM NhanVien
    JOIN PhanQuyen
      ON PhanQuyen.Ten_PhanQuyen LIKE NhanVien.ChucVu
    WHERE TaikhoanGiaoVien.NhanVienId = NhanVien.NhanVienId;
  ELSE
    INSERT INTO TaikhoanGiaoVien (NhanVienId, Username, ChucVu, PassWords, TrangThai, PhanQuyenId)
      SELECT
        NhanVienId,
        Email,
        ChucVu,
        SDT_NV,
        TrangThai,
        PhanQuyen.PhanQuyenId
      FROM inserted
      JOIN PhanQuyen
        ON PhanQuyen.Ten_PhanQuyen LIKE inserted.ChucVu
      WHERE NhanVienId = inserted.NhanVienId;
GO

--Xoa TKNV
USE EnglishCenter;
GO
IF OBJECT_ID('tr_XoaTaiKhoanGV') IS NOT NULL
  DROP TRIGGER tr_XoaTaiKhoanGV
GO

CREATE TRIGGER tr_XoaTaiKhoanGV
ON NhanVien
AFTER UPDATE
AS
BEGIN
  UPDATE TaikhoanGiaoVien
  SET TrangThai = '0'
  WHERE NhanVienId IN (SELECT
    NhanVien.NhanVienId
  FROM NhanVien
  WHERE NhanVien.TrangThai LIKE '0')

END
GO



--Tai khoan hoc vien
USE EnglishCenter;
GO
IF OBJECT_ID('tr_ThemTaiKhoanHV') IS NOT NULL
  DROP TRIGGER tr_ThemTaiKhoanHV
GO

CREATE TRIGGER tr_ThemTaiKhoanHV
ON HocVien
AFTER INSERT
AS
  INSERT INTO TaiKhoanHocVien (HocVienId, Username, PassWords, TrangThai, PhanQuyenId)
    SELECT
      HocVienId,
      HoTen_HV,
      SDT_HV,
      TrangThai,
      4
    FROM inserted
    WHERE HocVienId = inserted.HocVienId
GO

--Xoa TKNV
USE EnglishCenter;
GO
IF OBJECT_ID('tr_XoaTaiKhoanHV') IS NOT NULL
  DROP TRIGGER tr_XoaTaiKhoanHV
GO

CREATE TRIGGER tr_XoaTaiKhoanHV
ON HocVien
AFTER UPDATE
AS
BEGIN
  UPDATE TaiKhoanHocVien
  SET TrangThai = '0'
  WHERE HocVienId IN (SELECT
    HocVien.HocVienId
  FROM HocVien
  WHERE HocVien.TrangThai LIKE '0')
END
GO
EXEC dbo.sp_XoaHocVien 1007;
--Dang nhap user 


--du lieu nam o cay clusterd, uu tien cho cai quan trong nhat
--con lại nonclustered, 
--neu tim theo khoang -> clustered hieu qua hon
--2 dieu kien -> dieu kien = uu tien trc


--Kiểm tra tai khoản nhân viên 
USE EnglishCenter
GO

IF OBJECT_ID('sp_KiemTraTaiKhoanNV') IS NOT NULL
  DROP PROC sp_KiemTraTaiKhoanNV;
GO
CREATE PROC sp_KiemTraTaiKhoanNV (@idpq int OUTPUT,
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


--Kiểm tra tai khoản học viên 
USE EnglishCenter
GO

IF OBJECT_ID('sp_KiemTraTaiKhoanHV') IS NOT NULL
  DROP PROC sp_KiemTraTaiKhoanHV;
GO
CREATE PROC sp_KiemTraTaiKhoanHV (@idpq int OUTPUT,
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

DECLARE @id int
DECLARE @innv int
EXEC dbo.sp_KiemTraTaiKhoanNV @id OUTPUT,
                              @innv OUTPUT,
                              'Admin',
                              '123456789',
                              'Admin';
PRINT @id
PRINT @innv

--Lấy danh sách lớp học theo khoa học
USE EnglishCenter;

IF OBJECT_ID('fn_ListLopHocTheoKhoaHoc') IS NOT NULL
  DROP FUNCTION fn_ListLopHocTheoKhoaHoc;
GO

CREATE FUNCTION fn_ListLopHocTheoKhoaHoc (@idkh int)
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

--Lấy danh sách học viên của lớp học
USE EnglishCenter;

IF OBJECT_ID('fn_ListHocVienCuaLopHoc') IS NOT NULL
  DROP FUNCTION fn_ListHocVienCuaLopHoc;
GO
CREATE FUNCTION fn_ListHocVienCuaLopHoc (@idlh int)
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

--lấy danh sách phiếu thu 

USE EnglishCenter;

IF OBJECT_ID('fn_ListPhieuThu') IS NOT NULL
  DROP FUNCTION fn_ListPhieuThu;
GO
CREATE FUNCTION fn_ListPhieuThu (@idlh int)
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

--cập nhật phiếu thu
USE EnglishCenter;

IF OBJECT_ID('sp_CapNhatPhieuThu') IS NOT NULL
  DROP PROC sp_CapNhatPhieuThu;
GO

CREATE PROC sp_CapNhatPhieuThu @idpt int,
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
--tìm tên học viên trên phiếu thu
USE EnglishCenter;

IF OBJECT_ID('fn_TimTenTrenPhieuThu') IS NOT NULL
  DROP FUNCTION fn_TimTenTrenPhieuThu;
GO
CREATE FUNCTION fn_TimTenTrenPhieuThu (@idlh int,
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

-- Thêm tài khoản nhân viên
   
IF OBJECT_ID('sp_ThemTaiKhoanNV') IS NOT NULL
  DROP PROC sp_ThemTaiKhoanNV;
GO
CREATE PROC sp_ThemTaiKhoanNV @nhanvienid int,
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
--Sắp xếp tên admin