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
    public class QuanTriVienSvc : GenericSvc<QuanTriVienRep, Quantrivien>
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
        public SingleRsp DeleteQuanTriVien(string Ma)
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

        public SingleRsp CreateQuantrivien(QuanTriVienReq admin)
        {
            var res = new SingleRsp();
            Quantrivien quantrivien = new Quantrivien();
            quantrivien.MaQuanTri = admin.MaQuanTri;
            quantrivien.TenQtv = admin.TenQtv;
            quantrivien.NgaySinh = admin.NgaySinh;
            quantrivien.GhiChu = admin.GhiChu;
            res = _rep.CreateQuantrivien(quantrivien);
            return res;
        }
        public SingleRsp UpdateQuantrivien(QuanTriVienReq admin)
        {
            var res = new SingleRsp();
            Quantrivien quantrivien = new Quantrivien();
            quantrivien.MaQuanTri = admin.MaQuanTri;
            quantrivien.TenQtv = admin.TenQtv;
            quantrivien.NgaySinh = admin.NgaySinh;
            quantrivien.GhiChu = admin.GhiChu;
            res = _rep.UpdateQuantrivien(quantrivien);
            return res;
        }

        public object SearchQuanTriVien(string keyword, int page, int size)
        {
            var QTV = All.Where(x => x.TenQtv.Contains(keyword));
            var offset = (page - 1) * size;
            var total = QTV.Count();
            int totalPage = (total % size) == 0 ? (int)(total / size) : (int)((total / size) + 1);
            var data = QTV.OrderBy(x => x.TenQtv).Skip(offset).Take(size).ToList();
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
