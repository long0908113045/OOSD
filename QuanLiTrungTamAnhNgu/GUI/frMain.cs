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

namespace QuanLiTrungTamAnhNgu
{
    public partial class frMain : DevExpress.XtraBars.Ribbon.RibbonForm
    {
        public frMain()
        {
            InitializeComponent();

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
        private void bttDSHV_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            Form frm = this.CheckFormExist(typeof(frHocVien));
            if (frm != null)
            {

                frm.Activate();
            }
            else
            {

                frHocVien f = new frHocVien();
                f.MdiParent = this;
                f.Show();

            }
        }

     
        private void bttThoat_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            this.Close();
        }

     

        private void btnDangNhap_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            Form frm = this.CheckFormExist(typeof(frListAdmin));
            if (frm != null)
            {

                frm.Activate();
            }
            else
            {

                frListAdmin f = new frListAdmin();
                f.MdiParent = this;
                f.Show();

            }
        }

        private void bttDangKy_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            Form frm = this.CheckFormExist(typeof(frPhieuThu));
            if (frm != null)
            {

                frm.Activate();
            }
            else
            {

                frPhieuThu f = new frPhieuThu();
                f.MdiParent = this;
                f.Show();
            }


        }

        private void bttLopHoc_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {

            Form frm = this.CheckFormExist(typeof(frLopHoc));
            if (frm != null)
            {

                frm.Activate();
            }
            else
            {

                frLopHoc f = new frLopHoc();
                f.MdiParent = this;
                f.Show();
                
            }

        }

        private void bttDSNV_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {

            Form frm = this.CheckFormExist(typeof(frNhanVien));
            if (frm != null)
            {

                frm.Activate();
            }
            else
            {

                frNhanVien f = new frNhanVien();
                f.MdiParent = this;
                f.Show();

            }
        }

        private void bttKhoaHoc_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            Form frm = this.CheckFormExist(typeof(frKhoaHoc));
            if (frm != null)
            {

                frm.Activate();
            }
            else
            {

                frKhoaHoc f = new frKhoaHoc();
                f.MdiParent = this;
                f.Show();

            }
        }

        private void bttLevels_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            Form frm = this.CheckFormExist(typeof(frLevel));
            if (frm != null)
            {

                frm.Activate();
            }
            else
            {

                frLevel f = new frLevel();
                f.MdiParent = this;
                f.Show();

            }
        }

        private void btnListLH_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {

            Form frm = this.CheckFormExist(typeof(frListLopHoc));
            if (frm != null)
            {

                frm.Activate();
            }
            else
            {

                frListLopHoc f = new frListLopHoc();
                f.MdiParent = this;
                f.Show();

            }
        }

        private void frMain_Load(object sender, EventArgs e)
        {

        }

        private void barButtonItem7_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
        }
    }
}