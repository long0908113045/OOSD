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
    public partial class frGiaoVien : DevExpress.XtraEditors.XtraForm
    {
        public frGiaoVien()
        {
            InitializeComponent();

        }
        EnglishCenterEntities context = new EnglishCenterEntities();
        private void btnThoat_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void frGiaoVien_Load(object sender, EventArgs e)
        {
            Load_TreeLH();
        }
        private void Load_TreeLH()
        {
            if (context.fn_TimLopTheoGiaoVien(Global.NhanVienID).Count() == 0)
            {
                MessageBox.Show("Giáo Viên Chưa Phụ Trách Lớp Học ");
            }
            else
            {
                //TreeNode root = new TreeNode("Danh Sách Lớp Học");
                //root.Tag = 0;
                foreach (var lophoc in context.fn_TimLopTheoGiaoVien(Global.NhanVienID))
                {
                    TreeNode child = new TreeNode(lophoc.Ten_LH);
                    child.Tag = lophoc.LopHocId;
                    treeViewLH.Nodes.Add(child);
                }
            }
        }

        private void treeViewLH_AfterSelect(object sender, TreeViewEventArgs e)
        {
            Global.LopHocID = Convert.ToInt32(e.Node.Tag);
            gcHocVien.DataSource = context.fn_ListHocVienCuaLopHoc(Global.LopHocID).ToList();
            gvHocVien.Columns[0].Visible = false;
            gvHocVien.Columns[1].Caption = "Họ tên";
            gvHocVien.Columns[2].Caption = "Địa chỉ";
            gvHocVien.Columns[3].Caption = "Email";
            gvHocVien.Columns[4].Caption = "Số điện thoại";
            Load_ThongTinLopHoc();
        }
        private void Load_ThongTinLopHoc()
        {
            var thongtinlophoc = (from lophoc in context.fn_ListLopHoc()
                                  where lophoc.LopHocId == Global.LopHocID
                                  select lophoc).FirstOrDefault();
            txtLevels.Text = thongtinlophoc.Ten_Level;
            txtKhoaHoc.Text = thongtinlophoc.Ten_KH;
            txtKhungGioHoc.Text = thongtinlophoc.KhungGioHoc;
            txtSoBBuoiHoc.Text = thongtinlophoc.SoBuoiHoc.ToString();
            lbSoLuong.Text = (gvHocVien.RowCount).ToString();
            txtLopHoc.Text = thongtinlophoc.Ten_LH;
        }
    }
}