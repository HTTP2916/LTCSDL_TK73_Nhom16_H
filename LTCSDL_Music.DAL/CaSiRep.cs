using LTCSDL_Music.Common.DAL;
using LTCSDL_Music.Common.Rsp;
using LTCSDL_Music.DAL.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace LTCSDL_Music.DAL
{
    public class CaSiRep : GenericRep<DBMusicContext, Casi>
    {
        #region
        public override Casi Read(string MaCaSi)
        {
            var res = All.FirstOrDefault(p => p.MaCaSi == MaCaSi);
            return res;
        }
        public string Remove(string MaCaSi)
        {
            var n = base.All.First(i => i.MaCaSi == MaCaSi);
            Context.Casi.Remove(n);
            Context.SaveChanges();
            return n.MaCaSi;
        }

        //Tao ca si moi
        public SingleRsp CreateCasi(Casi singer)
        {
            var res = new SingleRsp();
            using (var context = new DBMusicContext())
            {
                using (var tran = context.Database.BeginTransaction())
                {
                    try
                    {
                        var t = context.Casi.Add(singer);
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

        //Cap nhat ca si
        public SingleRsp UpdateCasi(Casi singer)
        {
            var res = new SingleRsp();
            using (var context = new DBMusicContext())
            {
                using (var tran = context.Database.BeginTransaction())
                {
                    try
                    {
                        var t = context.Casi.Update(singer);
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

        #endregion
    }
}
