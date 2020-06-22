using System;
using System.Collections.Generic;
using System.Text;
using LTCSDL_Music.Common.DAL;
using System.Linq;

namespace LTCSDL_Music.DAL
{
    using LTCSDL_Music.Common.Rsp;
    using Microsoft.Data.SqlClient;
    using Microsoft.EntityFrameworkCore;
    using Models;
    using System.Data;

    public class BaiHatRep : GenericRep<DBMusicContext, Baihat>
    {
        #region
        public override Baihat Read(string MaID)
        {
            var res = All.FirstOrDefault(p => p.MaBaiHat == MaID);
            return res;
        }
        public string Remove(string MaBaiHat)
        {
            var m = base.All.First(i => i.MaBaiHat == MaBaiHat);
            Context.Baihat.Remove(m);
            Context.SaveChanges();
            return m.MaBaiHat;
        }
        public object SearchBaiHat(string Ten , int page, int size)
        {
            List<object> res = new List<object>();
            var cnn = (SqlConnection)Context.Database.GetDbConnection();
            if (cnn.State == System.Data.ConnectionState.Closed)
                cnn.Open();
            try
            {
                SqlDataAdapter da = new SqlDataAdapter();
                DataSet ds = new DataSet();
                var cmd = cnn.CreateCommand();
                cmd.CommandText = "SelSearchBaiHat";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Ten", Ten);
                cmd.Parameters.AddWithValue("@page", page);
                cmd.Parameters.AddWithValue("@size", size);
                da.SelectCommand = cmd;
                da.Fill(ds);
                if (ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
                {
                    foreach (DataRow row in ds.Tables[0].Rows)
                    {
                       
                        var x = new
                        {
                            STT = row["STT"],
                            TenBaiHat = row["Tên Bài Hát"],
                            QuocGia = row["Quốc Gia"],
                            TenCaSi = row["Ca Sĩ"],
                            TenTheLoai = row["Thể Loại"],
                            GhiChu = row["Ghi Chú"]
                        };
                        res.Add(x);
                    }
                }
            }
            catch (Exception e)
            {

            }
            
            return res;
        }
        //Tao bai hat moi
        public SingleRsp CreateBaihat(Baihat song)
        {
            var res = new SingleRsp();
            using (var context = new DBMusicContext())
            {
                using (var tran = context.Database.BeginTransaction())
                {
                    try
                    {
                        var t = context.Baihat.Add(song);
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

        //Cap nhat bai hat
        public SingleRsp UpdateBaihat(Baihat song)
        {
            var res = new SingleRsp();
            using (var context = new DBMusicContext())
            {
                using (var tran = context.Database.BeginTransaction())
                {
                    try
                    {
                        var t = context.Baihat.Update(song);
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
