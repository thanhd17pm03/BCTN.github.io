using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Model.DAO;
using Model.EF;

namespace DoAnTotNghiepBanGiay.Controllers
{
    public class LienHeController : Controller
    {
        //
        // GET: /LienHe/
        LienHeDAO dao = new LienHeDAO();

        public ActionResult Index()
        {
            return View();
        }

        public ActionResult GuiThanhCong()
        {
            return View();
        }

        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Index(LIENHE fb)
        {
            if (ModelState.IsValid)
            {
                fb.DateCreate = DateTime.Now;
                fb.Status = 0;
                dao.ThemLienHe(fb);
                ViewBag._Scripts = "toastr.success('Gửi liên hệ thành công', 'Thông báo', { timeOut: 5000 });$('.big-text').val('');";
                fb = new LIENHE();
                return View(fb);
            }
            else
            {
                return View();
            }
        }

    }
}
