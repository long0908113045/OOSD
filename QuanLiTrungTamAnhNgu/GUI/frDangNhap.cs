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
using DevExpress.XtraSplashScreen;
using System.Data.Entity.Core.Objects;
using QuanLiTrungTamAnhNgu.BuilderPattern;

namespace QuanLiTrungTamAnhNgu
{
    public partial class frDangNhap : DevExpress.XtraEditors.XtraForm
    {
        public frDangNhap()
        {
            InitializeComponent();
            StartPosition = FormStartPosition.CenterScreen;

        }
        EnglishCenterEntities context = new EnglishCenterEntities();

        private void bttDangNhap_Click(object sender, EventArgs e)
        {
            
            string username;
            string pass;
            string chucvu;

            if (txtTaiKhoan.Text.Replace(" ", "") != "" && txtMatKhau.Text.Replace(" ", "") != "")
            {
                username = txtTaiKhoan.Text.Trim();
                pass = txtMatKhau.Text;
                chucvu = cbxChucVu.Text;
                if (chucvu == "Học Viên")
                {
                    ObjectParameter idpq = new ObjectParameter("idpq", typeof(int));
                    ObjectParameter idhv = new ObjectParameter("idhv", typeof(int));
                    var result = context.sp_KiemTraTaiKhoanHV(idpq, idhv, username, pass);
                    if (idpq.Value == DBNull.Value)
                    {
                        MessageBox.Show("Tài Khoản Không Tồn Tại");
                    }
                    else
                    {
                        Global.HocVienID = Convert.ToInt32(idhv.Value);
                        if (Convert.ToInt32(idpq.Value) == 4)
                        {
                            Form frm = this.CheckFormExist(typeof(frListAdmin));
                            if (frm != null)
                            {
                                frm.Activate();
                            }
                            else
                            {

                                frListAdmin f = new frListAdmin();
                                this.Hide();
                                f.ShowDialog();
                                this.Show();

                            }
                        }
                    }
                }
                else
                {
                    ObjectParameter idpq = new ObjectParameter("idpq", typeof(int));
                    ObjectParameter idnv = new ObjectParameter("idnv", typeof(int));
                    var result = context.sp_KiemTraTaiKhoanNV(idpq, idnv, username, pass, chucvu);
                    if (idpq.Value == DBNull.Value)
                    {
                        MessageBox.Show("Tài Khoản Không Tồn Tại");
                    }
                    else
                    {
                        Global.NhanVienID = Convert.ToInt32(idnv.Value);
                        if (Convert.ToInt32(idpq.Value) == 1)
                        {
                            Form frm = this.CheckFormExist(typeof(frMain));
                            if (frm != null)
                            {
                                frm.Activate();
                            }
                            else
                            {

                                frMain f = new frMain();
                                this.Hide();
                                f.ShowDialog();
                                this.Show();

                            }
                        }
                        else if (Convert.ToInt32(idpq.Value) == 3)
                        {

                            Form frm = this.CheckFormExist(typeof(frKeToan));
                            if (frm != null)
                            {

                                frm.Activate();
                            }
                            else
                            {

                                frKeToan f = new frKeToan();
                                this.Hide();
                                f.ShowDialog();
                                this.Show();

                            }
                        }
                        else if (Convert.ToInt32(idpq.Value) == 2)
                        {

                            Form frm = this.CheckFormExist(typeof(frGiaoVien));
                            if (frm != null)
                            {

                                frm.Activate();
                            }
                            else
                            {

                                frGiaoVien f = new frGiaoVien();
                                this.Hide();
                                f.ShowDialog();
                                this.Show();
                            }
                        }
                    }
                }

            }

        }

        private void btnThoat_Click(object sender, EventArgs e)
        {
            this.Close();
        }
        private void Load_CbTimChucVu()
        {
            cbxChucVu.Items.Add("Kế Toán");
            cbxChucVu.Items.Add("Giáo Viên");
            cbxChucVu.Items.Add("Admin");
            cbxChucVu.Items.Add("Học Viên");
        }

        private void frDangNhap_Load(object sender, EventArgs e)
        {
            Load_CbTimChucVu();
        }
        private Form CheckFormExist(Type fType)
        {
            foreach (Form f in MdiChildren)
            {
                if (f.GetType() == fType)
                    return f;
            }
            return null;
        }

        private void txtTaiKhoan_EditValueChanged(object sender, EventArgs e)
        {

        }
    }
}