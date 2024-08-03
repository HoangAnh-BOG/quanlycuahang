namespace QuanLiCuaHang
{
    partial class Form2
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
            this.components = new System.ComponentModel.Container();
            Microsoft.Reporting.WinForms.ReportDataSource reportDataSource1 = new Microsoft.Reporting.WinForms.ReportDataSource();
            this.reportViewer1 = new Microsoft.Reporting.WinForms.ReportViewer();
            this.QuanliCuaHangDataSet = new QuanLiCuaHang.QuanliCuaHangDataSet();
            this.tb_TTMatHangBindingSource = new System.Windows.Forms.BindingSource(this.components);
            this.tb_TTMatHangTableAdapter = new QuanLiCuaHang.QuanliCuaHangDataSetTableAdapters.tb_TTMatHangTableAdapter();
            ((System.ComponentModel.ISupportInitialize)(this.QuanliCuaHangDataSet)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.tb_TTMatHangBindingSource)).BeginInit();
            this.SuspendLayout();
            // 
            // reportViewer1
            // 
            this.reportViewer1.Dock = System.Windows.Forms.DockStyle.Fill;
            reportDataSource1.Name = "DataSet1";
            reportDataSource1.Value = this.tb_TTMatHangBindingSource;
            this.reportViewer1.LocalReport.DataSources.Add(reportDataSource1);
            this.reportViewer1.LocalReport.ReportEmbeddedResource = "QuanLiCuaHang.MatHangBanChay.rdlc";
            this.reportViewer1.Location = new System.Drawing.Point(0, 0);
            this.reportViewer1.Name = "reportViewer1";
            this.reportViewer1.ServerReport.BearerToken = null;
            this.reportViewer1.Size = new System.Drawing.Size(678, 403);
            this.reportViewer1.TabIndex = 0;
            this.reportViewer1.Load += new System.EventHandler(this.reportViewer1_Load);
            // 
            // QuanliCuaHangDataSet
            // 
            this.QuanliCuaHangDataSet.DataSetName = "QuanliCuaHangDataSet";
            this.QuanliCuaHangDataSet.SchemaSerializationMode = System.Data.SchemaSerializationMode.IncludeSchema;
            // 
            // tb_TTMatHangBindingSource
            // 
            this.tb_TTMatHangBindingSource.DataMember = "tb_TTMatHang";
            this.tb_TTMatHangBindingSource.DataSource = this.QuanliCuaHangDataSet;
            // 
            // tb_TTMatHangTableAdapter
            // 
            this.tb_TTMatHangTableAdapter.ClearBeforeFill = true;
            // 
            // Form2
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(678, 403);
            this.Controls.Add(this.reportViewer1);
            this.Name = "Form2";
            this.Text = "Form2";
            this.Load += new System.EventHandler(this.Form2_Load);
            ((System.ComponentModel.ISupportInitialize)(this.QuanliCuaHangDataSet)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.tb_TTMatHangBindingSource)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private Microsoft.Reporting.WinForms.ReportViewer reportViewer1;
        private System.Windows.Forms.BindingSource tb_TTMatHangBindingSource;
        private QuanliCuaHangDataSet QuanliCuaHangDataSet;
        private QuanliCuaHangDataSetTableAdapters.tb_TTMatHangTableAdapter tb_TTMatHangTableAdapter;
    }
}