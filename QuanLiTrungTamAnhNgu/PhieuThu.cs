//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace QuanLiTrungTamAnhNgu
{
    using System;
    using System.Collections.Generic;
    
    public partial class PhieuThu
    {
        public int PhieuThuId { get; set; }
        public Nullable<System.DateTime> NgayThanhToan { get; set; }
        public int HocVienId { get; set; }
        public int LopHocId { get; set; }
        public Nullable<decimal> SoTien { get; set; }
        public Nullable<int> NhanVienId { get; set; }
        public Nullable<int> PhuongThucThanhToanId { get; set; }
    
        public virtual HocVien HocVien { get; set; }
        public virtual LopHoc LopHoc { get; set; }
        public virtual NhanVien NhanVien { get; set; }
    }
}
