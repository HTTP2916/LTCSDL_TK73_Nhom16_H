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
    public class PlayListController : ControllerBase
    {
        public PlayListController()
        {
            _svc = new PlayListSvc();
        }
        [HttpPost("get-by-MaPlayList")]
        public IActionResult getMusicByMaPlayList([FromBody]SimpleReq req)
        {
            var res = new SingleRsp();
            res = _svc.Read(req.Keyword);
            return Ok(res);
        }

        [HttpPost("SearchPlayList")]
        public IActionResult SearchPlayList([FromBody]SearchReq req)
        {
            var res = new SingleRsp();
            var pros = _svc.SearchPlayList(req.Keyword, req.Page, req.Size);
            res.Data = pros;
            return Ok(res);
        }

        [HttpPost("create-playlist")]
        public IActionResult CreatePlaylist([FromBody] PlaylistReq req)
        {
            var res = _svc.CreatePlaylist(req);
            return Ok(res);
        }
        [HttpPost("update-playlist")]
        public IActionResult UpdatePlaylist([FromBody] PlaylistReq req)
        {
            var res = _svc.UpdatePlaylist(req);
            return Ok(res);
        }

        [HttpPost("Delete-MaPlayList")]
        public IActionResult DeletePlayList([FromBody] PlayListDeleteReq req)
        {
            var res = _svc.DeletePlaylist(req.MaPlayList);
            return Ok(res);
        }
        private readonly PlayListSvc _svc;
    }
}