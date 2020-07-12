using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Linq;
using System.Threading.Tasks;
using System.Windows.Forms;
using DevExpress.XtraEditors;

namespace QuanLiTrungTamAnhNgu
{
    public partial class frListAdmin : DevExpress.XtraEditors.XtraForm
    {
        public frListAdmin()
        {
            InitializeComponent();
            this.WindowState = FormWindowState.Maximized;
        }
        EnglishCenterEntities context = new EnglishCenterEntities();
        private void frHocVien_DangNhap_Load(object sender, EventArgs e)
        {
            Load_Admin();
        }
       
        private void btnTimKiem_Click(object sender, EventArgs e)
        {
            gcAdmin.DataSource = context.sp_TimNhanVienTheoTen(txtGV.Text.ToUpper(), "Admin");
            gvAdmin.Columns[0].Visible = false;
            gvAdmin.Columns[1].Caption = "Mã Nhân Viên";
            gvAdmin.Columns[2].Caption = "Họ Tên";
            gvAdmin.Columns[3].Caption = "Chức vụ";
            gvAdmin.Columns[4].Caption = "Email";
            gvAdmin.Columns[5].Caption = "Số điện thoại";
            gvAdmin.Columns[6].Caption = "CMND";
            gvAdmin.Columns[7].Caption = "Ngày sinh";
            gvAdmin.Columns[8].Visible = false;
            if (gvAdmin.RowCount == 0)
                MessageBox.Show("Không Tìm Thấy ");
        }

        private void btSapXep_Click(object sender, EventArgs e)
        {
            if (rdTheoTen.Checked == true)
            {
                gcAdmin.DataSource = (from nv in context.sp_TimNhanVienTheoTen("", "Admin")
                                       select nv).OrderBy(n=>n.HoTen_NV).ToList();
                gvAdmin.Columns[0].Visible = false;
                gvAdmin.Columns[1].Caption = "Mã Nhân Viên";
                gvAdmin.Columns[2].Caption = "Họ Tên";
                gvAdmin.Columns[3].Caption = "Chức vụ";
                gvAdmin.Columns[4].Caption = "Email";
                gvAdmin.Columns[5].Caption = "Số điện thoại";
                gvAdmin.Columns[6].Caption = "CMND";
                gvAdmin.Columns[7].Caption = "Ngày sinh";
                gvAdmin.Columns[8].Visible = false;
            }
            if (rdNgay.Checked == true)
            {
                gcAdmin.DataSource = (from nv in context.sp_TimNhanVienTheoTen("", "Admin")
                                      select nv).OrderBy(n => n.Birthday).ToList();
                gvAdmin.Columns[0].Visible = false;
                gvAdmin.Columns[1].Caption = "Mã Nhân Viên";
                gvAdmin.Columns[2].Caption = "Họ Tên";
                gvAdmin.Columns[3].Caption = "Chức vụ";
                gvAdmin.Columns[4].Caption = "Email";
                gvAdmin.Columns[5].Caption = "Số điện thoại";
                gvAdmin.Columns[6].Caption = "CMND";
                gvAdmin.Columns[7].Caption = "Ngày sinh";
                gvAdmin.Columns[8].Visible = false;
            }
        }
        private void Load_Admin()
        {
            gcAdmin.DataSource = (from nv in context.sp_TimNhanVienTheoTen("", "Admin")
                                  select nv).ToList();
            gvAdmin.Columns[0].Visible = false;
            gvAdmin.Columns[1].Caption = "Mã Nhân Viên";
            gvAdmin.Columns[2].Caption = "Họ Tên";
            gvAdmin.Columns[3].Caption = "Chức vụ";
            gvAdmin.Columns[4].Caption = "Email";
            gvAdmin.Columns[5].Caption = "Số điện thoại";
            gvAdmin.Columns[6].Caption = "CMND";
            gvAdmin.Columns[7].Caption = "Ngày sinh";
            gvAdmin.Columns[8].Visible = false;
        }
    }
}