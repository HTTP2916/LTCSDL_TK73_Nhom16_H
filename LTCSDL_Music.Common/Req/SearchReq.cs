﻿using System;
using System.Collections.Generic;
using System.Text;

namespace LTCSDL_Music.Common.Req
{
    public class SearchReq
    {
        public int Page { get; set; }
        public int Size { get; set; }
        public string Keyword { get; set; }
    }
}