namespace QuanLiTrungTamAnhNgu
{
    partial class frGiaoVien
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(frGiaoVien));
            this.panelControl2 = new DevExpress.XtraEditors.PanelControl();
            this.treeViewLH = new System.Windows.Forms.TreeView();
            this.gcHocVien = new DevExpress.XtraGrid.GridControl();
            this.gvHocVien = new DevExpress.XtraGrid.Views.Grid.GridView();
            this.panelControl1 = new DevExpress.XtraEditors.PanelControl();
            this.lbSoLuong = new System.Windows.Forms.Label();
            this.btnThoat = new DevExpress.XtraEditors.SimpleButton();
            this.txtSoBBuoiHoc = new DevExpress.XtraEditors.TextEdit();
            this.txtKhungGioHoc = new DevExpress.XtraEditors.TextEdit();
            this.txtLopHoc = new DevExpress.XtraEditors.TextEdit();
            this.txtKhoaHoc = new DevExpress.XtraEditors.TextEdit();
            this.txtLevels = new DevExpress.XtraEditors.TextEdit();
            this.label7 = new System.Windows.Forms.Label();
            this.label6 = new System.Windows.Forms.Label();
            this.label5 = new System.Windows.Forms.Label();
            this.label4 = new System.Windows.Forms.Label();
            this.label3 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.label1 = new System.Windows.Forms.Label();
            ((System.ComponentModel.ISupportInitialize)(this.panelControl2)).BeginInit();
            this.panelControl2.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.gcHocVien)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.gvHocVien)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.panelControl1)).BeginInit();
            this.panelControl1.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.txtSoBBuoiHoc.Properties)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.txtKhungGioHoc.Properties)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.txtLopHoc.Properties)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.txtKhoaHoc.Properties)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.txtLevels.Properties)).BeginInit();
            this.SuspendLayout();
            // 
            // panelControl2
            // 
            this.panelControl2.Controls.Add(this.treeViewLH);
            this.panelControl2.Dock = System.Windows.Forms.DockStyle.Left;
            this.panelControl2.Location = new System.Drawing.Point(0, 0);
            this.panelControl2.Name = "panelControl2";
            this.panelControl2.Size = new System.Drawing.Size(250, 569);
            this.panelControl2.TabIndex = 1;
            // 
            // treeViewLH
            // 
            this.treeViewLH.Dock = System.Windows.Forms.DockStyle.Fill;
            this.treeViewLH.Location = new System.Drawing.Point(2, 2);
            this.treeViewLH.Name = "treeViewLH";
            this.treeViewLH.Size = new System.Drawing.Size(246, 565);
            this.treeViewLH.TabIndex = 0;
            this.treeViewLH.AfterSelect += new System.Windows.Forms.TreeViewEventHandler(this.treeViewLH_AfterSelect);
            // 
            // gcHocVien
            // 
            this.gcHocVien.Dock = System.Windows.Forms.DockStyle.Top;
            this.gcHocVien.Location = new System.Drawing.Point(250, 0);
            this.gcHocVien.MainView = this.gvHocVien;
            this.gcHocVien.Name = "gcHocVien";
            this.gcHocVien.Size = new System.Drawing.Size(766, 275);
            this.gcHocVien.TabIndex = 2;
            this.gcHocVien.ViewCollection.AddRange(new DevExpress.XtraGrid.Views.Base.BaseView[] {
            this.gvHocVien});
            // 
            // gvHocVien
            // 
            this.gvHocVien.GridControl = this.gcHocVien;
            this.gvHocVien.Name = "gvHocVien";
            this.gvHocVien.ShowingEditor += new System.ComponentModel.CancelEventHandler(this.gvHocVien_ShowingEditor);
            // 
            // panelControl1
            // 
            this.panelControl1.Controls.Add(this.lbSoLuong);
            this.panelControl1.Controls.Add(this.btnThoat);
            this.panelControl1.Controls.Add(this.txtSoBBuoiHoc);
            this.panelControl1.Controls.Add(this.txtKhungGioHoc);
            this.panelControl1.Controls.Add(this.txtLopHoc);
            this.panelControl1.Controls.Add(this.txtKhoaHoc);
            this.panelControl1.Controls.Add(this.txtLevels);
            this.panelControl1.Controls.Add(this.label7);
            this.panelControl1.Controls.Add(this.label6);
            this.panelControl1.Controls.Add(this.label5);
            this.panelControl1.Controls.Add(this.label4);
            this.panelControl1.Controls.Add(this.label3);
            this.panelControl1.Controls.Add(this.label2);
            this.panelControl1.Controls.Add(this.label1);
            this.panelControl1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.panelControl1.Location = new System.Drawing.Point(250, 275);
            this.panelControl1.Name = "panelControl1";
            this.panelControl1.Size = new System.Drawing.Size(766, 294);
            this.panelControl1.TabIndex = 3;
            // 
            // lbSoLuong
            // 
            this.lbSoLuong.AutoSize = true;
            this.lbSoLuong.Font = new System.Drawing.Font("Times New Roman", 13.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lbSoLuong.Location = new System.Drawing.Point(530, 177);
            this.lbSoLuong.Name = "lbSoLuong";
            this.lbSoLuong.Size = new System.Drawing.Size(97, 27);
            this.lbSoLuong.TabIndex = 25;
            this.lbSoLuong.Text = "Số lượng";
            // 
            // btnThoat
            // 
            this.btnThoat.Appearance.Font = new System.Drawing.Font("Times New Roman", 13.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnThoat.Appearance.ForeColor = System.Drawing.SystemColors.Highlight;
            this.btnThoat.Appearance.Options.UseFont = true;
            this.btnThoat.Appearance.Options.UseForeColor = true;
            this.btnThoat.AutoSize = true;
            this.btnThoat.ImageOptions.Image = ((System.Drawing.Image)(resources.GetObject("btnThoat.ImageOptions.Image")));
            this.btnThoat.Location = new System.Drawing.Point(505, 225);
            this.btnThoat.Name = "btnThoat";
            this.btnThoat.Size = new System.Drawing.Size(221, 36);
            this.btnThoat.TabIndex = 24;
            this.btnThoat.Text = "Thoát chương trình";
            this.btnThoat.Click += new System.EventHandler(this.btnThoat_Click);
            // 
            // txtSoBBuoiHoc
            // 
            this.txtSoBBuoiHoc.Location = new System.Drawing.Point(530, 125);
            this.txtSoBBuoiHoc.Name = "txtSoBBuoiHoc";
            this.txtSoBBuoiHoc.Properties.Appearance.Font = new System.Drawing.Font("Times New Roman", 13.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtSoBBuoiHoc.Properties.Appearance.Options.UseFont = true;
            this.txtSoBBuoiHoc.Size = new System.Drawing.Size(198, 32);
            this.txtSoBBuoiHoc.TabIndex = 23;
            // 
            // txtKhungGioHoc
            // 
            this.txtKhungGioHoc.Location = new System.Drawing.Point(530, 74);
            this.txtKhungGioHoc.Name = "txtKhungGioHoc";
            this.txtKhungGioHoc.Properties.Appearance.Font = new System.Drawing.Font("Times New Roman", 13.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtKhungGioHoc.Properties.Appearance.Options.UseFont = true;
            this.txtKhungGioHoc.Size = new System.Drawing.Size(198, 32);
            this.txtKhungGioHoc.TabIndex = 22;
            // 
            // txtLopHoc
            // 
            this.txtLopHoc.Location = new System.Drawing.Point(124, 174);
            this.txtLopHoc.Name = "txtLopHoc";
            this.txtLopHoc.Properties.Appearance.Font = new System.Drawing.Font("Times New Roman", 13.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtLopHoc.Properties.Appearance.Options.UseFont = true;
            this.txtLopHoc.Size = new System.Drawing.Size(193, 32);
            this.txtLopHoc.TabIndex = 21;
            // 
            // txtKhoaHoc
            // 
            this.txtKhoaHoc.Location = new System.Drawing.Point(124, 125);
            this.txtKhoaHoc.Name = "txtKhoaHoc";
            this.txtKhoaHoc.Properties.Appearance.Font = new System.Drawing.Font("Times New Roman", 13.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtKhoaHoc.Properties.Appearance.Options.UseFont = true;
            this.txtKhoaHoc.Size = new System.Drawing.Size(193, 32);
            this.txtKhoaHoc.TabIndex = 20;
            // 
            // txtLevels
            // 
            this.txtLevels.Location = new System.Drawing.Point(124, 74);
            this.txtLevels.Name = "txtLevels";
            this.txtLevels.Properties.Appearance.Font = new System.Drawing.Font("Times New Roman", 13.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtLevels.Properties.Appearance.Options.UseFont = true;
            this.txtLevels.Size = new System.Drawing.Size(193, 32);
            this.txtLevels.TabIndex = 19;
            // 
            // label7
            // 
            this.label7.AutoSize = true;
            this.label7.Font = new System.Drawing.Font("Times New Roman", 13.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label7.Location = new System.Drawing.Point(333, 177);
            this.label7.Name = "label7";
            this.label7.Size = new System.Drawing.Size(191, 27);
            this.label7.TabIndex = 18;
            this.label7.Text = "Số lượng học viên:";
            // 
            // label6
            // 
            this.label6.AutoSize = true;
            this.label6.Font = new System.Drawing.Font("Times New Roman", 13.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label6.Location = new System.Drawing.Point(399, 128);
            this.label6.Name = "label6";
            this.label6.Size = new System.Drawing.Size(125, 27);
            this.label6.TabIndex = 17;
            this.label6.Text = "Số buổi học";
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Font = new System.Drawing.Font("Times New Roman", 13.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label5.Location = new System.Drawing.Point(371, 77);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(153, 27);
            this.label5.TabIndex = 16;
            this.label5.Text = "Khung giờ học";
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Font = new System.Drawing.Font("Times New Roman", 13.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label4.Location = new System.Drawing.Point(25, 177);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(93, 27);
            this.label4.TabIndex = 15;
            this.label4.Text = "Lớp học";
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Font = new System.Drawing.Font("Times New Roman", 13.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label3.Location = new System.Drawing.Point(42, 77);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(76, 27);
            this.label3.TabIndex = 14;
            this.label3.Text = "Levels";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Font = new System.Drawing.Font("Times New Roman", 13.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label2.Location = new System.Drawing.Point(7, 128);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(111, 27);
            this.label2.TabIndex = 13;
            this.label2.Text = "Khóa học ";
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Times New Roman", 19.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.Location = new System.Drawing.Point(221, 11);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(248, 37);
            this.label1.TabIndex = 12;
            this.label1.Text = "Thông tin lớp học";
            // 
            // frGiaoVien
            // 
            this.Appearance.BackColor = System.Drawing.Color.White;
            this.Appearance.Options.UseBackColor = true;
            this.AutoScaleDimensions = new System.Drawing.SizeF(7F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1016, 569);
            this.Controls.Add(this.panelControl1);
            this.Controls.Add(this.gcHocVien);
            this.Controls.Add(this.panelControl2);
            this.Name = "frGiaoVien";
            this.SizeGripStyle = System.Windows.Forms.SizeGripStyle.Show;
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterParent;
            this.Text = "Giáo Viên";
            this.Load += new System.EventHandler(this.frGiaoVien_Load);
            ((System.ComponentModel.ISupportInitialize)(this.panelControl2)).EndInit();
            this.panelControl2.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.gcHocVien)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.gvHocVien)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.panelControl1)).EndInit();
            this.panelControl1.ResumeLayout(false);
            this.panelControl1.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.txtSoBBuoiHoc.Properties)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.txtKhungGioHoc.Properties)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.txtLopHoc.Properties)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.txtKhoaHoc.Properties)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.txtLevels.Properties)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion
        private DevExpress.XtraEditors.PanelControl panelControl2;
        private DevExpress.XtraGrid.GridControl gcHocVien;
        private DevExpress.XtraGrid.Views.Grid.GridView gvHocVien;
        private DevExpress.XtraEditors.PanelControl panelControl1;
        private DevExpress.XtraEditors.TextEdit txtSoBBuoiHoc;
        private DevExpress.XtraEditors.TextEdit txtKhungGioHoc;
        private DevExpress.XtraEditors.TextEdit txtLopHoc;
        private DevExpress.XtraEditors.TextEdit txtKhoaHoc;
        private DevExpress.XtraEditors.TextEdit txtLevels;
        private System.Windows.Forms.Label label7;
        private System.Windows.Forms.Label label6;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.TreeView treeViewLH;
        private DevExpress.XtraEditors.SimpleButton btnThoat;
        private System.Windows.Forms.Label lbSoLuong;
    }
}