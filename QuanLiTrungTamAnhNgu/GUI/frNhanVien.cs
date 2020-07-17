using DevExpress.CodeParser;
using DevExpress.DataAccess.Native.Data;
using QuanLiTrungTamAnhNgu.SingletonPattern;
using System;
using System.Windows.Forms;

namespace QuanLiTrungTamAnhNgu
{
    public partial class frNhanVien : DevExpress.XtraEditors.XtraForm
    {
        public frNhanVien()
        {
            InitializeComponent();
            this.WindowState = FormWindowState.Maximized;
        }
        EnglishCenterEntities context = new EnglishCenterEntities();
        My_DB mydb = My_DB.getMy_DB;
        ControllerNhanVien ctnhanvien = new ControllerNhanVien();

        string hoten;
        string chucvu;
        string email;
        string sdt;
        string cmnd;
        DateTime ngaysinh;
        private void frNhanVien_Load(object sender, EventArgs e)
        {
            Load_CbTimChucVu();
            Load_CbChucVu();
            Load_NV();
            this.WindowState = FormWindowState.Maximized;

        }

        private void bttThemNV_Click(object sender, EventArgs e)
        {

            if (txtHoTenNV.Text.Replace(" ", "") != "" && txtSoDienThoaiNV.Text.Replace(" ", "") != "" && txtCMND.Text.Replace(" ", "") != "")
            {
                DialogResult dialogResult = MessageBox.Show("Bạn có muốn thêm nhân viên  này chứ!", "Thêm nhân viên ", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
                if (dialogResult == DialogResult.Yes)
                {
                    BuilderPattern.NhanViens nhanVien = new BuilderPattern.NhanViens();
                    nhanVien.hoten = txtHoTenNV.Text;
                    nhanVien.chucvu = cbxChucVu.Text;
                    nhanVien.sdt = txtSoDienThoaiNV.Text;
                    nhanVien.cmnd = txtCMND.Text;
                    nhanVien.email = txtEmailNV.Text;
                    ngaysinh = Convert.ToDateTime(dtNgaySinh.Value);
                    nhanVien.ngaysinh = ngaysinh;
                    BuilderPattern.ControllerNhanVien controllerNhanVien = new BuilderPattern.ControllerNhanVien(nhanVien);
                    if (controllerNhanVien.themNhanVien())
                    {
                        MessageBox.Show("Nhân viên đã được thêm vào", "Thêm nhân viên.", MessageBoxButtons.OK, MessageBoxIcon.Information);
                        Load_NV();
                    }
                    else
                    {
                        MessageBox.Show("Nhân Viên đã tồn tại", "Thêm nhân viên.", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                    }
                }
            }
            else
            {
                MessageBox.Show("Vui lòng điền hết thông tin", "Thêm nhân viên", MessageBoxButtons.OK, MessageBoxIcon.Warning);

            }
        }

        private void bttSuaNV_Click(object sender, EventArgs e)
        {
            if (txtHoTenNV.Text != "" && txtEmailNV.Text != "" && txtSoDienThoaiNV.Text != "" && txtCMND.Text != "" && cbxChucVu.Text != "")
            {
                int idnv = Convert.ToInt32(gvNhanVien.GetRowCellValue(gvNhanVien.FocusedRowHandle, gvNhanVien.Columns[0]).ToString());

                hoten = txtHoTenNV.Text;
                chucvu = cbxChucVu.Text;
                sdt = txtSoDienThoaiNV.Text;
                cmnd = txtCMND.Text;
                email = txtEmailNV.Text;
                ngaysinh = Convert.ToDateTime(dtNgaySinh.Value);
                DialogResult dialogResult = MessageBox.Show("Bạn có muốn sửa thông tin nhân viên này chứ!", "Sửa Nhân Viên", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
                if (dialogResult == DialogResult.Yes)
                {
                    if (context.sp_SuaNhanVien(idnv, hoten, chucvu, email, sdt, cmnd, ngaysinh) != 0)
                    {
                        MessageBox.Show("Đã sửa thông tin nhân viên ", "Sửa Nhân Viên", MessageBoxButtons.OK, MessageBoxIcon.Information);
                        Load_NV();
                    }
                    else
                        MessageBox.Show(" Lỗi", "Sửa Nhân Viên", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                }
            }
            else
            {
                MessageBox.Show("Xin nhập thêm thông tin!", "Sửa Nhân Viên ", MessageBoxButtons.OK, MessageBoxIcon.Warning);
            }
        }

        private void bttXoaNV_Click(object sender, EventArgs e)
        {
            int idnv = Convert.ToInt32(gvNhanVien.GetRowCellValue(gvNhanVien.FocusedRowHandle, gvNhanVien.Columns[0]).ToString());
            if (txtHoTenNV.Text.Replace(" ", "") != "" && txtSoDienThoaiNV.Text.Replace(" ", "") != "" && txtCMND.Text.Replace(" ", "") != "" && cbxChucVu.Text.Replace(" ", "") != "" && txtEmailNV.Text.Replace(" ", "") != "")
            {
                DialogResult dialogResult = MessageBox.Show("Bạn có muốn xóa nhân viên  này chứ!", "Xóa nhân viên ", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
                if (dialogResult == DialogResult.Yes)
                {
                    if (context.sp_XoaNhanVien(idnv) != 0)
                    {
                        MessageBox.Show("Đã xóa nhân viên.", "Xóa nhân viên ", MessageBoxButtons.OK, MessageBoxIcon.Information);
                        Refresh();

                    }
                    else
                        MessageBox.Show("Nhân viên chưa xóa được nha.", "Xóa nhân viên ", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                }
                Load_NV();
            }
            else
            {
                MessageBox.Show("Vui Long dien het thong tin", "Xóa Nhan vien", MessageBoxButtons.OK, MessageBoxIcon.Information);

            }
        }
        private void Refresh()
        {
           
            txtHoTenNV.Text = "";
            txtSoDienThoaiNV.Text = "";
            txtEmailNV.Text = "";
            txtCMND.Text = "";
            cbxChucVu.Text = "";
            dtNgaySinh.Value = DateTime.Now;
        }
        private void btnRefresh_Click(object sender, EventArgs e)
        {
            Refresh();
            Load_NV();
        }




        private void gvNhanVien_Click(object sender, EventArgs e)
        {
            if (gvNhanVien.RowCount > 0)
            {
                txtHoTenNV.EditValue = gvNhanVien.GetRowCellValue(gvNhanVien.FocusedRowHandle, gvNhanVien.Columns[2]).ToString();
                cbxChucVu.Text = gvNhanVien.GetRowCellValue(gvNhanVien.FocusedRowHandle, gvNhanVien.Columns[3]).ToString();
                txtEmailNV.EditValue = gvNhanVien.GetRowCellValue(gvNhanVien.FocusedRowHandle, gvNhanVien.Columns[4]).ToString();
                txtSoDienThoaiNV.EditValue = gvNhanVien.GetRowCellValue(gvNhanVien.FocusedRowHandle, gvNhanVien.Columns[5]).ToString();
                txtCMND.EditValue = gvNhanVien.GetRowCellValue(gvNhanVien.FocusedRowHandle, gvNhanVien.Columns[6]).ToString();
                dtNgaySinh.Value = DateTime.Parse(gvNhanVien.GetRowCellValue(gvNhanVien.FocusedRowHandle, gvNhanVien.Columns[7]).ToString());
            }
        }
        private void Load_NV()
        {
            gcNhanVien.DataSource = ctnhanvien.getNhanVien();
            gvNhanVien.Columns[0].Visible = false;
            gvNhanVien.Columns[1].Visible = false;
            gvNhanVien.Columns[2].Caption = "Họ Tên";
            gvNhanVien.Columns[3].Caption = "Chức vụ";
            gvNhanVien.Columns[4].Caption = "Email";
            gvNhanVien.Columns[5].Caption = "Số điện thoại";
            gvNhanVien.Columns[6].Caption = "CMND";
            gvNhanVien.Columns[7].Caption = "Ngày sinh";
            gvNhanVien.Columns[8].Visible = false;
        }
        private void Load_CbChucVu()
        {
            cbxChucVu.Items.Add("Kế Toán");
            cbxChucVu.Items.Add("Giáo Viên");
            cbxChucVu.Items.Add("Nhân Viên");
            cbxChucVu.Items.Add("Quản Lý");

        }
        private void Load_CbTimChucVu()
        {
            cbxTimChucVu.Items.Add("Kế Toán");
            cbxTimChucVu.Items.Add("Giáo Viên");
            cbxTimChucVu.Items.Add("Nhân Viên");
        }
        private void bttLHuy_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void btnTimKiem_Click(object sender, EventArgs e)
        {
            string chucvu;
            if (cbxTimChucVu.Text == "")
                chucvu = null;
            else
                chucvu = cbxTimChucVu.Text;
            //gcNhanVien.DataSource = context.sp_TimNhanVienTheoTen(txtTimTen.Text.ToUpper(), chucvu);
            gcNhanVien.DataSource = ctnhanvien.searchNhanVien(txtTimTen.Text.ToUpper(), chucvu);
            gvNhanVien.Columns[0].Visible = false;
            gvNhanVien.Columns[1].Visible = false;
            gvNhanVien.Columns[2].Caption = "Họ Tên";
            gvNhanVien.Columns[3].Caption = "Chức vụ";
            gvNhanVien.Columns[4].Caption = "Email";
            gvNhanVien.Columns[5].Caption = "Số điện thoại";
            gvNhanVien.Columns[6].Caption = "CMND";
            gvNhanVien.Columns[7].Caption = "Ngày sinh";
            gvNhanVien.Columns[8].Visible = false;
            if (gvNhanVien.RowCount == 0)
                MessageBox.Show("Không Tìm Thấy ");
        }

    }
}