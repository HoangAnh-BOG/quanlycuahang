using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using QuanLi.Data.Controller;
using QuanLi.Data.Info;

namespace QuanLi.Business
{
    public class ChietKhauService
    {
        ChietKhauDAL cmd = new ChietKhauDAL();
        public List<ChietKhauHang> ChietKhauHang_GetByTop(string Top, string Where, string Order)
        {
            return cmd.ChietKhauHang_GetByTop(Top, Where, Order);
        }
        public bool ChietKhauHang_Insert(ChietKhauHang data)
        {
            return cmd.ChietKhauHang_Insert(data);
        }
        public bool ChietKhauHang_UpDate(ChietKhauHang data)
        {
            return cmd.ChietKhauHang_Update(data);
        }
        //public bool ChietKhauHang_Delete(string MaChietKhau)
        //{
        //    return cmd.ChietKhauHang_Delete(MaChietKhau);
        //}
    }
}
