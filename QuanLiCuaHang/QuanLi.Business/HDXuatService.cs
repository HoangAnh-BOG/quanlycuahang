using QuanLi.Data.Controller;
using QuanLi.Data.Info;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QuanLi.Business
{
    public class HDXuatService
    {
        HDXuatDAL cmd = new HDXuatDAL();
        public List<HDXuat> HDXuat_GetByTop(string Top, string Where, string Order)
        {
            return cmd.HDXuat_GetByTop(Top, Where, Order);
        }
        public bool HDXuat_Insert(HDXuat data)
        {
            return cmd.HDXuat_Insert(data);
        }
        public bool HDXuat_UpDate(HDXuat data)
        {
            return cmd.HDXuat_Update(data);
        }
        public bool HDXuat_Delete(string MaHDXuat)
        {
            return cmd.HDXuat_Delete(MaHDXuat);
        }
    }
}
