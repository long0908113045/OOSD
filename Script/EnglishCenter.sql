USE [EnglishCenter]
GO
/****** Object:  Table [dbo].[HocVien]    Script Date: 14/07/2020 4:31:14 PM ******/
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
/****** Object:  Table [dbo].[KhoaHoc]    Script Date: 14/07/2020 4:31:14 PM ******/
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
/****** Object:  Table [dbo].[Levels]    Script Date: 14/07/2020 4:31:14 PM ******/
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
/****** Object:  Table [dbo].[LopHoc]    Script Date: 14/07/2020 4:31:14 PM ******/
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
/****** Object:  Table [dbo].[NhanVien]    Script Date: 14/07/2020 4:31:14 PM ******/
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
/****** Object:  Table [dbo].[PhanQuyen]    Script Date: 14/07/2020 4:31:14 PM ******/
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
/****** Object:  Table [dbo].[PhieuThu]    Script Date: 14/07/2020 4:31:14 PM ******/
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
/****** Object:  Table [dbo].[TaikhoanGiaoVien]    Script Date: 14/07/2020 4:31:14 PM ******/
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
/****** Object:  Table [dbo].[TaiKhoanHocVien]    Script Date: 14/07/2020 4:31:14 PM ******/
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
INSERT [dbo].[HocVien] ([HocVienId], [Ma_HV], [HoTen_HV], [DiaChi_HV], [Email_HV], [SDT_HV], [TrangThai]) VALUES (1018, NULL, N'truc', N'1vvn', N'w', N'123', N'0')
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
INSERT [dbo].[LopHoc] ([LopHocId], [Ma_LH], [Ten_LH], [ThoiGianBatDau_LH], [ThoiGianKetThuc_LH], [HocPhi], [NhanVienId], [KhoaHocId], [LevelsId], [SoBuoiHoc], [KhungGioHoc], [SoLuongHocVien], [TrangThai]) VALUES (1013, N'GTCB_01', N'Giao tiếp cơ bản', CAST(N'2019-12-09' AS Date), CAST(N'2020-12-01' AS Date), CAST(6000000 AS Numeric(18, 0)), 1017, 9, 51, 42, N'3-5-7 19h - 21h', NULL, N'0')
INSERT [dbo].[LopHoc] ([LopHocId], [Ma_LH], [Ten_LH], [ThoiGianBatDau_LH], [ThoiGianKetThuc_LH], [HocPhi], [NhanVienId], [KhoaHocId], [LevelsId], [SoBuoiHoc], [KhungGioHoc], [SoLuongHocVien], [TrangThai]) VALUES (1014, NULL, N'Giao tiếp cơ bản', CAST(N'2018-07-05' AS Date), CAST(N'2021-09-30' AS Date), CAST(50000000 AS Numeric(18, 0)), 1018, 9, 51, 42, N'2 4 6', NULL, N'1')
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
INSERT [dbo].[NhanVien] ([NhanVienId], [Ma_NV], [HoTen_NV], [ChucVu], [Email], [SDT_NV], [CMND], [Birthday], [TrangThai]) VALUES (1020, NULL, N'daotung', N'Giáo Viên', N'tubg', N'231', N'3123', CAST(N'2020-02-13T11:29:36.000' AS DateTime), N'0')
INSERT [dbo].[NhanVien] ([NhanVienId], [Ma_NV], [HoTen_NV], [ChucVu], [Email], [SDT_NV], [CMND], [Birthday], [TrangThai]) VALUES (1021, NULL, N'a', N'Giáo Viên', N'a@gmail.com', N'123', N'13', CAST(N'2020-07-14T00:00:00.000' AS DateTime), N'1')
INSERT [dbo].[NhanVien] ([NhanVienId], [Ma_NV], [HoTen_NV], [ChucVu], [Email], [SDT_NV], [CMND], [Birthday], [TrangThai]) VALUES (1022, NULL, N'Tung', N'Nhân Viên', N'Tung', N'213', N'123', CAST(N'2019-06-14T15:59:55.000' AS DateTime), N'1')
SET IDENTITY_INSERT [dbo].[NhanVien] OFF
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
INSERT [dbo].[TaikhoanGiaoVien] ([TaiKhoanGiaoVienId], [NhanVienId], [Username], [ChucVu], [PassWords], [TrangThai], [PhanQuyenId]) VALUES (1015, 1021, N'a', N'Giáo Viên', N'123', N'1', 2)
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
