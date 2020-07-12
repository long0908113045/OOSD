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
    public partial class frKhoaHoc : DevExpress.XtraEditors.XtraForm
    {
        public frKhoaHoc()
        {
            InitializeComponent();
        }
        EnglishCenterEntities context = new EnglishCenterEntities();
        string ten_KH;
        string mota;
        string ma_KH;
        private void bttThemKH_Click(object sender, EventArgs e)
        {
            if (txtTenKhoaHoc.Text != "" && txtMota.Text != "" && txtMaKH.Text != "")
            {
                DialogResult dialogResult = MessageBox.Show("Bạn có muốn thêm khóa học này chứ!", "Thêm Khóa Học", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
                if (dialogResult == DialogResult.Yes)
                {
                    ma_KH = txtMaKH.Text;
                    ten_KH = txtTenKhoaHoc.Text;
                    mota = txtMota.Text;
                    if (context.sp_ThemKhoaHoc(ma_KH, ten_KH, mota) == 1)
                    {
                        MessageBox.Show("Đã thêm khóa học", "Thêm khóa học.", MessageBoxButtons.OK, MessageBoxIcon.Information);
                        Load_KH();
                        refresh();
                    }
                    else
                        MessageBox.Show("Khóa học đã tồn tại rồi!", "Thêm khóa học", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                }
            }
            else
            {
                MessageBox.Show("Xin nhập thêm thông tin!", "Thêm Khóa Học ", MessageBoxButtons.OK, MessageBoxIcon.Information);
            }
        }

        private void bttSuaKH_Click(object sender, EventArgs e)
        {
            if (txtMota.Text != "" && txtTenKhoaHoc.Text != "" && txtMaKH.Text != "")
            {
                DialogResult dialogResult = MessageBox.Show("Bạn có muốn sửa thông tin khóa học này chứ!", "Sửa Khóa Học", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
                if (dialogResult == DialogResult.Yes)
                {
                    int idkh = Convert.ToInt32(gvKhoaHoc.GetRowCellValue(gvKhoaHoc.FocusedRowHandle, gvKhoaHoc.Columns[0]).ToString());
                    ma_KH = txtMaKH.Text;
                    ten_KH = txtTenKhoaHoc.Text;
                    mota = txtMota.Text;
                    if (context.sp_SuaKhoaHoc(idkh, ma_KH, ten_KH, mota) == 1)
                    {
                        MessageBox.Show("Đã Sửa khóa học", "Sửa khóa học", MessageBoxButtons.OK, MessageBoxIcon.Information);
                        Load_KH();
                        refresh();
                    }
                    else
                        MessageBox.Show(" Lỗi", "Sửa khóa học.", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                }
            }
            else
            {
                MessageBox.Show("Xin nhập thêm thông tin!", "Sửa Khóa Học ", MessageBoxButtons.OK, MessageBoxIcon.Warning);
            }
        }

        private void bttXoaKH_Click(object sender, EventArgs e)
        {
            if (txtTenKhoaHoc.Text != "" && txtMota.Text != "" && txtMaKH.Text != "")
            {
                DialogResult dialogResult = MessageBox.Show("Bạn có muốn xóa thông tin khóa học này chứ!", "Xóa Khóa Học", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
                if (dialogResult == DialogResult.Yes)
                {
                    int idkh = Convert.ToInt32(gvKhoaHoc.GetRowCellValue(gvKhoaHoc.FocusedRowHandle, gvKhoaHoc.Columns[0]).ToString());


                    if (context.sp_XoaKhoaHoc(idkh) == 1)
                    {
                        MessageBox.Show("Đã Xóa Khóa Học", "Xóa khóa học.", MessageBoxButtons.OK, MessageBoxIcon.Information);
                        Load_KH();
                        refresh();
                    }
                    else
                        MessageBox.Show(" Lỗi", "Xóa khóa học", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                }
            }
            else
            {
                MessageBox.Show("Xin nhập thêm thông tin!", "Xóa Khóa Học ", MessageBoxButtons.OK, MessageBoxIcon.Warning);
            }
        }

        private void bttLHuy_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void gvKhoaHoc_Click(object sender, EventArgs e)
        {
            if (gvKhoaHoc.RowCount > 0)
            {
                txtMaKH.EditValue = gvKhoaHoc.GetRowCellValue(gvKhoaHoc.FocusedRowHandle, gvKhoaHoc.Columns[1]).ToString();
                txtMaKH.Enabled = false;
                txtTenKhoaHoc.EditValue = gvKhoaHoc.GetRowCellValue(gvKhoaHoc.FocusedRowHandle, gvKhoaHoc.Columns[2]).ToString();
                txtMota.Text = gvKhoaHoc.GetRowCellValue(gvKhoaHoc.FocusedRowHandle, gvKhoaHoc.Columns[3]).ToString();
            }
        }
        private void Load_KH()
        {

            gcKhoaHoc.DataSource = context.fn_ListKhoaHoc();
            gvKhoaHoc.Columns[0].Visible = false;
            gvKhoaHoc.Columns[1].Caption = "Mã Khóa Học";
            gvKhoaHoc.Columns[2].Caption = "Tên Khoa Học ";
            gvKhoaHoc.Columns[3].Caption = "Mô Tả Khóa Học";
            gvKhoaHoc.Columns[4].Visible = false;
        }

        private void frKhoaHoc_Load(object sender, EventArgs e)
        {
            Load_KH();
            this.WindowState = FormWindowState.Maximized;

        }

        private void btnRefresh_Click(object sender, EventArgs e)
        {
            refresh();
        }
        private void refresh()
        {
            txtMaKH.Text = "";
            txtMaKH.Enabled = true;
            txtTenKhoaHoc.Text = "";
            txtMota.Text = "";
        }
    }
}