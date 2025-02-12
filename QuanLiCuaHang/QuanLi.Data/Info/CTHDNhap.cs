﻿using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QuanLi.Data.Info
{
    public class CTHDNhap
    {
        private string _MaHDNhap;
        private string _MaMH;
        private string _SoLuong;
        private string _GiaNhap;
        public string MaHDNhap { get { return _MaHDNhap; } set { _MaHDNhap = value; } }
        public string MaMH { get { return _MaMH; } set { _MaMH = value; } }
        public string SoLuong { get { return _SoLuong; } set { _SoLuong = value; } }
        public string GiaNhap { get { return _GiaNhap; } set { _GiaNhap = value; } }

        public void CTHDNhapDataReader(SqlDataReader dr)
        {
            MaHDNhap = dr["MaHDNhap"] is DBNull ? "" : dr["MaHDNhap"].ToString();
            MaMH = dr["MaMH"] is DBNull ? "" : dr["MaMH"].ToString();
            SoLuong = dr["SoLuong"] is DBNull ? "" : dr["SoLuong"].ToString();
            GiaNhap = dr["GiaNhap"] is DBNull ? "" : dr["GiaNhap"].ToString();

        }
    }
}
