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
    public class CTHDXuatDAL : SqlDataProvider
    {
        public List<CTHDXuat> CTHDXuat_GetByTop(string Top, string Where, string Order)
        {
            List<CTHDXuat> lst = new List<CTHDXuat>();
            using (SqlCommand cmd = new SqlCommand("sp_GetByTop", GetConnection()))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new SqlParameter("@Top", Top));
                cmd.Parameters.Add(new SqlParameter("@Where", Where));
                cmd.Parameters.Add(new SqlParameter("@Order", Order));
                cmd.Parameters.Add(new SqlParameter("@Name", "[dbo].[tb_CTietHDXuat"));
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        CTHDXuat obj = new CTHDXuat();
                        obj.CTHDXuatDataReader(dr);
                        lst.Add(obj);
                    }
                }
            }
            return lst;
        }

        public bool CTHDXuat_Insert(CTHDXuat data)
        {
            try
            {
                using (SqlCommand cmd = new SqlCommand("sp_CTietHDXuat_Insert", GetConnection()))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add(new SqlParameter("@MaHDXuat", data.MaHDXuat));
                    cmd.Parameters.Add(new SqlParameter("@MaMH", data.MaMH));
                    cmd.Parameters.Add(new SqlParameter("@SoLuong", data.SoLuong));
                    cmd.Parameters.Add(new SqlParameter("@GiaXuat", data.GiaXuat));
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
