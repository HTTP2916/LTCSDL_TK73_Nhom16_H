using LTCSDL_Music.Common.DAL;
using LTCSDL_Music.Common.Rsp;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace LTCSDL_Music.DAL
{
    using Models;
    public class PlayListRep : GenericRep<DBMusicContext, Playlist>
    {
        public override Playlist Read(string MaPL)
        {
            var res = All.FirstOrDefault(p => p.MaPlayList == MaPL);
            return res;
        }
        public string Remove(string MaPL)
        {
            var m = base.All.First(i => i.MaPlayList == MaPL);
            Context.Playlist.Remove(m);
            Context.SaveChanges();
            return m.MaPlayList;
        }

        public SingleRsp CreatePlaylist(Playlist pl)
        {
            var res = new SingleRsp();
            using (var context = new DBMusicContext())
            {
                using (var tran = context.Database.BeginTransaction())
                {
                    try
                    {
                        var t = context.Playlist.Add(pl);
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

        public SingleRsp UpdatePlaylist(Playlist pl)
        {
            var res = new SingleRsp();
            using (var context = new DBMusicContext())
            {
                using (var tran = context.Database.BeginTransaction())
                {
                    try
                    {
                        var t = context.Playlist.Update(pl);
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
