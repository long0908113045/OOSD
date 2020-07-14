namespace QuanLiTrungTamAnhNgu
{
    partial class frListAdmin
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(frListAdmin));
            this.panelControl1 = new DevExpress.XtraEditors.PanelControl();
            this.rdNgay = new System.Windows.Forms.RadioButton();
            this.btSapXep = new DevExpress.XtraEditors.SimpleButton();
            this.rdTheoTen = new System.Windows.Forms.RadioButton();
            this.label3 = new System.Windows.Forms.Label();
            this.btnTimKiem = new DevExpress.XtraEditors.SimpleButton();
            this.lbSoLuong = new System.Windows.Forms.Label();
            this.txtGV = new DevExpress.XtraEditors.TextEdit();
            this.label2 = new System.Windows.Forms.Label();
            this.label1 = new System.Windows.Forms.Label();
            this.backgroundWorker1 = new System.ComponentModel.BackgroundWorker();
            this.backgroundWorker2 = new System.ComponentModel.BackgroundWorker();
            this.gcAdmin = new DevExpress.XtraGrid.GridControl();
            this.gvAdmin = new DevExpress.XtraGrid.Views.Grid.GridView();
            ((System.ComponentModel.ISupportInitialize)(this.panelControl1)).BeginInit();
            this.panelControl1.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.txtGV.Properties)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.gcAdmin)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.gvAdmin)).BeginInit();
            this.SuspendLayout();
            // 
            // panelControl1
            // 
            this.panelControl1.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.panelControl1.AutoSizeMode = System.Windows.Forms.AutoSizeMode.GrowAndShrink;
            this.panelControl1.Controls.Add(this.rdNgay);
            this.panelControl1.Controls.Add(this.btSapXep);
            this.panelControl1.Controls.Add(this.rdTheoTen);
            this.panelControl1.Controls.Add(this.label3);
            this.panelControl1.Controls.Add(this.btnTimKiem);
            this.panelControl1.Controls.Add(this.lbSoLuong);
            this.panelControl1.Controls.Add(this.txtGV);
            this.panelControl1.Controls.Add(this.label2);
            this.panelControl1.Controls.Add(this.label1);
            this.panelControl1.Location = new System.Drawing.Point(0, 0);
            this.panelControl1.Name = "panelControl1";
            this.panelControl1.Size = new System.Drawing.Size(1161, 174);
            this.panelControl1.TabIndex = 3;
            // 
            // rdNgay
            // 
            this.rdNgay.AutoSize = true;
            this.rdNgay.Font = new System.Drawing.Font("Times New Roman", 15F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.rdNgay.Location = new System.Drawing.Point(669, 88);
            this.rdNgay.Name = "rdNgay";
            this.rdNgay.Size = new System.Drawing.Size(321, 33);
            this.rdNgay.TabIndex = 18;
            this.rdNgay.TabStop = true;
            this.rdNgay.Text = "Theo Ngày Tháng Năm Sinh";
            this.rdNgay.UseVisualStyleBackColor = true;
            // 
            // btSapXep
            // 
            this.btSapXep.Appearance.Font = new System.Drawing.Font("Times New Roman", 15F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btSapXep.Appearance.ForeColor = System.Drawing.SystemColors.Highlight;
            this.btSapXep.Appearance.Options.UseFont = true;
            this.btSapXep.Appearance.Options.UseForeColor = true;
            this.btSapXep.AutoSize = true;
            this.btSapXep.ImageOptions.Image = ((System.Drawing.Image)(resources.GetObject("btSapXep.ImageOptions.Image")));
            this.btSapXep.Location = new System.Drawing.Point(996, 87);
            this.btSapXep.Name = "btSapXep";
            this.btSapXep.Size = new System.Drawing.Size(140, 38);
            this.btSapXep.TabIndex = 17;
            this.btSapXep.Text = "Sắp Xếp";
            this.btSapXep.Click += new System.EventHandler(this.btSapXep_Click);
            // 
            // rdTheoTen
            // 
            this.rdTheoTen.AutoSize = true;
            this.rdTheoTen.Font = new System.Drawing.Font("Times New Roman", 15F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.rdTheoTen.Location = new System.Drawing.Point(669, 127);
            this.rdTheoTen.Name = "rdTheoTen";
            this.rdTheoTen.Size = new System.Drawing.Size(135, 33);
            this.rdTheoTen.TabIndex = 16;
            this.rdTheoTen.TabStop = true;
            this.rdTheoTen.Text = "Theo Tên ";
            this.rdTheoTen.UseVisualStyleBackColor = true;
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Font = new System.Drawing.Font("Times New Roman", 13.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label3.Location = new System.Drawing.Point(569, 92);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(99, 27);
            this.label3.TabIndex = 15;
            this.label3.Text = "Sắp Xếp:";
            // 
            // btnTimKiem
            // 
            this.btnTimKiem.Appearance.Font = new System.Drawing.Font("Times New Roman", 15F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnTimKiem.Appearance.ForeColor = System.Drawing.SystemColors.Highlight;
            this.btnTimKiem.Appearance.Options.UseFont = true;
            this.btnTimKiem.Appearance.Options.UseForeColor = true;
            this.btnTimKiem.AutoSize = true;
            this.btnTimKiem.ImageOptions.Image = ((System.Drawing.Image)(resources.GetObject("btnTimKiem.ImageOptions.Image")));
            this.btnTimKiem.Location = new System.Drawing.Point(423, 87);
            this.btnTimKiem.Name = "btnTimKiem";
            this.btnTimKiem.Size = new System.Drawing.Size(140, 38);
            this.btnTimKiem.TabIndex = 14;
            this.btnTimKiem.Text = "Tìm kiếm";
            this.btnTimKiem.Click += new System.EventHandler(this.btnTimKiem_Click);
            // 
            // lbSoLuong
            // 
            this.lbSoLuong.AutoSize = true;
            this.lbSoLuong.Font = new System.Drawing.Font("Times New Roman", 13.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lbSoLuong.Location = new System.Drawing.Point(239, 362);
            this.lbSoLuong.Name = "lbSoLuong";
            this.lbSoLuong.Size = new System.Drawing.Size(0, 27);
            this.lbSoLuong.TabIndex = 13;
            // 
            // txtGV
            // 
            this.txtGV.Location = new System.Drawing.Point(158, 90);
            this.txtGV.Name = "txtGV";
            this.txtGV.Properties.Appearance.Font = new System.Drawing.Font("Times New Roman", 13.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtGV.Properties.Appearance.Options.UseFont = true;
            this.txtGV.Size = new System.Drawing.Size(259, 32);
            this.txtGV.TabIndex = 5;
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Font = new System.Drawing.Font("Times New Roman", 13.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label2.Location = new System.Drawing.Point(12, 94);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(140, 27);
            this.label2.TabIndex = 1;
            this.label2.Text = "Tìm theo tên:";
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Times New Roman", 19.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.Location = new System.Drawing.Point(357, 20);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(254, 37);
            this.label1.TabIndex = 0;
            this.label1.Text = "Danh Sách Admin";
            // 
            // gcAdmin
            // 
            this.gcAdmin.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.gcAdmin.Location = new System.Drawing.Point(0, 180);
            this.gcAdmin.MainView = this.gvAdmin;
            this.gcAdmin.Name = "gcAdmin";
            this.gcAdmin.Size = new System.Drawing.Size(1161, 449);
            this.gcAdmin.TabIndex = 4;
            this.gcAdmin.ViewCollection.AddRange(new DevExpress.XtraGrid.Views.Base.BaseView[] {
            this.gvAdmin});
            // 
            // gvAdmin
            // 
            this.gvAdmin.GridControl = this.gcAdmin;
            this.gvAdmin.Name = "gvAdmin";
            this.gvAdmin.OptionsBehavior.Editable = false;
            // 
            // frListAdmin
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(7F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1161, 629);
            this.Controls.Add(this.gcAdmin);
            this.Controls.Add(this.panelControl1);
            this.Name = "frListAdmin";
            this.Text = "Danh Sách Admin";
            this.Load += new System.EventHandler(this.frHocVien_DangNhap_Load);
            ((System.ComponentModel.ISupportInitialize)(this.panelControl1)).EndInit();
            this.panelControl1.ResumeLayout(false);
            this.panelControl1.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.txtGV.Properties)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.gcAdmin)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.gvAdmin)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private DevExpress.XtraEditors.PanelControl panelControl1;
        private System.Windows.Forms.Label lbSoLuong;
        private DevExpress.XtraEditors.TextEdit txtGV;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label label1;
        private System.ComponentModel.BackgroundWorker backgroundWorker1;
        private System.ComponentModel.BackgroundWorker backgroundWorker2;
        private DevExpress.XtraGrid.GridControl gcAdmin;
        private DevExpress.XtraGrid.Views.Grid.GridView gvAdmin;
        private System.Windows.Forms.Label label3;
        private DevExpress.XtraEditors.SimpleButton btnTimKiem;
        private System.Windows.Forms.RadioButton rdTheoTen;
        private DevExpress.XtraEditors.SimpleButton btSapXep;
        private System.Windows.Forms.RadioButton rdNgay;
    }
}