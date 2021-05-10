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
    public class QuanLySlideController : Controller
    {
        //
        // GET: /Admin/QuanLyTaiKhoan/

            SliderDAO dao = new SliderDAO();

        public ActionResult Index(string searchString, int page = 1, int pageSize = 5)
        {
            var model = dao.SlideDaDuyet(searchString, page, pageSize);
            ViewBag.searchstring = searchString;
            return View(model);
        }


        public ActionResult SlideChoDuyet(string searchString, int page = 1, int pageSize = 5)
        {
            var model = dao.SlideChoDuyet(searchString, page, pageSize);
            ViewBag.searchstring = searchString;
            return View(model);
        }

        [HttpGet]
        public ActionResult ThemSlide()
        {
            return View();
        }


        [HttpGet]
        public ActionResult CapNhatSlide(long id)
        {
            var pr = new SliderDAO().GetValue(id);
            ViewBag.vb_anhdaidien = pr.Anh;
            return View(pr);
        }


        [HttpPost]
        public ActionResult ThemSlide (SLIDE cs)
        {
            SLIDE ds = new SLIDE();
            ds.TenSlide = cs.TenSlide;
            ds.Metatitle = RewriteURL.RewriteUrl(cs.TenSlide);
            ds.NgayTao = DateTime.Now;
            ds.Anh = cs.Anh;
            ds.Link = cs.Link;
            ds.TrangThai = 1;
            ds.NgayTao = DateTime.Now;
            dao.AddSlide(ds);
            return RedirectToAction("SlideChoDuyet");
        }


        public ActionResult BoDuyet(long id)
        {
            dao.UpdateTrangThai(id, 1);
            return View();
        }

         public ActionResult XoaSlide(long id)
        {
            dao.UpdateTrangThai(id, -1);
            return View();
        }
        public ActionResult DuyetSlide(long id)
        {
            dao.UpdateTrangThai(id, 2);
            return View();
        }
    }
}
