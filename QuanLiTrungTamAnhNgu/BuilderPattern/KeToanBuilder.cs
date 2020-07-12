using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QuanLiTrungTamAnhNgu.BuilderPattern
{
    class KeToanBuilder:INhanVienBuilder
    {
        private NhanVien nhanvien;
        public KeToanBuilder()
        {
            nhanvien = new NhanVien();
            nhanvien.chucvu = "Kế Toán";
        }
        public NhanVien GetNhanVien()
        {
            return this.nhanvien;
        }


        public void Setcmnd(string cmnd)
        {
            this.nhanvien.cmnd = cmnd;
        }



        public void Setemail(string email)
        {
            this.nhanvien.email = email;
        }



        public void Sethoten(string hoten)
        {
            this.nhanvien.hoten = hoten;
        }



        public void Setmanv(string manv)
        {
            this.nhanvien.manv = manv;
        }

        public void Setsdt(string sdt)
        {
            this.nhanvien.sdt = sdt;
        }
        public void Setngaysinh(DateTime ngaysinh)
        {
            this.nhanvien.ngaysinh = ngaysinh;
        }
    }
}

