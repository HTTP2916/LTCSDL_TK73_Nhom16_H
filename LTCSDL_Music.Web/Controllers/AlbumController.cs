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
    public class AlbumController : ControllerBase
    {
        public AlbumController()
        {
            _svc = new AlbumSvc();
        }
        [HttpPost("get-allAlbum")]
        public IActionResult getAllAlbum()
        {
            var res = new SingleRsp();
            res.Data = _svc.All;
            return Ok(res);
        }

        [HttpPost("get-by-MaAlbum")]
        public IActionResult getMusicByMaAlbum([FromBody]SimpleReq req)
        {
            var res = new SingleRsp();
            res = _svc.Read(req.Keyword);
            return Ok(res);
        }

        [HttpPost("SearchAlbum")]
        public IActionResult SearchAlbum([FromBody]SearchReq req)
        {
            var res = new SingleRsp();
            var pros = _svc.SearchAlbum(req.Keyword, req.Page, req.Size);
            res.Data = pros;
            return Ok(res);
        }

        [HttpPost("Delete-MaAlbum")]
        public IActionResult DeleteAlbum(AlbumDeleteReq req)
        {
            var res = _svc.DeleteAlbum(req.MaAB);
            return Ok(res);
        }

        [HttpPost("create-album")]
        public IActionResult CreateAlbum([FromBody] AlbumReq req)
        {
            var res = _svc.CreateAlbum(req);
            return Ok(res);
        }

        [HttpPost("update-album")]
        public IActionResult UpdateAlbum([FromBody] AlbumReq req)
        {
            var res = _svc.UpdateAlbum(req);
            return Ok(res);
        }
        private readonly AlbumSvc _svc;
    }
}