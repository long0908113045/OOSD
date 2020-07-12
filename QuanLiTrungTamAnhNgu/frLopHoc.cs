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
using System.Data.Entity;

namespace QuanLiTrungTamAnhNgu
{
    public partial class frLopHoc : DevExpress.XtraEditors.XtraForm
    {
        public frLopHoc()
        {
            InitializeComponent();

            this.WindowState = FormWindowState.Maximized;
        }
        EnglishCenterEntities context = new EnglishCenterEntities();
        string tenlh;
        int id_gv;
        int id_kh;
        int id_lv;
        string malh;
        decimal hocphi;
        string khunggiohoc;
        DateTime ngaybatdau;
        DateTime ngayketthuc;
        int sobuoihoc;

        private void frLopHoc_Load(object sender, EventArgs e)
        {
            Load_GiaoVien(cbxGV);
            Load_CbKhoaHoc(cbxKhoaHoc);
            Load_CbLevel(cbxLevel);
            Load_LopHoc();
        }

        private void Load_CbKhoaHoc(LookUpEdit lookUpEdit)
        {
            lookUpEdit.Properties.DataSource = (from kh in context.fn_ListKhoaHoc()
                                                select new { kh.Ten_KH, kh.KhoaHocId }).ToList();
            lookUpEdit.Properties.DisplayMember = "Ten_KH";
            lookUpEdit.Properties.ValueMember = "KhoaHocId";
            lookUpEdit.Properties.PopulateColumns();
            lookUpEdit.Properties.Columns["KhoaHocId"].Visible = false;
        }
        private void Load_CbLevel(LookUpEdit lookUpEdit)
        {
            lookUpEdit.Properties.DataSource = (from lv in context.fn_LoadLevel1()
                                                select new { lv.Ten_Level, lv.LevelsId }).ToList();
            lookUpEdit.Properties.DisplayMember = "Ten_Level";

            lookUpEdit.Properties.ValueMember = "LevelsId";
            lookUpEdit.Properties.PopulateColumns();
            lookUpEdit.Properties.Columns["LevelsId"].Visible = false;
        }
        private void Load_GiaoVien(LookUpEdit lookUpEdit)
        {
            lookUpEdit.Properties.DataSource = (context.view_ListGiaoVien).ToList();

            lookUpEdit.Properties.DisplayMember = "HoTen_NV";
            lookUpEdit.Properties.ValueMember = "NhanVienId";
            lookUpEdit.Properties.PopulateColumns();
            lookUpEdit.Properties.Columns["NhanVienId"].Visible = false;
        }


