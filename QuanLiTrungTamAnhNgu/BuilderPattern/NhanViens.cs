using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QuanLiTrungTamAnhNgu.BuilderPattern
{
    class NhanViens
    {

        private string manv;
        public string hoten { get; set; }
        public string chucvu { get; set; }
        public string email { get; set; }
        public string sdt { get; set; }
        public string cmnd { get; set; }


        public DateTime ngaysinh { get; set; }
        public string Manv { get => manv; set => manv = value; }

        public NhanViens()
        {

        }

        public NhanViens(string manv, string hoten, string chucvu, string email, string sdt, string cmnd, DateTime ngaysinh)
        {
            this.Manv = manv;
            this.hoten = hoten;
            this.chucvu = chucvu;
            this.email = email;
            this.sdt = sdt;
            this.cmnd = cmnd;
            this.ngaysinh = ngaysinh;
        }

        public string getHoten() {
            return this.hoten;
        }


    }
}
