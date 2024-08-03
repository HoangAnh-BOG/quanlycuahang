using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Drawing;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data.SqlClient;
using QuanLi.Business;
using QuanLi.Data.Info;

namespace QuanLiCuaHang
{
    public partial class ChietKhau : UserControl
    {
        public ChietKhau()
        {
            InitializeComponent();
            //SetColumn();
        }

        public void GetData()
        {
            txtMaChietKhau.Enabled = false;
            btnSua.Enabled = false;
            ChietKhauService ck = new ChietKhauService();
            List<ChietKhauHang> lckh = new List<ChietKhauHang>();
            lckh = ck.ChietKhauHang_GetByTop("", "","");
            dgvChietKhauHang.DataSource = lckh;
        }

        public void ClearText()
        {
            txtMaChietKhau.Text = "";
            txtGiaTri.Text = "";
            txtThang.Value = 0;
            btnCapNhat.Enabled = true;
            btnThem.Enabled = true;
            btnSua.Enabled = false;

        }


        public void dgvChietKhauHang_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            int i = e.RowIndex; // Vị trí hàng bấm vào
            int j = e.ColumnIndex; // Vị trí cột bấm vào
            if (i >= 0) //Nếu bấm vào trường dữ liệu thì mới lấy dữ liệu
            {
                btnSua.Enabled = true;
                btnThem.Enabled = false;
                txtMaChietKhau.Text = dgvChietKhauHang.Rows[i].Cells["MaChietKhau"].Value.ToString();
                txtGiaTri.Text = dgvChietKhauHang.Rows[i].Cells["GiaTri"].Value.ToString();
                txtThang.Value = decimal.Parse(dgvChietKhauHang.Rows[i].Cells["Thang"].Value.ToString());
            }
        }

        private void btnThem_Click(object sender, EventArgs e)
        {
            ChietKhauHang obj = new ChietKhauHang();
            //obj.MaChietKhau = txtMaChietKhau.Text;
            if (txtGiaTri.Text == "")
            {
                MessageBox.Show("Mời nhập lại giá trị");
            }
            else
            {
                obj.GiaTri = txtGiaTri.Text;
            }
            if (txtThang.Value > 12|| txtThang.Value<1)
            {
                MessageBox.Show("Mời nhập lại tháng");
            }
            else
            {
                obj.Thang = txtThang.Value.ToString();
                ClearText();
            }
            ChietKhauService ckh = new ChietKhauService();
            ckh.ChietKhauHang_Insert(obj);
            GetData();
           // ClearText();
        }

        private void ChietKhau_Load(object sender, EventArgs e)
        {
            GetData();
        }

        private void btnCapNhat_Click(object sender, EventArgs e)
        {
            ClearText();
        }

        private void btnSua_Click(object sender, EventArgs e)
        {
            ChietKhauHang obj = new ChietKhauHang();
            obj.MaChietKhau = txtMaChietKhau.Text;
            if (txtGiaTri.Text == "")
            {
                MessageBox.Show("Không có giá trị");
            }
            else
            {
                obj.GiaTri = txtGiaTri.Text;
            }
            if (txtThang.Value > 12 || txtThang.Value < 1)
            {
                MessageBox.Show("Nhập sai tháng");
            }
            else
            {
                obj.Thang = txtThang.Value.ToString();
                //ClearText();
            }
            ChietKhauService ckh = new ChietKhauService();
            ckh.ChietKhauHang_UpDate(obj);
            GetData();
            ClearText();
        }

        private void btnTimKiem_Click(object sender, EventArgs e)
        {
            string where = "MaChietKhau like '%' + '" + txtTimKiem.Text + "' + '%'";
            ChietKhauService sv = new ChietKhauService();
            List<ChietKhauHang> lst = new List<ChietKhauHang>();
            lst = sv.ChietKhauHang_GetByTop("", where, "");
            dgvChietKhauHang.DataSource = lst;
        }
    }
}
