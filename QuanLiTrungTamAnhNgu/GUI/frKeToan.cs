using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Linq;
using System.Threading.Tasks;
using System.Windows.Forms;
using DevExpress.XtraBars;
using DevExpress.XtraSplashScreen;

namespace QuanLiTrungTamAnhNgu
{
    public partial class frKeToan : DevExpress.XtraBars.Ribbon.RibbonForm
    {
        public frKeToan()
        {
            InitializeComponent();
            this.WindowState = FormWindowState.Maximized;
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
        private void btnPhieuThu_ItemClick(object sender, ItemClickEventArgs e)
        {
            SplashScreenManager.ShowForm(typeof(frWait));
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
            SplashScreenManager.CloseForm();


        }

        private void btnHocVien_ItemClick(object sender, ItemClickEventArgs e)
        {

            SplashScreenManager.ShowForm(typeof(frWait));
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
            SplashScreenManager.CloseForm();
        }

        private void btnLopHoc_ItemClick(object sender, ItemClickEventArgs e)
        {

            SplashScreenManager.ShowForm(typeof(frWait));
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
            SplashScreenManager.CloseForm();
        }

        private void btnThoat_ItemClick(object sender, ItemClickEventArgs e)
        {
            this.Close();

        }
    }
}