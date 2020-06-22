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
    public class QuanTriVienController : ControllerBase
    {
        public QuanTriVienController()
        {
            _svc = new QuanTriVienSvc();
        }
        [HttpPost("get-by-MaQuantrivien")]
        public IActionResult getQuantriviencByMaQuantri([FromBody] SimpleReq req)
        {
            var res = new SingleRsp();
            res = _svc.Read(req.Keyword);
            return Ok(res);
        }
        [HttpPost("SearchQuanTriVien")]
        public IActionResult SearchNguoiDung([FromBody]SearchReq req)
        {
            var res = new SingleRsp();
            var pros = _svc.SearchQuanTriVien(req.Keyword, req.Page, req.Size);
            res.Data = pros;
            return Ok(res);
        }
        [HttpPost("create-quantrivien")]
        public IActionResult CreateQuantrivien([FromBody] QuanTriVienReq req)
        {
            var res = _svc.CreateQuantrivien(req);
            return Ok(res);
        }
        [HttpPost("update-quantrivien")]
        public IActionResult UpdateQuantrivien([FromBody] QuanTriVienReq req)
        {
            var res = _svc.UpdateQuantrivien(req);
            return Ok(res);
        }
        [HttpPost("delete-quantrivien")]
        public IActionResult DeleteQuantrivien([FromBody] QuanTriVienDeleteReq req)
        {
            var res = _svc.DeleteQuanTriVien(req.MaQuanTriVien);
            return Ok(res);
        }
        private readonly QuanTriVienSvc _svc;
    }
}