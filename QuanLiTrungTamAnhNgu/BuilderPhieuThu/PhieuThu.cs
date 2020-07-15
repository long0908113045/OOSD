using QuanLiTrungTamAnhNgu.SingletonPattern;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data.SqlTypes;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QuanLiTrungTamAnhNgu.BuilderPhieuThu
{
    class PhieuThu
    {
        EnglishCenterEntities context = new EnglishCenterEntities();
        public int PhieuThuId { get; set; }
        public DateTime NgayThanhToan { get; set; }
        public int HocVienId { get; set; }
        public int LopHocId { get; set; }
        public decimal SoTien { get; set; }
        public int NhanVienId { get; set; }
        public int PhuongThucThanhToanId { get; set; }

        //public PhieuThuModel(DateTime ngayThanhToan, string phuongThucThanhToan, int hocVienId, int lopHocId, decimal soTien, int nhanVienId)
        //{
        //    this.NgayThanhToan = ngayThanhToan;
        //    this.PhuongThucThanhToan = phuongThucThanhToan;
        //    this.HocVienId = hocVienId;
        //    this.LopHocId = lopHocId;
        //    this.SoTien = soTien;
        //    this.NhanVienId = nhanVienId;
        //}
        
        public bool DangKyLopHoc()
        {
            if (context.sp_ThemPhieuThu(HocVienId, LopHocId, NhanVienId) != -1)
            {
                return true;
            }
            return false;
        }
        public bool ThuTien()
        {           
            if (context.sp_CapNhatPhieuThu(PhieuThuId, NgayThanhToan, SoTien, HocVienId, LopHocId, NhanVienId, PhuongThucThanhToanId) != 0)
            {
                return true;
            }
            return false;
        }

    }
}
