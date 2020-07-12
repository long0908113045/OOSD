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
    public partial class frListLopHoc : DevExpress.XtraEditors.XtraForm
    {
        public frListLopHoc()
        {
            InitializeComponent();
            this.WindowState = FormWindowState.Maximized;

        }
        EnglishCenterEntities context = new EnglishCenterEntities();
        private void frListLopHoc_Load(object sender, EventArgs e)
        {
            Load_TreeLH();
        }
        private void Load_TreeLH()
        {
            TreeNode root = new TreeNode("Danh Sách Khóa Học");
            root.Tag = 0;
            foreach(var khoahoc in context.fn_ListKhoaHoc())
            {
                TreeNode child = new TreeNode(khoahoc.Ten_KH);
                child.Tag = khoahoc.KhoaHocId;
                root.Nodes.Add(child);
                var listLopHoc = context.fn_ListLopHocTheoKhoaHoc(Convert.ToInt32(child.Tag)).ToList();
                foreach (var lh in listLopHoc)
                {
                    TreeNode child1 = new TreeNode(lh.Ten_LH);
                    child1.Tag =lh.LopHocId;
                    child.Nodes.Add(child1);
                }
            }
            treeViewListLH.Nodes.Add(root);
            treeViewListLH.ExpandAll();
        }

       
        private void treeViewListLH_AfterSelect(object sender, TreeViewEventArgs e)
        {
            
            Global.LopHocID= Convert.ToInt32(e.Node.Tag);
            gcsListHV.DataSource = context.fn_ListHocVienCuaLopHoc(Global.LopHocID).ToList();
            gvListHocVien.Columns[0].Caption = "Mã học viên";
            gvListHocVien.Columns[1].Caption = "Họ tên";
            gvListHocVien.Columns[2].Caption =  "Địa chỉ";
            gvListHocVien.Columns[3].Caption = "Email";
            gvListHocVien.Columns[4].Caption = "Số điện thoại";
            Load_ThongTinLopHoc();
        }

        private void gcsListHV_Click(object sender, EventArgs e)
        {

        }
        private void Load_ThongTinLopHoc()
        {
            var thongtinlophoc = (from lophoc in context.fn_ListLopHoc()
                                  where lophoc.LopHocId == Global.LopHocID
                                  select lophoc).FirstOrDefault();
            txtGV.Text = thongtinlophoc.HoTen_NV;
            txtKH.Text = thongtinlophoc.Ten_KH;
            txtKhungGioHoc.Text = thongtinlophoc.KhungGioHoc;
            txtSoBuoiHoc.Text = thongtinlophoc.SoBuoiHoc.ToString();
            lbSoLuong.Text = (gvListHocVien.RowCount).ToString();
        }

        private void btnTimKiem_Click(object sender, EventArgs e)
        {
            gcsListHV.DataSource = context.sp_TimHocVienTheoTen(txtHocVien.Text).ToList();
            gvListHocVien.Columns[0].Visible = false;
            gvListHocVien.Columns[1].Caption = "Mã học viên";
            gvListHocVien.Columns[2].Caption = "Họ tên";
            gvListHocVien.Columns[3].Caption = "Địa chỉ";
            gvListHocVien.Columns[4].Caption = "Email";
            gvListHocVien.Columns[5].Caption = "Số điện thoại";
            gvListHocVien.Columns[6].Visible = false;
            if (gvListHocVien.RowCount == 0)
                MessageBox.Show("Không tìm thấy học viên");
        }
    }
}