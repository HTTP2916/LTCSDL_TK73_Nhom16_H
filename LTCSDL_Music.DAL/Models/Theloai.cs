﻿using System;
using System.Collections.Generic;

namespace LTCSDL_Music.DAL.Models
{
    public partial class Theloai
    {
        public Theloai()
        {
            Baihat = new HashSet<Baihat>();
        }

        public string MaTheLoai { get; set; }
        public string TenTheLoai { get; set; }
        public string GhiChu { get; set; }

        public virtual ICollection<Baihat> Baihat { get; set; }
    }
}
