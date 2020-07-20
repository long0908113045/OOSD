using DevExpress.CodeParser;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QuanLiTrungTamAnhNgu.BuilderPattern
{
    class ControllerNhanVien
    {
        EnglishCenterEntities context = new EnglishCenterEntities();
       

        public NhanViens nhanVien;
        public ControllerNhanVien(NhanViens nhanVien)
        {
            NhanVienBuildDirector buildDirector = new NhanVienBuildDirector();
            if (nhanVien.chucvu == "Kế Toán")
            {
                nhanVien = buildDirector.Construct(new KeToanBuilder(), nhanVien.Manv, nhanVien.hoten, nhanVien.email, nhanVien.sdt, nhanVien.cmnd, nhanVien.ngaysinh);
            }
            if (nhanVien.chucvu == "Giáo Viên")
            {
                nhanVien = buildDirector.Construct(new GiaoVienBuilder(), nhanVien.Manv, nhanVien.hoten, nhanVien.email, nhanVien.sdt, nhanVien.cmnd, nhanVien.ngaysinh);
            }
            if (nhanVien.chucvu == "Nhân Viên")
            {
                nhanVien = buildDirector.Construct(new NhanVienBuilder(), nhanVien.Manv, nhanVien.hoten, nhanVien.email, nhanVien.sdt, nhanVien.cmnd, nhanVien.ngaysinh);
            }
            if (nhanVien.chucvu == "Quản Lý")
            {
                nhanVien = buildDirector.Construct(new AdminBuilder(), nhanVien.Manv, nhanVien.hoten, nhanVien.email, nhanVien.sdt, nhanVien.cmnd, nhanVien.ngaysinh);
            }
            this.nhanVien = nhanVien;
        }
        public bool themNhanVien()
        {  
            if(context.sp_ThemNhanVien( nhanVien.hoten, nhanVien.chucvu, nhanVien.email, nhanVien.sdt, nhanVien.cmnd, nhanVien.ngaysinh) != -1)
            {
                return true;
            }
            else
            {
                return false;
            }
        }
    }
}
