using QuanLi.Business;
using QuanLi.Data.Info;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace QuanLiCuaHang
{
    public partial class HoaDonNhap : Form
    {
        public HoaDonNhap()
        {
            InitializeComponent();
        }
        int i;
        public void GetData()
        {
            HDNhapService ck = new HDNhapService();
            List<HDNhap> lckh = new List<HDNhap>();
            lckh = ck.HDNhap_GetByTop("", "", "");
            dgvHienThi.DataSource = lckh;
        }

        private void HoaDonNhap_Load(object sender, EventArgs e)
        {
            GetData();
        }

        private void txtTimKiem_TextChanged(object sender, EventArgs e)
        {
            string where = "MaHDNhap like '%' + '" + txtTimKiem.Text + "' + '%'";
            HDNhapService sv = new HDNhapService();
            List<HDNhap> lst = new List<HDNhap>();
            lst = sv.HDNhap_GetByTop("", where, "");
            dgvHienThi.DataSource = lst;
        }

        public void dgvTimKiem_CellClick(object sender, DataGridViewCellEventArgs e)
        {
             i = e.RowIndex;
            //HDNhapService sv = new HDNhapService();
            //sv.HDNhap_Delete(dgvHienThi.Rows[i].Cells["MaHDNhap"].Value.ToString());
            //GetData();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            string where = "MaHDNhap like '%' + '" + dgvHienThi.Rows[i].Cells[0].Value.ToString() + "' + '%'";
            CTHDNhapService ck = new CTHDNhapService();
            List<CTHDNhap> lckh = new List<CTHDNhap>();
            lckh = ck.CTHDNhap_GetByTop("",where, "");
            dgvHienThi.DataSource = lckh;
        }

        private void button2_Click(object sender, EventArgs e)
        {
            GetData();
        }
    }
}
