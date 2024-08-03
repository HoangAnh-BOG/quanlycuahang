using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using QuanLi.Data.Controller;
using QuanLi.Data.Info;

namespace QuanLi.Business
{
    public class TTHangService
    {
        TTHangDAL cmd = new TTHangDAL();
        public List<TTHang> TTHang_GetByTop(string Top, string Where, string Order)
        {
            return cmd.TTHang_GetByTop(Top, Where, Order);
        }
        public bool TTHang_Insert(TTHang data)
        {
            return cmd.TTHang_Insert(data);
        }
        public bool TTHang_UpDate(TTHang data)
        {
            return cmd.TTHang_Update(data);
        }
    }
}
