using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Drawing;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using QuanLi.Business;
using QuanLi.Data.Info;

namespace QuanLiCuaHang
{
    public partial class NhapHang : UserControl
    {
        public NhapHang()
        {
            InitializeComponent();
        }
        int i,j;
        DataTable dt = new DataTable();
        //HDNhap obj = new HDNhap();
        private void txtTimKiem_TextChanged(object sender, EventArgs e)
        {
            
                string where = "MaMH like '%' + '" + txtTimKiem.Text + "' + '%'";
                TTinMatHangService sv = new TTinMatHangService();
                List<TTinMatHang> lst = new List<TTinMatHang>();
                lst = sv.TTinMatHang_GetByTop("", where, "");
                dgvTimKiem.DataSource = lst;
        }

        public void dgvTimKiem_CellClick(object sender, DataGridViewCellEventArgs e)
        {
             i = e.RowIndex; 
        }
        public void dgvHoaDon_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            j = e.RowIndex; 
        }
        public void TaoCot()
        {
           // DataTable dt = new DataTable();
            dt.Columns.Add("MaMH", typeof(String));
            dt.Columns.Add("Tên mặt hàng", typeof(String));
            dt.Columns.Add("Số lượng", typeof(int));
            dt.Columns.Add("Giá nhập", typeof(int));
            dgvHoaDon.DataSource = dt;
        }

        private void btnThem_Click(object sender, EventArgs e)
        {
            // dgvTimKiem_CellClick(sender, e);
            //int tong = nbSoLuongNhap.Value * txtGiaNhap.Text;
            DataRow row;
            row = dt.NewRow();
            row["MaMH"]= dgvTimKiem.Rows[i].Cells[0].Value.ToString(); ;
            row["Tên mặt hàng"] = dgvTimKiem.Rows[i].Cells[1].Value.ToString();
            if(nbSoLuongNhap.Value ==0 || txtGiaNhap.Text == "")
            {
                MessageBox.Show("Bạn chưa nhập số lượng hoặc giá");
            }
            else
            {
                row["Số lượng"] = nbSoLuongNhap.Value;
                row["Giá nhập"] = txtGiaNhap.Text;
                dt.Rows.Add(row);
                dgvHoaDon.DataSource = dt;
            }
        }

        private void btnXoa_Click(object sender, EventArgs e)
        {
            dgvHoaDon.Rows.Remove(dgvHoaDon.Rows[j]);
        }

        private void btnLuu_Click(object sender, EventArgs e)
        {
            HDNhap obj = new HDNhap();
            obj.NgayNhap = dtpNgayNhap.Text;
            HDNhapService sv = new HDNhapService();
            sv.HDNhap_Insert(obj);
            themChiTietNhap();
            MessageBox.Show("Lưu thành công!");

        }
        public void themChiTietNhap()
        {
            HDNhapService svv = new HDNhapService();
            List<HDNhap> lst = new List<HDNhap>();
            lst = svv.HDNhap_GetByTop("1", "", "MaHDNhap DESC");
            for (int i = 0; i < dgvHoaDon.Rows.Count; i++)
            {
                CTHDNhap objj = new CTHDNhap();
                objj.MaHDNhap = lst[0].MaHDNhap;
                objj.MaMH = dgvHoaDon.Rows[i].Cells[0].Value.ToString();
                objj.SoLuong= dgvHoaDon.Rows[i].Cells[2].Value.ToString();
                objj.GiaNhap= dgvHoaDon.Rows[i].Cells[3].Value.ToString();
                CTHDNhapService ssv = new CTHDNhapService();
                ssv.CTHDNhap_Insert(objj);
            }
        }

        private void btnHuy_Click(object sender, EventArgs e)
        {
            for (int i = 0; i < dgvHoaDon.Rows.Count; i++)
            {
                dgvHoaDon.Rows.Remove(dgvHoaDon.Rows[i]);
            }
        }

        private void btnXemHD_Click(object sender, EventArgs e)
        {
            HoaDonNhap hoaDonNhap = new HoaDonNhap();
            hoaDonNhap.Show();
        }

        private void NhapHang_Load(object sender, EventArgs e)
        {
            TaoCot();
        }
    }
}
