using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using QuanLi.Data.Info;

namespace QuanLi.Data.Controller
{
    public class TTHangDAL :SqlDataProvider
    {
        public List<TTHang> TTHang_GetByTop(string Top, string Where, string Order)
        {
            List<TTHang> lst = new List<TTHang>();
            using (SqlCommand cmd = new SqlCommand("sp_GetByTop", GetConnection()))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new SqlParameter("@Top", Top));
                cmd.Parameters.Add(new SqlParameter("@Where", Where));
                cmd.Parameters.Add(new SqlParameter("@Order", Order));
                cmd.Parameters.Add(new SqlParameter("@Name", "[dbo].[tb_TTHang]"));
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        TTHang obj = new TTHang();
                        obj.TTHangDataReader(dr);
                        lst.Add(obj);
                    }
                }
            }
            return lst;
        }

        public bool TTHang_Insert(TTHang data)
        {
            try
            {
                using (SqlCommand cmd = new SqlCommand("sp_TTHang_Add", GetConnection()))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add(new SqlParameter("@TenHang", data.TenHang));
                    cmd.Parameters.Add(new SqlParameter("@GiaBan", data.GiaBan));
                    cmd.Parameters.Add(new SqlParameter("@Mota", data.Mota));
                    cmd.Parameters.Add(new SqlParameter("@MaChietKhau", data.MaChietKhau));
                    cmd.Parameters.Add(new SqlParameter("@HinhAnh", data.HinhAnh));
                    cmd.ExecuteNonQuery();
                    return true;
                }
            }
            catch
            {
                return false;
            }
        }

        public bool TTHang_Update(TTHang data)
        {
            try
            {
                using (SqlCommand cmd = new SqlCommand("sp_TTHang_Update", GetConnection()))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add(new SqlParameter("@MaHang", data.MaHang));
                    cmd.Parameters.Add(new SqlParameter("@TenHang", data.TenHang));
                    cmd.Parameters.Add(new SqlParameter("@GiaBan", data.GiaBan));
                    cmd.Parameters.Add(new SqlParameter("@Mota", data.Mota));
                    cmd.Parameters.Add(new SqlParameter("@MaChietKhau", data.MaChietKhau));
                    cmd.Parameters.Add(new SqlParameter("@HinhAnh", data.HinhAnh));
                    cmd.ExecuteNonQuery();
                    return true;
                }
            }
            catch
            {
                return false;
            }
        }
    }
}
