using LTCSDL_Music.Common.BLL;
using LTCSDL_Music.Common.Req;
using LTCSDL_Music.Common.Rsp;
using LTCSDL_Music.DAL.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace LTCSDL_Music.BLL
{
    public class NguoiDungSvc: GenericSvc<NguoiDungRep, Nguoidung>
    {
        public override SingleRsp Read(string Ma)
        {
            var res = new SingleRsp();
            var m = _rep.Read(Ma);
            res.Data = m;
            return res;
        }
        //public override SingleRsp 

        // Remove 
        public SingleRsp DeleteNguoiDung(string Ma)
        {
            var res = new SingleRsp();
            try
            {
                res.Data = _rep.Remove(Ma);
            }
            catch (Exception ex)
            {
                res.SetError(ex.StackTrace);
            }
            return res;
        }

        public SingleRsp CreateNguoidung(NguoidungReq user)
        {
            var res = new SingleRsp();
            Nguoidung nguoidung = new Nguoidung();
            nguoidung.MaUser = user.MaUser;
            nguoidung.TenUser = user.TenUser;
            nguoidung.MatKhau = user.MatKhau;
            nguoidung.NgaySinh = user.NgaySinh;
            nguoidung.GioiTinh = user.GioiTinh;
            nguoidung.GhiChu = user.GhiChu;
            res = _rep.CreateNguoidung(nguoidung);
            return res;
        }
        public SingleRsp UpdateNguoidung(NguoidungReq user)
        {
            var res = new SingleRsp();
            Nguoidung nguoidung = new Nguoidung();
            nguoidung.MaUser = user.MaUser;
            nguoidung.TenUser = user.TenUser;
            nguoidung.MatKhau = user.MatKhau;
            nguoidung.NgaySinh = user.NgaySinh;
            nguoidung.GioiTinh = user.GioiTinh;
            nguoidung.GhiChu = user.GhiChu;
            res = _rep.UpdateNguoidung(nguoidung);
            return res;
        }
        public object SearchNguoiDung(string keyword, int page, int size)
        {
            var ND = All.Where(x => x.TenUser.Contains(keyword));
            var offset = (page - 1) * size;
            var total = ND.Count();
            int totalPage = (total % size) == 0 ? (int)(total / size) : (int)((total / size) + 1);
            var data = ND.OrderBy(x => x.TenUser).Skip(offset).Take(size).ToList();
            var res = new
            {
                Data = data,
                totalRecord = total,
                TotalPage = totalPage,
                page = page,
                size = size
            };
            return res;
        }
    }
}
