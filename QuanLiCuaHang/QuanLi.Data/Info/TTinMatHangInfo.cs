using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;

namespace QuanLi.Data.Info
{
    public class TTinMatHang
    {
        private string _MaMH;
        private string _TenMH;
        private string _Size;
        private string _SoLuongTon;
        private string _MaHang;

        public string MaMH { get { return _MaMH; } set { _MaMH = value; } }
        public string TenMH { get { return _TenMH; } set { _TenMH = value; } }
        public string Size { get { return _Size; } set { _Size = value; } }
        public string SoLuongTon { get { return _SoLuongTon; } set { _SoLuongTon = value; } }
        public string MaHang { get { return _MaHang; } set { _MaHang = value; } }
        

        public void TTinMatHangDataReader(SqlDataReader dr)
        {
            MaMH = dr["MaMH"] is DBNull ? "" : dr["MaMH"].ToString();
            TenMH = dr["TenMH"] is DBNull ? "" : dr["TenMH"].ToString();
            Size = dr["Size"] is DBNull ? "0" : dr["Size"].ToString();
            SoLuongTon = dr["SoLuongTon"] is DBNull ? "0" : dr["SoLuongTon"].ToString();
            MaHang = dr["MaHang"] is DBNull ? "" : dr["MaHang"].ToString();
        }
    }
}
