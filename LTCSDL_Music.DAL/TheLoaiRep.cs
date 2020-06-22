using LTCSDL_Music.Common.DAL;
using LTCSDL_Music.Common.Rsp;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
namespace LTCSDL_Music.DAL
{
    using Models;
    public class TheLoaiRep : GenericRep<DBMusicContext, Theloai>
    {
        public override Theloai Read(string MaTL)
        {
            var res = All.FirstOrDefault(p => p.MaTheLoai == MaTL);
            return res;
        }
        public string Remove(string MaTL)
        {
            var m = base.All.First(i => i.MaTheLoai == MaTL);
            Context.Theloai.Remove(m);
            Context.SaveChanges();
            return m.MaTheLoai;
        }

        public SingleRsp CreateTheloai(Theloai category)
        {
            var res = new SingleRsp();
            using (var context = new DBMusicContext())
            {
                using (var tran = context.Database.BeginTransaction())
                {
                    try
                    {
                        var t = context.Theloai.Add(category);
                        context.SaveChanges();
                        tran.Commit();

                    }
                    catch (Exception ex)
                    {
                        tran.Rollback();
                        res.SetError(ex.StackTrace);
                    }
                }
            }
            return res;
        }

        public SingleRsp UpdateTheloai(Theloai category)
        {
            var res = new SingleRsp();
            using (var context = new DBMusicContext())
            {
                using (var tran = context.Database.BeginTransaction())
                {
                    try
                    {
                        var t = context.Theloai.Update(category);
                        context.SaveChanges();
                        tran.Commit();

                    }
                    catch (Exception ex)
                    {
                        tran.Rollback();
                        res.SetError(ex.StackTrace);
                    }
                }
            }
            return res;
        }
    }
}
