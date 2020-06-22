using LTCSDL_Music.Common.DAL;
using LTCSDL_Music.Common.Rsp;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using LTCSDL_Music.DAL.Models;

namespace LTCSDL_Music.DAL
{
    public class AlbumRep : GenericRep<DBMusicContext, Album>
    {
        public override Album Read(string MaAB)
        {
            var res = All.FirstOrDefault(p => p.MaAb == MaAB);
            return res;
        }
        public string Remove(string MaAB)
        {
            var n = base.All.First(i => i.MaAb == MaAB);
            Context.Album.Remove(n);
            Context.SaveChanges();
            return n.MaAb;
        }

        public SingleRsp CreateAlbum(Album alb)
        {
            var res = new SingleRsp();
            using (var context = new DBMusicContext())
            {
                using (var tran = context.Database.BeginTransaction())
                {
                    try
                    {
                        var t = context.Album.Add(alb);
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

        public SingleRsp UpdateAlbum(Album alb)
        {
            var res = new SingleRsp();
            using (var context = new DBMusicContext())
            {
                using (var tran = context.Database.BeginTransaction())
                {
                    try
                    {
                        var t = context.Album.Update(alb);
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
