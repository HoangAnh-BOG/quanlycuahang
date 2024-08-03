using QuanLi.Data.Controller;
using QuanLi.Data.Info;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QuanLi.Business
{
    public class HDNhapService
    {
        HDNhapDAL cmd = new HDNhapDAL();
        public List<HDNhap> HDNhap_GetByTop(string Top, string Where, string Order)
        {
            return cmd.HDNhap_GetByTop(Top, Where, Order);
        }
        public bool HDNhap_Insert(HDNhap data)
        {
            return cmd.HDNhap_Insert(data);
        }
        public bool HDNhap_UpDate(HDNhap data)
        {
            return cmd.HDNhap_Update(data);
        }
        public bool HDNhap_Delete(string MaHDNhap)
        {
            return cmd.HDNhap_Delete(MaHDNhap);
        }
    }
}
