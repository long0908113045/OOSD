using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QuanLiTrungTamAnhNgu.BuilderPattern
{
    interface INhanVienBuilder
    {
        void Setmanv(string manv);
        void Sethoten(string hoten);        
        void Setemail(string email);
        void Setsdt(string sdt);
        void Setcmnd(string cmnd);
        void Setngaysinh(DateTime ngaysinh);
        NhanVien GetNhanVien();

    }
}
