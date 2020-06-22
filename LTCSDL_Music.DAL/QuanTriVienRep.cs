using System;
using System.Collections.Generic;
using System.Text;
using LTCSDL_Music.Common.DAL;
using System.Linq;

namespace LTCSDL_Music.DAL.Models
{
    using Common.Rsp;
    using Models;
    public class QuanTriVienRep : GenericRep<DBMusicContext, Quantrivien>
    {
        public override Quantrivien Read(String Ma)
        {
            var res = All.FirstOrDefault(b => b.MaQuanTri == Ma);
            return res;
        }
        public string Remove(string Ma)
        {
            var m = base.All.First(i => i.MaQuanTri == Ma);
            Context.Quantrivien.Remove(m);
            Context.SaveChanges();
            return m.MaQuanTri;
        }

        public SingleRsp CreateQuantrivien(Quantrivien admin)
        {
            var res = new SingleRsp();
            using (var context = new DBMusicContext())
            {
                using (var tran = context.Database.BeginTransaction())
                {
                    try
                    {
                        var t = context.Quantrivien.Add(admin);
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

        public SingleRsp UpdateQuantrivien(Quantrivien admin)
        {
            var res = new SingleRsp();
            using (var context = new DBMusicContext())
            {
                using (var tran = context.Database.BeginTransaction())
                {
                    try
                    {
                        var t = context.Quantrivien.Update(admin);
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