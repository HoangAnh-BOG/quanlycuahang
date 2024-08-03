using QuanLi.Data.Controller;
using QuanLi.Data.Info;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QuanLi.Business
{
    public class CTHDXuatService
    {
        CTHDXuatDAL cmd = new CTHDXuatDAL();
        public List<CTHDXuat> CTHDXuat_GetByTop(string Top, string Where, string Order)
        {
            return cmd.CTHDXuat_GetByTop(Top, Where, Order);
        }
        public bool CTHDXuat_Insert(CTHDXuat data)
        {
            return cmd.CTHDXuat_Insert(data);
        }
    }
}
