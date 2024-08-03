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
using System.Data.SqlClient;

namespace QuanLiCuaHang
{
    public partial class TTMatHang : UserControl
    {
        public TTMatHang()
        {
            InitializeComponent();
        }

        public void GetData()
        {
            txtMaMH.Enabled = false;
            btnSua.Enabled = false;
            TTinMatHangService ck = new TTinMatHangService();
            List<TTinMatHang> lckh = new List<TTinMatHang>();
            lckh = ck.TTinMatHang_GetByTop("", "", "");
            dgvTTMatHang.DataSource = lckh;


        }

        public void GetCmb()
        {
            //Bước 1: Khởi tạo kết nối
            SqlConnection conn = new SqlConnection(QuanLiCuaHang.Properties.Settings.Default.ConStr);
            //Bước 2: Khởi tạo SqlDataAdapter (sử dụng để đổ dữ liệu)
            SqlCommand cmd = new SqlCommand("sp_GetByTop", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@Top", ""));
            cmd.Parameters.Add(new SqlParameter("@Where", ""));
            cmd.Parameters.Add(new SqlParameter("@Order", ""));
            cmd.Parameters.Add(new SqlParameter("@Name", "[dbo].[tb_TTHang]"));
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            //Bước 3: Khởi tạo dataset
            DataSet ds = new DataSet();
            //Bước 4: Đổ dữ liệu lên DataSet
            da.Fill(ds, "TTinHang");
            //Bước 5: Hiển thị dữ liệu lên DataGridview
            cbMaHang.DataSource = ds.Tables["TTinHang"];
            //Chỉ định dữ liệu hiển thị
            cbMaHang.DisplayMember = "MaHang";
            //Chỉ đị dữ liệu tương ứng giá trị
            cbMaHang.ValueMember = "MaHang";
        }

        public void ClearText()
        {
            txtMaMH.Text = "";
            txtTenMH.Text = "";
            txtSize.Text = "";
            txtSoLuongTon.Text = "";
            cbMaHang.Text = "";
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
                txtMaMH.Text = dgvTTMatHang.Rows[i].Cells["MaMH"].Value.ToString();
                txtTenMH.Text = dgvTTMatHang.Rows[i].Cells["TenMH"].Value.ToString();
                txtSize.Value = decimal.Parse(dgvTTMatHang.Rows[i].Cells["Size"].Value.ToString());
                txtSoLuongTon.Text = dgvTTMatHang.Rows[i].Cells["SoLuongTon"].Value.ToString();
                cbMaHang.SelectedValue = dgvTTMatHang.Rows[i].Cells["MaHang"].Value.ToString();
            }
        }

        private void TTMatHang_Load(object sender, EventArgs e)
        {
            GetData();
            GetCmb();
        }

        private void btnCapNhat_Click(object sender, EventArgs e)
        {
            ClearText();
        }

        private void btnThem_Click(object sender, EventArgs e)
        {
            TTinMatHang obj = new TTinMatHang();
            obj.TenMH = txtTenMH.Text;
            obj.Size = txtSize.Value.ToString();
            obj.SoLuongTon = txtSoLuongTon.Text;
            obj.MaHang = cbMaHang.SelectedValue.ToString();
            TTinMatHangService sv = new TTinMatHangService();
            sv.TTinMatHang_Insert(obj);
            GetData();
            ClearText();
        }

        private void btnSua_Click(object sender, EventArgs e)
        {
            TTinMatHang obj = new TTinMatHang();
            obj.MaMH = txtMaMH.Text;
            obj.TenMH = txtTenMH.Text;
            obj.Size = txtSize.Value.ToString();
            obj.SoLuongTon = txtSoLuongTon.Text;
            obj.MaHang = cbMaHang.SelectedValue.ToString();
            TTinMatHangService sv = new TTinMatHangService();
            sv.TTinMatHang_UpDate(obj);
            GetData();
            ClearText();
        }

        private void btnTimKiem_Click(object sender, EventArgs e)
        {
            string where = "MaMH like '%' + '" + txtTimKiem.Text + "' + '%'";
            TTinMatHangService sv = new TTinMatHangService();
            List<TTinMatHang> lst = new List<TTinMatHang>();
            lst = sv.TTinMatHang_GetByTop("", where, "");
            dgvTTMatHang.DataSource = lst;
        }
    }
}
