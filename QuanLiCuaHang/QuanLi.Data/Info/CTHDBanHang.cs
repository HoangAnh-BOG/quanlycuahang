using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QuanLi.Data.Info
{
    public class CTHDBanHang
    {
        private string _MaHDBanHang;
        private string _MaMH;
        private string _SoLuong;
        private string _GiaBan;
        private string _TongChietKhau;
        public string MaHDBanHang { get { return _MaHDBanHang; } set { _MaHDBanHang = value; } }
        public string MaMH { get { return _MaMH; } set { _MaMH = value; } }
        public string SoLuong { get { return _SoLuong; } set { _SoLuong = value; } }
        public string GiaBan { get { return _GiaBan; } set { _GiaBan = value; } }
        public string TongChietKhau { get { return _TongChietKhau; } set { _TongChietKhau = value; } }

        public void CTHDBanHangDataReader(SqlDataReader dr)
        {
            MaHDBanHang = dr["MaHDBanHang"] is DBNull ? "" : dr["MaHDBanHang"].ToString();
            MaMH = dr["MaMH"] is DBNull ? "" : dr["MaMH"].ToString();
            SoLuong = dr["SoLuong"] is DBNull ? "" : dr["SoLuong"].ToString();
            GiaBan = dr["GiaBan"] is DBNull ? "" : dr["GiaBan"].ToString();
            TongChietKhau = dr["TongChietKhau"] is DBNull ? "" : dr["TongChietKhau"].ToString();

        }
    }
}
