using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;

namespace QuanLi.Data.Info
{
    public class TTHang
    {
        private string _MaHang;
        private string _TenHang;
        private string _GiaBan;
        private string _Mota;
        private string _MaChietKhau;
        private string _HinhAnh;

        public string MaHang { get { return _MaHang; } set { _MaHang = value; } }
        public string TenHang { get { return _TenHang; } set { _TenHang = value; } }
        public string GiaBan { get { return _GiaBan; } set { _GiaBan = value; } }
        public string Mota { get { return _Mota; } set { _Mota = value; } }
        public string MaChietKhau { get { return _MaChietKhau; } set { _MaChietKhau = value; } }
        public string HinhAnh { get { return _HinhAnh; } set { _HinhAnh = value; } }

        public void TTHangDataReader(SqlDataReader dr)
        {
            MaHang = dr["MaHang"] is DBNull ? "" : dr["MaHang"].ToString();
            TenHang = dr["TenHang"] is DBNull ? "" : dr["TenHang"].ToString();
            GiaBan = dr["GiaBan"] is DBNull ? "0" : dr["GiaBan"].ToString();
            Mota = dr["Mota"] is DBNull ? "" : dr["Mota"].ToString();
            MaChietKhau = dr["MaChietKhau"] is DBNull ? "" : dr["MaChietKhau"].ToString();
            HinhAnh = dr["HinhAnh"] is DBNull ? "" : dr["HinhAnh"].ToString();
        }
    }
}
