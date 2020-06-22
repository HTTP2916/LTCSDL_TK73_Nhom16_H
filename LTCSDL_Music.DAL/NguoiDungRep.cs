using System;
using System.Collections.Generic;
using System.Text;
using LTCSDL_Music.Common.DAL;
using System.Linq;
using LTCSDL_Music.DAL;

namespace LTCSDL_Music.DAL.Models
{
    using LTCSDL_Music.Common.Rsp;
    using LTCSDL_Music.DAL.Models;
    using System.Xml.Linq;

    public class NguoiDungRep : GenericRep<DBMusicContext, Nguoidung>
    {
        public override Nguoidung Read(String Ma)
        {
            var res = All.FirstOrDefault(b => b.MaUser == Ma);
            return res;
        }
        public string Remove(string Ma)
        {
            var m = base.All.First(i => i.MaUser == Ma);
            Context.Nguoidung.Remove(m);
            Context.SaveChanges();
            return m.MaUser;
        }

        public SingleRsp CreateNguoidung(Nguoidung user)
        {
            var res = new SingleRsp();
            using (var context = new DBMusicContext())
            {
                using (var tran = context.Database.BeginTransaction())
                {
                    try
                    {
                        var t = context.Nguoidung.Add(user);
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

        public SingleRsp UpdateNguoidung(Nguoidung user)
        {
            var res = new SingleRsp();
            using (var context = new DBMusicContext())
            {
                using (var tran = context.Database.BeginTransaction())
                {
                    try
                    {
                        var t = context.Nguoidung.Update(user);
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