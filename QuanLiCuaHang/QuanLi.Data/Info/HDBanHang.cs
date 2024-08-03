using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QuanLi.Data.Info
{
    public class HDBanHang
    {
        private string _MaHDBanHang;
        private string _NgayBan;
        private string _ThanhTien;
        private string _MaNV;
        public string MaHDBanHang { get { return _MaHDBanHang; } set { _MaHDBanHang = value; } }
        public string NgayBan { get { return _NgayBan; } set { _NgayBan = value; } }
        public string ThanhTien { get { return _ThanhTien; } set { _ThanhTien = value; } }
        public string MaNV { get { return _MaNV; } set { _MaNV = value; } }
        public void HDBanHangDataReader(SqlDataReader dr)
        {
            MaHDBanHang = dr["MaHDBanHang"] is DBNull ? "" : dr["MaHDBanHang"].ToString();
            NgayBan = dr["NgayBan"] is DBNull ? "" : dr["NgayBan"].ToString();
            ThanhTien = dr["ThanhTien"] is DBNull ? "" : dr["ThanhTien"].ToString();
            MaNV = dr["MaNV"] is DBNull ? "" : dr["MaNV"].ToString();

        }
    }
}
