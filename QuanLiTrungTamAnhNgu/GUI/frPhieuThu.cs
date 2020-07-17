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
using QuanLiTrungTamAnhNgu.StatePattern;
using QuanLiTrungTamAnhNgu.SingletonPattern;
using QuanLiTrungTamAnhNgu.StrategyPattern;

namespace QuanLiTrungTamAnhNgu
{
    public partial class frPhieuThu : DevExpress.XtraEditors.XtraForm
    {
        public frPhieuThu()
        {
            InitializeComponent();
            this.WindowState = FormWindowState.Maximized;

        }
        EnglishCenterEntities context = new EnglishCenterEntities();
        ControllerLopHoc lopHoc = new ControllerLopHoc();
        int idpttt;
        int idhv;
        int idnv;
        int idlh;
        decimal sotien;
        DateTime ngaythanhtoan;
        private void frPhieuThu_Load(object sender, EventArgs e)
        {
            Load_TreeLH();
            Load_HocVien();
        }
        private void Load_TreeLH()
        {
            TreeNode root = new TreeNode("Danh Sách Khóa Học");
            root.Tag = 0;
            foreach (var khoahoc in context.fn_ListKhoaHoc())
            {
                TreeNode child = new TreeNode(khoahoc.Ten_KH);
                child.Tag = khoahoc.KhoaHocId;
                root.Nodes.Add(child);
                var listLopHoc = context.fn_ListLopHocTheoKhoaHoc(Convert.ToInt32(child.Tag)).ToList();
                foreach (var lh in listLopHoc)
                {
                    TreeNode child1 = new TreeNode(lh.Ten_LH);
                    child1.Tag = lh.LopHocId;
                    child.Nodes.Add(child1);
                }
            }
            treeViewListLH.Nodes.Add(root);
            treeViewListLH.ExpandAll();
        }

        private void Load_ThongTinLopHoc()
        {
            var thongtinlophoc = (from lophoc in context.fn_ListLopHoc()
                                  where lophoc.LopHocId == Global.LopHocID
                                  select lophoc).FirstOrDefault();
            string soluongdangky = (gvPhieuThu.RowCount).ToString();
            lbSoLuong.Text = soluongdangky + "/" + thongtinlophoc.SoLuongHocVien.ToString();
        }


        private void treeViewListLH_AfterSelect(object sender, TreeViewEventArgs e)
        {
            Global.LopHocID = Convert.ToInt32(e.Node.Tag);
            txtLopHoc.Text = e.Node.Text;
            Load_PhieuThu();
            //state Pattern
            LopHocContext lhcontext = new LopHocContext(Global.LopHocID);
            Load_ThongTinLopHoc();
            if (lhcontext.Request())
            {
                bttDangKy.Enabled = true;
            }
            else
            {
                bttDangKy.Enabled = false;
            }
        }
        private void Load_HocVien()
        {
            gcHocVien.DataSource = context.fn_ListHocVien().ToList();
            gvHocVien.Columns[0].Visible = false;
            gvHocVien.Columns[1].Visible = false;
            gvHocVien.Columns[2].Caption = "Họ tên";
            gvHocVien.Columns[3].Caption = "Địa chỉ";
            gvHocVien.Columns[4].Caption = "Email";
            gvHocVien.Columns[5].Caption = "Số điện thoại";
            gvHocVien.Columns[6].Visible = false;
        }

