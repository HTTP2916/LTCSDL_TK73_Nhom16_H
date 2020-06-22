using LTCSDL_Music.Common.BLL;
using LTCSDL_Music.Common.Req;
using LTCSDL_Music.Common.Rsp;
using LTCSDL_Music.DAL;
using LTCSDL_Music.DAL.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace LTCSDL_Music.BLL
{
    public class BaiHatSvc: GenericSvc<BaiHatRep, Baihat>
    {
        public override SingleRsp Read(string MaID)
        {
            var res = new SingleRsp();
            var m = _rep.Read(MaID);
            res.Data = m;
            return res;
        }
        //public override SingleRsp
        //Search BaiHat
        public object SearchBaiHat(string keyword, int page, int size)
        {
            var BH = All.Where(x => x.TenBaiHat.Contains(keyword));
            
            var offset = (page - 1) * size;
            var total = BH.Count();
            int totalPage = (total % size) == 0 ? (int)(total / size) : (int)((total / size) + 1);
            var data = _rep.SearchBaiHat(keyword, page, size);
            var table = BH.OrderBy(x => x.TenBaiHat).Skip(offset).Take(size).ToList();
            var res = new
            {
                Data = data,
                Table = table,
                totalRecord = total,
                TotalPage = totalPage,
                page = page,
                size = size
            };
            return res;
        }


        //public object SearchBaiHat(string Ten, int page, int size)
        //{

        //    return _rep.SearchBaiHat(Ten, page, size);
        //}
        // Remove 
        public SingleRsp DeleteBaiHat(string Ma)
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

        public SingleRsp CreateBaihat(BaihatReq song)
        {
            var res = new SingleRsp();
            Baihat baihat = new Baihat();
            baihat.MaBaiHat = song.MaBaiHat;
            baihat.MaCaSi = song.MaCaSi;
            baihat.MaTheLoai = song.MaTheLoai;
            baihat.TenBaiHat = song.TenBaiHat;
            baihat.QuocGia = song.QuocGia;
            baihat.FileLoiBaiHat = song.FileLoiBaiHat;
            baihat.LinkNhac = song.LinkNhac;
            baihat.NgayTao = song.NgayTao;
            baihat.NguoiTao = song.NguoiTao;
            baihat.NgayChinhSua = song.NgayChinhSua;
            baihat.NguoiChinhSua = song.NguoiChinhSua;
            baihat.GhiChu = song.GhiChu;
            res = _rep.CreateBaihat(baihat);
            return res;
        }

        public SingleRsp UpdateBaihat(BaihatReq song)
        {
            var res = new SingleRsp();
            Baihat baihat = new Baihat();
            baihat.MaBaiHat = song.MaBaiHat;
            baihat.MaCaSi = song.MaCaSi;
            baihat.MaTheLoai = song.MaTheLoai;
            baihat.TenBaiHat = song.TenBaiHat;
            baihat.QuocGia = song.QuocGia;
            baihat.FileLoiBaiHat = song.FileLoiBaiHat;
            baihat.LinkNhac = song.LinkNhac;
            baihat.NgayTao = song.NgayTao;
            baihat.NguoiTao = song.NguoiTao;
            baihat.NgayChinhSua = song.NgayChinhSua;
            baihat.NguoiChinhSua = song.NguoiChinhSua;
            baihat.GhiChu = song.GhiChu;
            res = _rep.UpdateBaihat(baihat);
            return res;
        }
    }
}
