using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using QuanLi.Data.Controller;
using QuanLi.Data.Info;

namespace QuanLi.Business
{
    public class TTinMatHangService
    {
        TTinMatHangDAL cmd = new TTinMatHangDAL();
        public List<TTinMatHang> TTinMatHang_GetByTop(string Top, string Where, string Order)
        {
            return cmd.TTinMatHang_GetByTop(Top, Where, Order);
        }
        public bool TTinMatHang_Insert(TTinMatHang data)
        {
            return cmd.TTinMatHang_Insert(data);
        }
        public bool TTinMatHang_UpDate(TTinMatHang data)
        {
            return cmd.TTinMatHang_Update(data);
        }
    }
}