        private void btnThanhToan_Click(object sender, EventArgs e)
        {
            ngaythanhtoan = dateTimePicker1.Value;
            idhv = Global.HocVienID;
            idlh = Global.LopHocID;
            idnv = Global.NhanVienID;
            int idpt = Global.PhieuThuID;
            sotien = Convert.ToDecimal(lbSoTien.Text);
            

            if (txtHocVien.Text == " " ||
              txtLopHoc.Text == ""
               &&(rdTienMat.Checked == false && rdThe.Checked == false))
            {
                MessageBox.Show("Bạn chưa điền đủ thông tin!", "Thanh Toán", MessageBoxButtons.OK, MessageBoxIcon.Warning);
            }
            else
            {
                ThanhToanList PhuongThuc = new ThanhToanList();
                if (rdThe.Checked == true)
                {
                    idpttt = 2;
                    //strategyPattern
                    PhuongThuc.setPhuongThucStrategy(new ThanhToanThe());
                    sotien = PhuongThuc.ThanhToan(sotien);
                }
                if (rdTienMat.Checked == true)
                {
                    idpttt = 1;
                    PhuongThuc.setPhuongThucStrategy(new ThanhToanTienMat());
                    sotien = PhuongThuc.ThanhToan(sotien);                   
                }
                
                DialogResult dialogResult = MessageBox.Show("Bạn muốn thanh toán ?", "Thanh Toán.", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
                if (dialogResult == DialogResult.Yes)
                {
                    //build Pattern
                    BuilderPhieuThu.PhieuThu phieu = new BuilderPhieuThu.PhieuThuBuilder().HocVienId(idhv)
                                                                                            .LopHocId(idlh)
                                                                                            .NhanVienId(idnv)
                                                                                            .NgayThanhToan(ngaythanhtoan.Date)
                                                                                            .PhuongThucThanhToanId(idpttt)
                                                                                            .SoTien(sotien)
                                                                                            .build();
                    if (phieu.ThuTien())
                    {
                        MessageBox.Show("Bạn đã thanh toán  thành công!", "Thanh Toán.", MessageBoxButtons.OK, MessageBoxIcon.Information);
                        Load_PhieuThu();
                    }
                    else
                    {
                        MessageBox.Show("Lỗi ");
                    }
                }
            }
        }

        private void bttDangKy_Click(object sender, EventArgs e)
        {
            idhv = Global.HocVienID;
            idlh = Global.LopHocID;
            idnv = Global.NhanVienID;
            //state Pattern
            LopHocContext lhcontext = new LopHocContext(idlh);
            if (lhcontext.Request())
            {
                if (txtHocVien.Text == " " || txtLopHoc.Text == "")
                {
                    MessageBox.Show("Bạn chưa điền đủ thông tin!", "Thêm  học viên vào lớp học.", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                }
                else
                {

                    DialogResult dialogResult = MessageBox.Show("Bạn muốn thêm học viên này vào lớp không ?", "Thêm học viên.", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
                    if (dialogResult == DialogResult.Yes)
                    {
                        BuilderPhieuThu.PhieuThu phieu = new BuilderPhieuThu.PhieuThuBuilder().HocVienId(idhv).LopHocId(idlh).NhanVienId(idnv).build();
                        if (phieu.DangKyLopHoc())
                        {
                            MessageBox.Show("Bạn đã thêm học viên thành công!", "Thêm học viên.", MessageBoxButtons.OK, MessageBoxIcon.Information);
                            Load_HocVien();
                            Load_PhieuThu();
                            Load_ThongTinLopHoc();
                        }
                        else
                        {
                            MessageBox.Show("Học Viên Đã Tồn Tại!");
                        }
                    }


                }
            }
            else
            {
                MessageBox.Show("Lớp Học Đã Đầy");
            }
        }

        private void gcHocVien_Click(object sender, EventArgs e)
        {
            Global.HocVienID = Convert.ToInt32(gvHocVien.GetRowCellValue(gvHocVien.FocusedRowHandle, gvHocVien.Columns[0])?.ToString());
            txtHocVien.Text = Convert.ToString(gvHocVien.GetRowCellValue(gvHocVien.FocusedRowHandle, gvHocVien.Columns[2])?.ToString());
        }


        private void Load_PhieuThu()
        {
            gcPhieuThu.DataSource = context.fn_ListPhieuThu(Global.LopHocID).ToList();
            gvPhieuThu.Columns[0].Visible = false;
            gvPhieuThu.Columns[1].Visible = false;
            gvPhieuThu.Columns[2].Caption = "Họ tên học viên";
            gvPhieuThu.Columns[3].Caption = "Họ tên nhân viên";
            gvPhieuThu.Columns[4].Caption = "Số Tiền";
            gvPhieuThu.Columns[5].Caption = "Phương thức thanh toán";
            gvPhieuThu.Columns[6].Caption = "Ngày thanh toán";
            gvPhieuThu.Columns[7].Visible = false;

        }

        private void gcPhieuThu_Click(object sender, EventArgs e)
        {
            Global.PhieuThuID = Convert.ToInt32(gvPhieuThu.GetRowCellValue(gvPhieuThu.FocusedRowHandle, gvPhieuThu.Columns[0])?.ToString());
            txtHocVien.Text = Convert.ToString(gvPhieuThu.GetRowCellValue(gvPhieuThu.FocusedRowHandle, gvPhieuThu.Columns[2])?.ToString()) ?? "";
            Global.HocVienID = Convert.ToInt32(gvPhieuThu.GetRowCellValue(gvPhieuThu.FocusedRowHandle, gvPhieuThu.Columns[7])?.ToString());
            Global.PhuongThucThanhToanID = Convert.ToInt32(gvPhieuThu.GetRowCellValue(gvPhieuThu.FocusedRowHandle, gvPhieuThu.Columns[5])?.ToString());
            int? hocphi = lopHoc.getHocPhi(Global.LopHocID);
            lbSoTien.Text = Convert.ToString(hocphi);
            
            ngaythanhtoan = Convert.ToDateTime(gvPhieuThu.GetRowCellValue(gvPhieuThu.FocusedRowHandle, gvPhieuThu.Columns[6])?.ToString());
        }

        private void btnTimKiemHocVIen_Click(object sender, EventArgs e)
        {

            gcHocVien.DataSource = context.sp_TimHocVienTheoTen(txtTimTen.Text).ToList();
            gvHocVien.Columns[0].Visible = false;
            gvHocVien.Columns[1].Visible = false;
            gvHocVien.Columns[2].Caption = "Họ tên";
            gvHocVien.Columns[3].Caption = "Địa chỉ";
            gvHocVien.Columns[4].Caption = "Email";
            gvHocVien.Columns[5].Caption = "Số điện thoại";
            gvHocVien.Columns[6].Visible = false;
            if (gvHocVien.RowCount == 0)
                MessageBox.Show("Không tìm thấy học viên");
        }

        private void btnTimKiemPhieuThu_Click(object sender, EventArgs e)
        {
            gcPhieuThu.DataSource = context.fn_TimTenTrenPhieuThu(Global.LopHocID, txtTimTen.Text.Trim()).ToList();
            gvPhieuThu.Columns[0].Visible = false;
            gvPhieuThu.Columns[1].Visible = false;
            gvPhieuThu.Columns[2].Caption = "Họ tên học viên";
            gvPhieuThu.Columns[3].Caption = "Họ tên nhân viên";
            gvPhieuThu.Columns[4].Caption = "Số Tiền";
            gvPhieuThu.Columns[5].Caption = "Phương thức thanh toán";
            gvPhieuThu.Columns[6].Caption = "Ngày thanh toán";
            gvPhieuThu.Columns[7].Visible = false;
        }

        private void btnRefreshv_Click(object sender, EventArgs e)
        {
            txtLopHoc.Text = "";
            txtHocVien.Text = "";
            Load_HocVien();
        }

        private void btnRefreshnv_Click(object sender, EventArgs e)
        {
            lbSoTien.Text = "0000";
            rdTienMat.Checked = false;
            rdThe.Checked = false;
            dateTimePicker1.Value = DateTime.Now;
            Load_PhieuThu();
        }

        private void rdTienMat_CheckedChanged(object sender, EventArgs e)
        {
            sotien = Convert.ToDecimal(lbSoTien.Text);
            ThanhToanList PhuongThuc = new ThanhToanList();
            if (rdTienMat.Checked == true)
            {
                idpttt = 1;
                PhuongThuc.setPhuongThucStrategy(new ThanhToanTienMat());
                sotien = PhuongThuc.ThanhToan(sotien);
                lbTraTien.Text = Convert.ToString(sotien);
            }
        }

        private void rdThe_CheckedChanged(object sender, EventArgs e)
        {
            sotien = Convert.ToDecimal(lbSoTien.Text);
            ThanhToanList PhuongThuc = new ThanhToanList();
            if (rdThe.Checked == true)
            {
                idpttt = 2;
                //strategyPattern
                PhuongThuc.setPhuongThucStrategy(new ThanhToanThe());
                sotien = PhuongThuc.ThanhToan(sotien);
                lbTraTien.Text = Convert.ToString(sotien);
            }
        }
    }
}

 