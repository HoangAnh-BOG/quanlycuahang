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
    public class ChietKhauDAL : SqlDataProvider
    {
        public List<ChietKhauHang> ChietKhauHang_GetByTop(string Top, string Where, string Order)
        {
            List<ChietKhauHang> lst = new List<ChietKhauHang>();
            using (SqlCommand cmd = new SqlCommand("sp_GetByTop", GetConnection()))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new SqlParameter("@Top", Top));
                cmd.Parameters.Add(new SqlParameter("@Where", Where));
                cmd.Parameters.Add(new SqlParameter("@Order", Order));
                cmd.Parameters.Add(new SqlParameter("@Name", "[dbo].[tb_ChieuKhauHang]"));
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        ChietKhauHang obj = new ChietKhauHang();
                        obj.ChietKhauHangDataReader(dr);
                        lst.Add(obj);
                    }
                }
            }
            return lst;
        }

        public bool ChietKhauHang_Insert(ChietKhauHang data)
        {
            try
            {
                using (SqlCommand cmd = new SqlCommand("sp_ChietKhauHang_Add", GetConnection()))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    //cmd.Parameters.Add(new SqlParameter("@MaChietKhau", data.MaChietKhau));
                    cmd.Parameters.Add(new SqlParameter("@GiaTri", data.GiaTri));
                    cmd.Parameters.Add(new SqlParameter("@Thang", data.Thang));
                    cmd.ExecuteNonQuery();
                    return true;
                }
            }
            catch
            {
                return false;
            }
        }

        public bool ChietKhauHang_Update(ChietKhauHang data)
        {
            try
            {
                using (SqlCommand cmd = new SqlCommand("sp_ChietKhauHang_Update", GetConnection()))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add(new SqlParameter("@MaChietKhau", data.MaChietKhau));
                    cmd.Parameters.Add(new SqlParameter("@GiaTri", data.GiaTri));
                    cmd.Parameters.Add(new SqlParameter("@Thang", data.Thang));
                    cmd.ExecuteNonQuery();
                    return true;
                }
            }
            catch
            {
                return false;
            }
        }

        //public bool ChietKhauHang_Delete(string MaChietKhau)
        //{
        //    try
        //    {
        //        using (SqlCommand cmd = new SqlCommand("sp_ChietKhauHang_Delete", GetConnection()))
        //        {
        //            cmd.CommandType = CommandType.StoredProcedure;
        //            cmd.Parameters.Add(new SqlParameter("@MaChietKhau", MaChietKhau));
        //            cmd.ExecuteNonQuery();
        //            return true;
        //        }
        //    }
        //    catch
        //    {
        //        return false;
        //    }
        //}
    }
}