        private void bttThemLH_Click(object sender, EventArgs e)
        {
            if (txtHocPhi.Text.Replace(" ", "") != "" && txtMaLop.Text.Replace(" ", "") != "" && txtTenLop.Text.Replace(" ", "") != ""
                && cbxGV.Text != "" && cbxKhoaHoc.Text != "" && cbxLevel.Text != "")
            {
                DialogResult dialogResult = MessageBox.Show("Bạn có muốn thêm lớp học  này chứ!", "Thêm Lớp Học ", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
                if (dialogResult == DialogResult.Yes)
                {
                    malh = txtMaLop.Text;
                    tenlh = txtTenLop.Text;
                    hocphi = Convert.ToDecimal(txtHocPhi.Text);
                    sobuoihoc = Convert.ToInt32(txtSoBuoiHoc.Text);
                    ngaybatdau = Convert.ToDateTime(dtThoiGianBatDau.Value);
                    ngayketthuc = Convert.ToDateTime(dtThoiGianKetThuc.Value);
                    khunggiohoc = txtThoiGianHoc.Text;
                    id_gv = Convert.ToInt32(cbxGV.EditValue);
                    id_kh = Convert.ToInt32(cbxKhoaHoc.EditValue);
                    id_lv = Convert.ToInt32(cbxLevel.EditValue);


                    if (context.sp_ThemLopHoc(malh, tenlh, ngaybatdau, ngayketthuc, hocphi, id_gv, id_kh, id_lv, sobuoihoc, khunggiohoc) == 1)
                    {
                        MessageBox.Show("Lớp học đã được thêm vào", "Thêm lớp học.", MessageBoxButtons.OK, MessageBoxIcon.Information);
                        Load_LopHoc();
                    }
                    else
                    {
                        MessageBox.Show("Lớp học đã tồn tại", "Thêm lớp học.", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                    }
                }
            }
            else
            {
                MessageBox.Show("Vui lòng điền hết thông tin", "Thêm Lớp Học", MessageBoxButtons.OK, MessageBoxIcon.Information);
            }
        }

        private void bttSuaLH_Click(object sender, EventArgs e)
        {
            if (txtHocPhi.Text.Replace(" ", "") != "" && txtMaLop.Text.Replace(" ", "") != "" && txtTenLop.Text.Replace(" ", "") != ""
                && cbxGV.Text != "" && cbxKhoaHoc.Text != "" && cbxLevel.Text != "")
            {
                DialogResult dialogResult = MessageBox.Show("Bạn có muốn sửa thông tin lớp học  này không?", "Sửa Lớp Học ", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
                if (dialogResult == DialogResult.Yes)
                {
                    malh = txtMaLop.Text;
                    tenlh = txtTenLop.Text;
                    hocphi = Convert.ToDecimal(txtHocPhi.Text);
                    sobuoihoc = Convert.ToInt32(txtSoBuoiHoc.Text);
                    ngaybatdau = Convert.ToDateTime(dtThoiGianBatDau.Value);
                    ngayketthuc = Convert.ToDateTime(dtThoiGianKetThuc.Value);
                    khunggiohoc = txtThoiGianHoc.Text;
                    id_gv = Convert.ToInt32(cbxGV.EditValue);
                    id_kh = Convert.ToInt32(cbxKhoaHoc.EditValue);
                    id_lv = Convert.ToInt32(cbxLevel.EditValue);

                    if (context.sp_SuaLopHoc(malh, tenlh, ngaybatdau.Date, ngayketthuc.Date, hocphi, id_gv, id_kh, id_lv, sobuoihoc, khunggiohoc) == 1)
                    {
                        MessageBox.Show("Đã Sửa Lớp Học", "Sửa lớp học.", MessageBoxButtons.OK, MessageBoxIcon.Information);
                        Load_LopHoc();
                    }
                    else
                        MessageBox.Show("Lỗi rồi nhé.", "Sửa lớp học.", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                }
            }
            else
            {
                MessageBox.Show("Vui lòng điền hết thông tin", "Sửa Lớp Học", MessageBoxButtons.OK, MessageBoxIcon.Warning);
            }
        }

        private void bttXoaLH_Click(object sender, EventArgs e)
        {
            if (txtHocPhi.Text.Replace(" ", "") != "" && txtMaLop.Text.Replace(" ", "") != "" && txtTenLop.Text.Replace(" ", "") != ""
                  && cbxGV.Text != "" && cbxKhoaHoc.Text != "" && cbxLevel.Text != "")
            {
                DialogResult dialogResult = MessageBox.Show("Bạn có muốn xóa lớp học  này chứ!", "Xóa Lớp Học ", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
                if (dialogResult == DialogResult.Yes)
                {
                    int idlh = Convert.ToInt32(gvLopHoc.GetRowCellValue(gvLopHoc.FocusedRowHandle, gvLopHoc.Columns[0]).ToString());

                    if (context.sp_XoaLopHoc(idlh) == 1)
                    {
                        MessageBox.Show("Đã xóa Lớp Học", "Xóa lớp học.", MessageBoxButtons.OK, MessageBoxIcon.Information);
                        Load_LopHoc();
                    }
                    else
                        MessageBox.Show("Lỗi rồi nhé!", "Xóa lớp học", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                }
            }
            else
            {
                MessageBox.Show("Vui lòng điền hết thông tin nha bạn.", "Xóa Lớp Học", MessageBoxButtons.OK, MessageBoxIcon.Warning);
            }
        }

        private void bttLHuy_Click(object sender, EventArgs e)
        {
            this.Close();
        }
        private void Load_LopHoc()
        {
            gcLopHoc.DataSource = (context.fn_ListLopHoc()).ToList();    
            gvLopHoc.Columns[0].Visible = false;
            gvLopHoc.Columns[1].Caption = "Mã Lớp Học";
            gvLopHoc.Columns[2].Caption = "Tên Lớp Học";
            gvLopHoc.Columns[3].Caption = "Giáo viên giảng dạy";
            gvLopHoc.Columns[4].Caption = "Khóa học";
            gvLopHoc.Columns[5].Caption = "Levels";
            gvLopHoc.Columns[6].Caption = "Học phí";
            gvLopHoc.Columns[7].Caption = "Số buổi học";
            gvLopHoc.Columns[8].Caption = "Khung giờ học";
            gvLopHoc.Columns[9].Caption = "Thời gian bắt đầu";
            gvLopHoc.Columns[10].Caption = "Thời gian kết thúc";
        }

        private void gvLopHoc_Click(object sender, EventArgs e)
        {
            if (gvLopHoc.RowCount > 0)
            {
                txtMaLop.EditValue = gvLopHoc.GetRowCellValue(gvLopHoc.FocusedRowHandle, gvLopHoc.Columns[1]).ToString();
                txtMaLop.Enabled = false;
                txtTenLop.EditValue = gvLopHoc.GetRowCellValue(gvLopHoc.FocusedRowHandle, gvLopHoc.Columns[2]).ToString();
                cbxGV.Text = gvLopHoc.GetRowCellValue(gvLopHoc.FocusedRowHandle, gvLopHoc.Columns[3]).ToString();
                Load_GiaoVien(cbxGV);
                cbxKhoaHoc.Text = gvLopHoc.GetRowCellValue(gvLopHoc.FocusedRowHandle, gvLopHoc.Columns[4]).ToString();
                cbxKhoaHoc.Enabled = false;
                cbxLevel.Text = gvLopHoc.GetRowCellValue(gvLopHoc.FocusedRowHandle, gvLopHoc.Columns[5]).ToString();
                cbxLevel.Enabled = false;
                dtThoiGianBatDau.Value = DateTime.Parse(gvLopHoc.GetRowCellValue(gvLopHoc.FocusedRowHandle, gvLopHoc.Columns[9]).ToString());
                dtThoiGianKetThuc.Value = DateTime.Parse(gvLopHoc.GetRowCellValue(gvLopHoc.FocusedRowHandle, gvLopHoc.Columns[10]).ToString());
                txtSoBuoiHoc.EditValue = gvLopHoc.GetRowCellValue(gvLopHoc.FocusedRowHandle, gvLopHoc.Columns[7]).ToString();
                txtHocPhi.EditValue = gvLopHoc.GetRowCellValue(gvLopHoc.FocusedRowHandle, gvLopHoc.Columns[6]).ToString();
                txtThoiGianHoc.EditValue = gvLopHoc.GetRowCellValue(gvLopHoc.FocusedRowHandle, gvLopHoc.Columns[8]).ToString();
            }

        }


        private void bttTimKiemNV_Click(object sender, EventArgs e)
        {
            if (rdbttXemToanBoLH.Checked == true)
            {
                Load_LopHoc();
            }
            if (rdXemTheoKhoaLH.Checked == true)
            {
                string tenKhoaHoc = cbxTimKH.Text;
                Load_LopHocTheoKhoaHoc(tenKhoaHoc);
            }
            if (rdbttXemTheoGiaoVienLH.Checked == true)
            {
                int idgv = Convert.ToInt32(cbxTimGV.EditValue);
                Load_LopHocTheoGiaoVien(idgv);
            }
            if (rdbttXemTheoThoiGianLH.Checked == true)
            {
                DateTime date1 = Convert.ToDateTime(dtNgay1.Value);
                DateTime date2 = Convert.ToDateTime(dtNgay2.Value);
                Load_LopHocTheoThoiGian(date1, date2);
            }
        }

        private void btnRefresh_Click(object sender, EventArgs e)
        {
            refresh();
        }
        private void refresh()
        {
            txtMaLop.Text = "";
            txtMaLop.Enabled = true;
            txtHocPhi.Text = "";
            txtSoBuoiHoc.Text = "";
            txtTenLop.Text = "";
            txtThoiGianHoc.Text = "";
            cbxGV.Text = "Giáo viên";
            cbxLevel.Text = "Levels";
            cbxLevel.Enabled = true;
            cbxKhoaHoc.Text = "Khóa học";
            cbxKhoaHoc.Enabled = true;
        }



        private void rdXemTheoKhoaLH_Click(object sender, EventArgs e)
        {
            if (rdXemTheoKhoaLH.Checked == true)
            {
                Load_CbKhoaHoc(cbxTimKH);
            }
        }

        private void rdbttXemTheoGiaoVienLH_Click(object sender, EventArgs e)
        {
            if (rdbttXemTheoGiaoVienLH.Checked == true)
            {
                Load_GiaoVien(cbxTimGV);
            }
        }

       
        private void Load_LopHocTheoKhoaHoc(string tenKhoaHoc)
        {
            gcLopHoc.DataSource = (from lh in context.fn_ListLopHoc()
                                   where lh.Ten_KH.Contains(tenKhoaHoc)
                                   select lh).ToList();
            gvLopHoc.Columns[0].Visible = false;
            gvLopHoc.Columns[1].Caption = "Mã Lớp Học";
            gvLopHoc.Columns[2].Caption = "Tên Lớp Học";
            gvLopHoc.Columns[3].Caption = "Giáo viên giảng dạy";
            gvLopHoc.Columns[4].Caption = "Khóa học";
            gvLopHoc.Columns[5].Caption = "Levels";
            gvLopHoc.Columns[6].Caption = "Học phí";
            gvLopHoc.Columns[7].Caption = "Số buổi học";
            gvLopHoc.Columns[8].Caption = "Khung giờ học";
            gvLopHoc.Columns[9].Caption = "Thời gian bắt đầu";
            gvLopHoc.Columns[10].Caption = "Thời gian kết thúc";
        } 
        private void Load_LopHocTheoGiaoVien(int idgv)
        {
            gcLopHoc.DataSource = context.fn_TimLopTheoGiaoVien(idgv);
            gvLopHoc.Columns[0].Visible = false;
            gvLopHoc.Columns[1].Caption = "Mã Lớp Học";
            gvLopHoc.Columns[2].Caption = "Tên Lớp Học";
            gvLopHoc.Columns[3].Caption = "Giáo viên giảng dạy";
            gvLopHoc.Columns[4].Caption = "Khóa học";
            gvLopHoc.Columns[5].Caption = "Levels";
            gvLopHoc.Columns[6].Caption = "Học phí";
            gvLopHoc.Columns[7].Caption = "Số buổi học";
            gvLopHoc.Columns[8].Caption = "Khung giờ học";
            gvLopHoc.Columns[9].Caption = "Thời gian bắt đầu";
            gvLopHoc.Columns[10].Caption = "Thời gian kết thúc";
        }
        private void Load_LopHocTheoThoiGian(DateTime date1, DateTime date2)
        {
            gcLopHoc.DataSource = (from lh in context.fn_ListLopHoc()
                                   where DbFunctions.TruncateTime(lh.ThoiGianBatDau_LH) >= date1.Date
                                   && DbFunctions.TruncateTime(lh.ThoiGianBatDau_LH) <= date2.Date
                                   select lh).ToList();
            gvLopHoc.Columns[0].Visible = false;
            gvLopHoc.Columns[1].Caption = "Mã Lớp Học";
            gvLopHoc.Columns[2].Caption = "Tên Lớp Học";
            gvLopHoc.Columns[3].Caption = "Giáo viên giảng dạy";
            gvLopHoc.Columns[4].Caption = "Khóa học";
            gvLopHoc.Columns[5].Caption = "Levels";
            gvLopHoc.Columns[6].Caption = "Học phí";
            gvLopHoc.Columns[7].Caption = "Số buổi học";
            gvLopHoc.Columns[8].Caption = "Khung giờ học";
            gvLopHoc.Columns[9].Caption = "Thời gian bắt đầu";
            gvLopHoc.Columns[10].Caption = "Thời gian kết thúc";
        }

    }
}