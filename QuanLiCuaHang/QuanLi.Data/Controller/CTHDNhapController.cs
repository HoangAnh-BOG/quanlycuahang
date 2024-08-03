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
    public class CTHDNhapDAL : SqlDataProvider
    {
        public List<CTHDNhap> CTHDNhap_GetByTop(string Top, string Where, string Order)
        {
            List<CTHDNhap> lst = new List<CTHDNhap>();
            using (SqlCommand cmd = new SqlCommand("sp_GetByTop", GetConnection()))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new SqlParameter("@Top", Top));
                cmd.Parameters.Add(new SqlParameter("@Where", Where));
                cmd.Parameters.Add(new SqlParameter("@Order", Order));
                cmd.Parameters.Add(new SqlParameter("@Name", "[dbo].[tb_CTietHDNhap]"));
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        CTHDNhap obj = new CTHDNhap();
                        obj.CTHDNhapDataReader(dr);
                        lst.Add(obj);
                    }
                }
            }
            return lst;
        }

        public bool CTHDNhap_Insert(CTHDNhap data)
        {
            try
            {
                using (SqlCommand cmd = new SqlCommand("sp_CTietHDNhap_Insert", GetConnection()))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add(new SqlParameter("@MaHDNHap", data.MaHDNhap));
                    cmd.Parameters.Add(new SqlParameter("@MaMH", data.MaMH));
                    cmd.Parameters.Add(new SqlParameter("@SoLuong", data.SoLuong));
                    cmd.Parameters.Add(new SqlParameter("@GiaNhap", data.GiaNhap));
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
