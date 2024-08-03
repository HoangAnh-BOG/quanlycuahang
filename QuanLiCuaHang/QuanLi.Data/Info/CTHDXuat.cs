using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QuanLi.Data.Info
{
    public class CTHDXuat
    {
        private string _MaHDXuat;
        private string _MaMH;
        private string _SoLuong;
        private string _GiaXuat;
        public string MaHDXuat { get { return _MaHDXuat; } set { _MaHDXuat = value; } }
        public string MaMH { get { return _MaMH; } set { _MaMH = value; } }
        public string SoLuong { get { return _SoLuong; } set { _SoLuong = value; } }
        public string GiaXuat { get { return _GiaXuat; } set { _GiaXuat = value; } }

        public void CTHDXuatDataReader(SqlDataReader dr)
        {
            MaHDXuat = dr["MaHDXuat"] is DBNull ? "" : dr["MaHDXuat"].ToString();
            MaMH = dr["MaMH"] is DBNull ? "" : dr["MaMH"].ToString();
            SoLuong = dr["SoLuong"] is DBNull ? "" : dr["SoLuong"].ToString();
            GiaXuat = dr["GiaXuat"] is DBNull ? "" : dr["GiaXuat"].ToString();

        }
    }
}
