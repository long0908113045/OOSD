using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace QuanLiTrungTamAnhNgu
{
    public partial class frHocVien : Form
    {
        public frHocVien()
        {
            InitializeComponent();
            this.WindowState = FormWindowState.Maximized;
        }
        EnglishCenterEntities context = new EnglishCenterEntities();
        string mahv;
        string hoTen;
        string diaChi;
        string email;
        string soDienThoai;
        private void bttThemHV_Click(object sender, EventArgs e)
        {
            mahv = txtMaHV.Text;
            hoTen = txtHoTenHV.Text;
            diaChi = txtDiaChiHV.Text;
            email = txtEmailHV.Text;
            soDienThoai = txtSoDienThoaiHV.Text;
            if (txtHoTenHV.Text == null ||
              txtDiaChiHV.Text == null ||
              txtEmailHV.Text == null ||
              txtSoDienThoaiHV.Text == null ||
              txtMaHV.Text == null
              )
            {
                MessageBox.Show("Bạn chưa điền đủ thông tin!", "Thêm học viên.", MessageBoxButtons.OK, MessageBoxIcon.Warning);
            }
            else
            {
                DialogResult dialogResult = MessageBox.Show("Bạn muốn thêm học viên này?", "Thêm học viên.", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
                if (dialogResult == DialogResult.Yes)
                {

                    if (context.sp_ThemHocVien(mahv, hoTen, diaChi, email, soDienThoai) !=-1 )
                    {
                        MessageBox.Show("Bạn đã thêm học viên thành công!", "Thêm học viên.", MessageBoxButtons.OK, MessageBoxIcon.Information);
                        Load_HocVien();
                    }
                    else
                    {
                        MessageBox.Show("Học Viên Đã Tồn Tại!");
                    }
                }
            }
        }

        private void bttSuaHV_Click(object sender, EventArgs e)
        {

            mahv = txtMaHV.Text;
            hoTen = txtHoTenHV.Text;
            diaChi = txtDiaChiHV.Text;
            email = txtEmailHV.Text;
            soDienThoai = txtSoDienThoaiHV.Text;
            if (txtHoTenHV.Text == null ||
              txtDiaChiHV.Text == null ||
              txtEmailHV.Text == null ||
              txtSoDienThoaiHV.Text == null)
            {
                MessageBox.Show("Bạn chưa điền đủ thông tin!", "Sửa học viên.", MessageBoxButtons.OK, MessageBoxIcon.Warning);
            }
            else
            {
                DialogResult dialogResult = MessageBox.Show("Bạn muốn sửa học viên này?", "Sửa học viên.", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
                if (dialogResult == DialogResult.Yes)
                {
                    int id = Convert.ToInt32(gvHocVien.GetRowCellValue(gvHocVien.FocusedRowHandle, gvHocVien.Columns[0]).ToString());

                    if (context.sp_SuaHocVien(id, mahv, hoTen, diaChi, email, soDienThoai) !=0)
                    {
                        MessageBox.Show("Bạn đã sửa học viên thành công!", "Sửa học viên.", MessageBoxButtons.OK, MessageBoxIcon.Information);
                        Load_HocVien();
                    }
                    else
                    {
                        MessageBox.Show("Lỗi", "Sửa học viên", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                    }
                }
            }
        }

        private void bttXoaHV_Click(object sender, EventArgs e)
        {
            if (txtHoTenHV.Text == null ||
               txtDiaChiHV.Text == null ||
               txtEmailHV.Text == null ||
               txtSoDienThoaiHV.Text == null)
            {
                MessageBox.Show("Bạn chưa điền đủ thông tin!", "Sửa học viên.", MessageBoxButtons.OK, MessageBoxIcon.Warning);
            }
            else
            {
                DialogResult dialogResult = MessageBox.Show("Bạn muốn xóa học viên này?", "Xóa học viên.", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
                if (dialogResult == DialogResult.Yes)
                {
                    int id = Convert.ToInt32(gvHocVien.GetRowCellValue(gvHocVien.FocusedRowHandle, gvHocVien.Columns[0]).ToString());

                    if (context.sp_XoaHocVien(id) !=0)
                    {
                        MessageBox.Show("Bạn đã xóa học viên thành công!", "Xóa học viên.", MessageBoxButtons.OK, MessageBoxIcon.Information);
                        Load_HocVien();
                    }
                    else
                    {
                        MessageBox.Show("Lỗi");
                    }
                }
            }
        }

        private void bttLHuy_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void btnRefresh_Click(object sender, EventArgs e)
        {
            txtMaHV.Text = "";
            txtMaHV.Enabled = true;
            txtHoTenHV.Text = "";
            txtEmailHV.Text = "";
            txtDiaChiHV.Text = "";
            txtSoDienThoaiHV.Text = "";
        }

        private void frHocVien_Load(object sender, EventArgs e)
        {
            Load_HocVien();
        }
        private void Load_HocVien()
        {
            gcHocVien.DataSource = (context.fn_ListHocVien()).ToList();
            gvHocVien.Columns[0].Visible = false;
            gvHocVien.Columns[1].Caption = "Mã học viên";
            gvHocVien.Columns[2].Caption = "Họ tên";
            gvHocVien.Columns[3].Caption = "Địa chỉ";
            gvHocVien.Columns[4].Caption = "Email";
            gvHocVien.Columns[5].Caption = "Số điện thoại";
            gvHocVien.Columns[6].Visible = false;
        }

        private void gvHocVien_Click(object sender, EventArgs e)
        {
            if (gvHocVien.RowCount > 0)
            {

                txtMaHV.EditValue = gvHocVien.GetRowCellValue(gvHocVien.FocusedRowHandle, gvHocVien.Columns[1]).ToString();
                txtMaHV.Enabled = false;
                txtHoTenHV.EditValue = gvHocVien.GetRowCellValue(gvHocVien.FocusedRowHandle, gvHocVien.Columns[2]).ToString();
                txtDiaChiHV.Text = gvHocVien.GetRowCellValue(gvHocVien.FocusedRowHandle, gvHocVien.Columns[3]).ToString();
                txtEmailHV.EditValue = gvHocVien.GetRowCellValue(gvHocVien.FocusedRowHandle, gvHocVien.Columns[4]).ToString();
                txtSoDienThoaiHV.EditValue = gvHocVien.GetRowCellValue(gvHocVien.FocusedRowHandle, gvHocVien.Columns[5]).ToString();
            }
        }

        private void btnTimKiem_Click(object sender, EventArgs e)
        {
            gcHocVien.DataSource = context.sp_TimHocVienTheoTen(txtTimTen.Text).ToList();
            gvHocVien.Columns[0].Visible = false;
            gvHocVien.Columns[1].Caption = "Mã học viên";
            gvHocVien.Columns[2].Caption = "Họ tên";
            gvHocVien.Columns[3].Caption = "Địa chỉ";
            gvHocVien.Columns[4].Caption = "Email";
            gvHocVien.Columns[5].Caption = "Số điện thoại";
            gvHocVien.Columns[6].Visible = false;
            if (gvHocVien.RowCount == 0)
                MessageBox.Show("Không tìm thấy học viên");
        }
    }
}
