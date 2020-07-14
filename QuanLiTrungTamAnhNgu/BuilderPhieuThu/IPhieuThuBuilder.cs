using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QuanLiTrungTamAnhNgu.BuilderPhieuThu
{
    interface IPhieuThuBuilder
    {
        IPhieuThuBuilder PhieuThuId(int phieuThuId);
        IPhieuThuBuilder NgayThanhToan(DateTime ngayThanhToan);
        IPhieuThuBuilder PhuongThucThanhToan(string phuongThucThanhToan);
        IPhieuThuBuilder HocVienId(int hocVienId);
        IPhieuThuBuilder LopHocId(int lopHocId);
        IPhieuThuBuilder SoTien(decimal soTien);
        IPhieuThuBuilder NhanVienId(int nhanVienId);
        PhieuThu build();
    }
}
