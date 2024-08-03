using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;

namespace QuanLi.Data.Info
{
    public class ChietKhauHang
    {
        private string _MaChietKhau;
        private string _GiaTri;
        private string _Thang;

        public string MaChietKhau { get { return _MaChietKhau; } set { _MaChietKhau = value; } }
        public string GiaTri { get { return _GiaTri; } set { _GiaTri = value; } }
        public string Thang { get { return _Thang; } set { _Thang = value; } }

        public void ChietKhauHangDataReader(SqlDataReader dr)
        {
            MaChietKhau = dr["MaChietKhau"] is DBNull ? "" : dr["MaChietKhau"].ToString();
            GiaTri = dr["GiaTri"] is DBNull ? "0" : dr["GiaTri"].ToString();
            Thang = dr["Thang"] is DBNull ? "0" : dr["Thang"].ToString();
        }
    }
}
