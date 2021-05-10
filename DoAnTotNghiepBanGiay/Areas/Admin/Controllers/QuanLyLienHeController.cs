using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Model.DAO;
using Model.EF;
using DoAnTotNghiepBanGiay.Common;

namespace DoAnTotNghiepBanGiay.Areas.Admin.Controllers
{
    [Authorize]
    public class QuanLyLienHeController : Controller
    {
        //
        // GET: /Admin/QuanLyTaiKhoan/

            LienHeDAO dao = new LienHeDAO();

        //CHO DUET
        public ActionResult Index(string searchString, int page = 1, int pageSize = 5)
        {
            var model = dao.ListAll(searchString, page, pageSize, 0);
            ViewBag.searchstring = searchString;
            return View(model);
        }


        public ActionResult ListDaDuyet(string searchString, int page = 1, int pageSize = 5)
        {
            var model = dao.ListAll(searchString, page, pageSize,1);
            ViewBag.searchstring = searchString;
            return View(model);
        }

        public ActionResult ListDaHuyDuyet(string searchString, int page = 1, int pageSize = 5)
        {
            var model = dao.ListAll(searchString, page, pageSize, -1);
            ViewBag.searchstring = searchString;
            return View(model);
        }

       
        public ActionResult UpdateTrangThai(long id, int trangthai)
        {
            dao.UpdateTrangThai(id, trangthai);
            return View();
        }
    }
}
