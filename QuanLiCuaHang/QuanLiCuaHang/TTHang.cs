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
using System.Data.SqlClient;

namespace QuanLiCuaHang
{
    public partial class TTHang : UserControl
    {
        public TTHang()
        {
            InitializeComponent();
        }

        public void GetData()
        {
            txtMaHang.Enabled = false;
            btnSua.Enabled = false;
            TTHangService ck = new TTHangService();
            List<QuanLi.Data.Info.TTHang> lckh = new List<QuanLi.Data.Info.TTHang>();
            lckh = ck.TTHang_GetByTop("", "","");
            dgvTTHang.DataSource = lckh;


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
            cmd.Parameters.Add(new SqlParameter("@Name", "[dbo].[tb_ChieuKhauHang]"));
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            //Bước 3: Khởi tạo dataset
            DataSet ds = new DataSet();
            //Bước 4: Đổ dữ liệu lên DataSet
            da.Fill(ds, "ChietKhau");
            //Bước 5: Hiển thị dữ liệu lên DataGridview
            cbMaChietKhau.DataSource = ds.Tables["ChietKhau"];
            //Chỉ định dữ liệu hiển thị
            cbMaChietKhau.DisplayMember = "MaChietKhau";
            //Chỉ đị dữ liệu tương ứng giá trị
            cbMaChietKhau.ValueMember = "MaChietKhau";
        }

        public void ClearText()
        {
            txtMaHang.Text = "";
            txtTenHang.Text = "";
            txtGiaBan.Text = "";
            txtMota.Text = "";
            cbMaChietKhau.Text = "";
            pbHinhAnh.ImageLocation = "";
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
                txtMaHang.Text = dgvTTHang.Rows[i].Cells["MaHang"].Value.ToString();
                txtTenHang.Text = dgvTTHang.Rows[i].Cells["TenHang"].Value.ToString();
                txtGiaBan.Text = dgvTTHang.Rows[i].Cells["GiaBan"].Value.ToString();
                txtMota.Text = dgvTTHang.Rows[i].Cells["Mota"].Value.ToString();
                cbMaChietKhau.Text = dgvTTHang.Rows[i].Cells["MaChietKhau"].Value.ToString();
                pbHinhAnh.ImageLocation = dgvTTHang.Rows[i].Cells["HinhAnh"].Value.ToString();
            }
        }
        private void TTHang_Load(object sender, EventArgs e)
        {
            GetData();
            GetCmb();

        }

        private void btnChon_Click(object sender, EventArgs e)
        {
            OpenFileDialog openFileDialog = new OpenFileDialog();
            openFileDialog.Title = "Open Image";
            openFileDialog.InitialDirectory = @"C:\";
            openFileDialog.Filter = "Image|*.jpg;*.jpeg;*.png;*.gif;*.bmp;";
            if (openFileDialog.ShowDialog() == DialogResult.OK)
            {
                pbHinhAnh.ImageLocation = openFileDialog.FileName;
                //pbHinhAnh.Image = Image.FromFile(openFileDialog.FileName);
                // pbHinhAnh.ImageLocation 
            }
        }

        private void btnCapNhat_Click(object sender, EventArgs e)
        {
            ClearText();
        }

        private void btnThem_Click(object sender, EventArgs e)
        {
            QuanLi.Data.Info.TTHang obj = new QuanLi.Data.Info.TTHang();
            obj.TenHang = txtTenHang.Text;
            obj.GiaBan = txtGiaBan.Text;
            obj.Mota = txtMota.Text;
            obj.MaChietKhau = cbMaChietKhau.SelectedValue.ToString();
            obj.HinhAnh = pbHinhAnh.ImageLocation;
            TTHangService sv = new TTHangService();
            sv.TTHang_Insert(obj);
            GetData();
            ClearText();
        }

        private void btnSua_Click(object sender, EventArgs e)
        {
            QuanLi.Data.Info.TTHang obj = new QuanLi.Data.Info.TTHang();
            obj.MaHang = txtMaHang.Text;
            obj.TenHang = txtTenHang.Text;
            obj.GiaBan = txtGiaBan.Text;
            obj.Mota = txtMota.Text;
            obj.MaChietKhau = cbMaChietKhau.SelectedValue.ToString();
            obj.HinhAnh = pbHinhAnh.ImageLocation;
            TTHangService sv = new TTHangService();
            sv.TTHang_UpDate(obj);
            GetData();
            ClearText();
        }

        private void btnTimKiem_Click(object sender, EventArgs e)
        {
            string where = "MaHang like '%' + '" + txtTimKiem.Text + "' + '%'";
            TTHangService sv = new TTHangService();
            List<QuanLi.Data.Info.TTHang> lst = new List<QuanLi.Data.Info.TTHang>();
            lst = sv.TTHang_GetByTop("",where,"");
            dgvTTHang.DataSource = lst;
        }
    }
}
