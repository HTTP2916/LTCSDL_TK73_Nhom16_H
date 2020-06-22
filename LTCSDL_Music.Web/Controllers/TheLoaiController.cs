using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using LTCSDL_Music.BLL;
using LTCSDL_Music.Common.Req;
using LTCSDL_Music.Common.Rsp;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace LTCSDL_Music.Web.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class TheLoaiController : ControllerBase
    {
        public TheLoaiController()
        {
            _svc = new TheLoaiSvc();
        }

        [HttpPost("get-by-MaTheLoai")]
        public IActionResult getMusicByMaTheLoai([FromBody]SimpleReq req)
        {
            var res = new SingleRsp();
            res = _svc.Read(req.Keyword);
            return Ok(res);
        }

        [HttpPost("SearchTheLoai")]
        public IActionResult SearchTheLoai([FromBody]SearchReq req)
        {
            var res = new SingleRsp();
            var pros = _svc.SearchTheLoai(req.Keyword, req.Page, req.Size);
            res.Data = pros;
            return Ok(res);
        }
        [HttpPost("create-theloai")]
        public IActionResult CreateTheloai([FromBody] TheLoaiReq req)
        {
            var res = _svc.CreateTheloai(req);
            return Ok(res);
        }
        [HttpPost("update-theloai")]
        public IActionResult UpdateTheloai([FromBody] TheLoaiReq req)
        {
            var res = _svc.UpdateTheloai(req);
            return Ok(res);
        }

        [HttpPost("Delete-MaTheLoai")]
        public IActionResult DeleteTheLoai([FromBody] TheLoaiDeleteReq req)
        {
            var res = _svc.DeleteTheLoai(req.MaTheLoai);
            return Ok(res);
        }
        private readonly TheLoaiSvc _svc;
    }
}