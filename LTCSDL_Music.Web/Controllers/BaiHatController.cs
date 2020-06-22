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
    public class BaiHatController : ControllerBase
    {
        public BaiHatController()
        {
            _svc = new BaiHatSvc();
        }

        [HttpPost("get-all-BaiHat")]
        public IActionResult getAllBaiHat()
        {
            var res = new SingleRsp();
            res.Data = _svc.All;
            return Ok(res);
        }
        [HttpPost("get-by-MaBaiHat")]
        public IActionResult getMusicByMaBaiHat([FromBody]SimpleReq req)
        {
            var res = new SingleRsp();
            res = _svc.Read(req.Keyword);
            return Ok(res);
        }

        //[HttpPost("SearchBaiHat")]
        //public IActionResult SearchBaiHat([FromBody]SearchReq req)
        //{
        //    var res = new SingleRsp();
        //    var pros = _svc.SearchBaiHat(req.Keyword, req.Page, req.Size);
        //    res.Data = pros;
        //    return Ok(res);
        //}
        [HttpPost("SearchBaiHat")]
        public IActionResult SelOrderInTime([FromBody] SearchReq req)
        {
            var res = new SingleRsp();
            res.Data = _svc.SearchBaiHat(req.Keyword, req.Page, req.Size);
            return Ok(res);
        }

        [HttpPost("create-baihat")]
        public IActionResult CreateBaihat([FromBody] BaihatReq req)
        {
            var res = _svc.CreateBaihat(req);
            return Ok(res);
        }

        [HttpPost("update-baihat")]
        public IActionResult UpdateBaihat([FromBody] BaihatReq req)
        {
            var res = _svc.UpdateBaihat(req);
            return Ok(res);
        }

        [HttpPost("Delete-MaBaiHat")]
        public IActionResult DeleteBaiHat(BaiHatDeleteReq req)
        {
            var res = _svc.DeleteBaiHat(req.MaBaiHat);
            return Ok(res);
        }
        private readonly BaiHatSvc _svc;
    }
}