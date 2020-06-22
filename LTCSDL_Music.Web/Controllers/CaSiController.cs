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
    public class CaSiController : ControllerBase
    {
       
        public CaSiController()
        {
            _svc = new CaSiSvc();
        }
        [HttpPost("get-by-MaCaSi")]
        public IActionResult getMusicByMaCaSi([FromBody]SimpleReq req)
        {
            var res = new SingleRsp();
            res = _svc.Read(req.Keyword);
            return Ok(res);
        }

        [HttpPost("SearchCaSi")]
        public IActionResult SearchCaSi([FromBody]SearchReq req)
        {
            var res = new SingleRsp();
            var pros = _svc.SearchCaSi(req.Keyword, req.Page, req.Size);
            res.Data = pros;
            return Ok(res);
        }

        [HttpPost("create-casi")]
        public IActionResult CreateCasi([FromBody] CasiReq req)
        {
            var res = _svc.CreateCasi(req);
            return Ok(res);
        }
        [HttpPost("update-casi")]
        public IActionResult UpdateCasi([FromBody] CasiReq req)
        {
            var res = _svc.UpdateCasi(req);
            return Ok(res);
        }

        [HttpPost("Delete-MaCaSi")]
        public IActionResult DeleteCasi(CaSiDeleteReq req)
        {
            var res = _svc.DeleteCasi(req.MaCaSi);
            return Ok(res);
        }
        private readonly CaSiSvc _svc;
    }
    
}