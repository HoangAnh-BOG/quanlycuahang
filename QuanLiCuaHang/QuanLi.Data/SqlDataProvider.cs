using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;

namespace QuanLi.Data
{
    public class SqlDataProvider
    {
        private SqlConnection conn = null;
        private string ConStr = "Server = .\\SQLEXPRESS; Database = QuanliCuaHang; Integrated Security = SSPI; Uid = sa; Pwd = 12345678;";

        //Khởi tạo kết nối
        public SqlDataProvider()
        {
            if (conn == null)
            {
                conn = new SqlConnection(ConStr);
            }
        }

        //Mở kết nối
        public SqlConnection GetConnection()
        {
            if (conn.State == ConnectionState.Closed)
            {
                conn.Open();
            }
            return conn;
        }
    }
}
