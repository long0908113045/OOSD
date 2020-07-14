using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QuanLiTrungTamAnhNgu.BuilderPhieuThu
{
    class PhieuThuBuilder: IPhieuThuBuilder
    {
        PhieuThu PhieuThu = new PhieuThu();
        public PhieuThu build()
        {
            return PhieuThu;
        }
        public IPhieuThuBuilder PhieuThuId(int phieuThuId)
        {
            this.PhieuThu.PhieuThuId = phieuThuId;
            return this;
        }
        public IPhieuThuBuilder HocVienId(int hocVienId)
        {
            this.PhieuThu.HocVienId = hocVienId;
            return this;
        }

        public IPhieuThuBuilder LopHocId(int lopHocId)
        {
            this.PhieuThu.LopHocId = lopHocId;
            return this;
        }

        public IPhieuThuBuilder NgayThanhToan(DateTime ngayThanhToan)
        {
            this.PhieuThu.NgayThanhToan = ngayThanhToan;
            return this;
        }

        public IPhieuThuBuilder NhanVienId(int nhanVienId)
        {
            this.PhieuThu.NhanVienId = nhanVienId;
            return this;
        }

        public IPhieuThuBuilder PhuongThucThanhToan(string phuongThucThanhToan)
        {
            this.PhieuThu.PhuongThucThanhToan = phuongThucThanhToan;
            return this;
        }

        public IPhieuThuBuilder SoTien(decimal soTien)
        {
            this.PhieuThu.SoTien = soTien;
            return this;
        }
    }
}
