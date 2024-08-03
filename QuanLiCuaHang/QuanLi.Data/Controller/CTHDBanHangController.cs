using QuanLi.Data.Info;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QuanLi.Data.Controller
{
    public class CTHDBanHangDAL : SqlDataProvider
    {
        public List<CTHDBanHang> CTHDBanHang_GetByTop(string Top, string Where, string Order)
        {
            List<CTHDBanHang> lst = new List<CTHDBanHang>();
            using (SqlCommand cmd = new SqlCommand("sp_GetByTop", GetConnection()))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new SqlParameter("@Top", Top));
                cmd.Parameters.Add(new SqlParameter("@Where", Where));
                cmd.Parameters.Add(new SqlParameter("@Order", Order));
                cmd.Parameters.Add(new SqlParameter("@Name", "[dbo].[tb_CTietHDBanHang]"));
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        CTHDBanHang obj = new CTHDBanHang();
                        obj.CTHDBanHangDataReader(dr);
                        lst.Add(obj);
                    }
                }
            }
            return lst;
        }

        public bool CTHDBanHang_Insert(CTHDBanHang data)
        {
            try
            {
                using (SqlCommand cmd = new SqlCommand("sp_CTietHDBanHang_Insert", GetConnection()))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add(new SqlParameter("@MaHDBanHang", data.MaHDBanHang));
                    cmd.Parameters.Add(new SqlParameter("@MaMH", data.MaMH));
                    cmd.Parameters.Add(new SqlParameter("@SoLuong", data.SoLuong));
                    cmd.Parameters.Add(new SqlParameter("@GiaBan", data.GiaBan));
                    cmd.Parameters.Add(new SqlParameter("@TongChietKhau", data.TongChietKhau));
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
