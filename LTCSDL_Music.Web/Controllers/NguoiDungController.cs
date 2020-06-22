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
    public class NguoiDungController : ControllerBase
    {
        public NguoiDungController()
        {
            _svc = new NguoiDungSvc();
        }
        [HttpPost("get-by-MaNguoidung")]
        public IActionResult getNguoidungByMaNguoidung([FromBody] SimpleReq req)
        {
            var res = new SingleRsp();
            res = _svc.Read(req.Keyword);
            return Ok(res);
        }
        [HttpPost("SearchNguoiDung")]
        public IActionResult SearchNguoiDung([FromBody]SearchReq req)
        {
            var res = new SingleRsp();
            var pros = _svc.SearchNguoiDung(req.Keyword, req.Page, req.Size);
            res.Data = pros;
            return Ok(res);
        }
        [HttpPost("create-nguoidung")]
        public IActionResult CreateNguoidung([FromBody] NguoidungReq req)
        {
            var res = _svc.CreateNguoidung(req);
            return Ok(res);
        }
        [HttpPost("update-nguoidung")]
        public IActionResult UpdateNguoidung([FromBody] NguoidungReq req)
        {
            var res = _svc.UpdateNguoidung(req);
            return Ok(res);
        }
        [HttpPost("delete-nguoidung")]
        public IActionResult DeleteNguoidung([FromBody] NguoiDungDeleteReq req)
        {
            var res = _svc.DeleteNguoiDung(req.MaUser);
            return Ok(res);
        }
        private readonly NguoiDungSvc _svc;
    }
}