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
using System.Data.SqlClient;
using System.Data.Entity;
using System.Data.Entity.Core.Objects.DataClasses;

namespace QuanLiTrungTamAnhNgu
{
    public partial class frLevel : DevExpress.XtraEditors.XtraForm
    {
        public frLevel()
        {
            InitializeComponent();
            this.WindowState = FormWindowState.Maximized;

        }
        EnglishCenterEntities context = new EnglishCenterEntities();
        string tenLevel;
        string moTa;
        string maLevel;

        private void bttThemLv_Click(object sender, EventArgs e)
        {
          
            tenLevel = txtTenLevel.Text;
            moTa = txtMoTaLevel.Text;

            if (txtTenLevel.Text != "" && txtMoTaLevel.Text != "")
            {
                DialogResult dialogResult = MessageBox.Show("Bạn có muốn thêm level này chứ!", "Thêm level", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
                if (dialogResult == DialogResult.Yes)
                {
                    if (context.sp_ThemLevel(tenLevel, moTa)==1)
                    {
                        MessageBox.Show("Đã thêm level!");
                        Load_Level();
                        clearinfor();
                    }
                    else
                    {
                        MessageBox.Show("Level đã tồn tại!");
                    }
                }
            }
            else
            {
                MessageBox.Show("Xin nhập thêm thông tin!", "Thêm Level", MessageBoxButtons.OK, MessageBoxIcon.Information);
            }
        }

        private void bttSuaLv_Click(object sender, EventArgs e)
        {
            
            tenLevel = txtTenLevel.Text;
            moTa = txtMoTaLevel.Text;
            int idLevel = int.Parse(gvLevel.GetRowCellValue(gvLevel.FocusedRowHandle, gvLevel.Columns[0]).ToString());

            if (txtTenLevel.Text != "" && txtMoTaLevel.Text != "")
            {
                DialogResult dialogResult = MessageBox.Show("Bạn có muốn sửa thông tin level này chứ!", "Sửa level", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
                if (dialogResult == DialogResult.Yes)
                {
                    if (context.sp_SuaLevel(idLevel,moTa, tenLevel)==1)
                    {
                        MessageBox.Show("Đã Sửa Thông Tin level!");
                        Load_Level();
                    }
                    else
                    {
                        MessageBox.Show("Lỗi");
                    }
                }
            }
            else
            {
                MessageBox.Show("Xin nhập thêm thông tin!", "Sửa Level", MessageBoxButtons.OK, MessageBoxIcon.Information);
            }
        }


        private void gvLevel_Click(object sender, EventArgs e)
        {
            if (gvLevel.RowCount > 0)
            {
               
                txtTenLevel.EditValue = gvLevel.GetRowCellValue(gvLevel.FocusedRowHandle, gvLevel.Columns[2]).ToString();
                txtMoTaLevel.Text = gvLevel.GetRowCellValue(gvLevel.FocusedRowHandle, gvLevel.Columns[3]).ToString();
            }
        }



    private void bttXoaLv_Click(object sender, EventArgs e)
        {
            
            tenLevel = txtTenLevel.Text;
            moTa = txtMoTaLevel.Text;
            int idLevel = int.Parse(gvLevel.GetRowCellValue(gvLevel.FocusedRowHandle, gvLevel.Columns[0]).ToString());

            if (txtTenLevel.Text != "" && txtMoTaLevel.Text != "")
            {
                DialogResult dialogResult = MessageBox.Show("Bạn có muốn xóa thông tin level này chứ!", "Xóa level", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
                if (dialogResult == DialogResult.Yes)
                {

                    if (context.sp_XoaLevel(idLevel)==1)
                    {
                        MessageBox.Show("Đã Xóa level");
                        Load_Level();
                        clearinfor();
                    }
                    else
                        MessageBox.Show(" Lỗi");
                }
            }
            else
            {
                MessageBox.Show("Xin nhập thêm thông tin!", "Xóa level ", MessageBoxButtons.OK, MessageBoxIcon.Information);
            }
        }
        private void Load_Level()
        {
            gcLevel.DataSource = (from level in context.fn_LoadLevel()
                                  select level).ToList();
            gvLevel.Columns[0].Visible = false;
            gvLevel.Columns[1].Visible = false;
            gvLevel.Columns[2].Caption = "Tên Level";
            gvLevel.Columns[3].Caption = "Mô Tả Level";
            gvLevel.Columns[4].Visible = false;
        }

        private void frLevel_Load(object sender, EventArgs e)
        {
            Load_Level();
        }

        private void bttLHuy_Click(object sender, EventArgs e)
        {
            this.Close();

        }

        private void btnRefresh_Click(object sender, EventArgs e)
        {
            
            txtTenLevel.Text = "";
            txtMoTaLevel.Text = "";

        }
        private void clearinfor()
        {
           
            txtTenLevel.Text = "";
            txtMoTaLevel.Text = "";
        }

       
    }
}