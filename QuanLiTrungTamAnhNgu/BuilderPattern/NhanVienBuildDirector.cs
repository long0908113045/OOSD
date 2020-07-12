using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QuanLiTrungTamAnhNgu.BuilderPattern
{
    class NhanVienBuildDirector
    {
        public NhanVien Construct(INhanVienBuilder builder, string manv, string hoten,string email,string sdt,string cmnd,DateTime ngaysinh)
        {
            
            builder.Setmanv(manv);
            builder.Sethoten(hoten);
            builder.Setemail(email);
            builder.Setsdt(sdt);
            builder.Setcmnd(cmnd);
            builder.Setngaysinh(ngaysinh);
           
            NhanVien nhanVien = builder.GetNhanVien();
            
            
            return nhanVien;
        }
    }
}
