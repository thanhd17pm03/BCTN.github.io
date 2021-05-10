using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;
using Model.DAO;
using Model.EF;
using PagedList;


namespace DoAnTotNghiepBanGiay.Controllers
{
    public class HomeController : Controller
    {
        //
        // GET: /Home/
        DoanTNDataContext _db = new DoanTNDataContext();
        public ActionResult Index()
        {
            
            return View();
        }


        [ChildActionOnly]
        public ActionResult HomeSlider()
        {
            var model = new SliderDAO().GetListActive();
            return PartialView(model);
        }

        [ChildActionOnly]
        public ActionResult DanhMucSanPhamCha()
        {
            var model = new DanhMucSanPhamDAO().DanhMucSanPhamCha();
            return PartialView(model);
        }

        [ChildActionOnly]
        public ActionResult DanhMucSanPhamCon(long id)
        {
            var model = new DanhMucSanPhamDAO().DanhMucSanPhamCon(id);
            return PartialView(model);
        }

        [ChildActionOnly]
        public ActionResult SanPhamNoiBat()
        {
            var model = new SanPhamDAO().SanPhamNoiBat();
            return PartialView(model);
        }



        //DANH SÁCH 6 SẢN PHẨM MỚI (TRANG CHỦ)
        [ChildActionOnly]
        public ActionResult DanhSachSanPhamMoi()
        {
            var model = new SanPhamDAO().DanhSachSanPhamMoi();
            return PartialView(model);
        }
        //DANH SÁCH TẤT CẢ SẢN PHẨM MỚI
        public ActionResult DanhSachTatCaSanPhamMoi(int page = 1, int pageSize = 6)
        {
            var model = new SanPhamDAO().DanhSachTatCaSanPhamMoi(page, pageSize);
            return View(model);
        }


        [ChildActionOnly]
        public ActionResult Menu()
        {
            var model = new MenuDAO().ListMenu();
            var item = GetUserRole();
            ViewBag.TaiKhoan = item;
            return PartialView(model);
        }

        public ActionResult Logout()
        {
            FormsAuthentication.SignOut();
            return RedirectToAction("index");
        }

        private TAIKHOAN GetUserRole()
        {
            var ticket = Request.Cookies[FormsAuthentication.FormsCookieName];
            if (ticket == null) return null;
            var authenTicket = FormsAuthentication.Decrypt(ticket.Value);
            TAIKHOAN UserRole = _db.TAIKHOANs.Where(x => x.TenTaiKhoan == authenTicket.Name).FirstOrDefault();
            return UserRole;
        }


        //DANH SÁCH 6 SẢN PHẨM KHUYẾN MẠI (TRANG CHỦ)
        [ChildActionOnly]
        public ActionResult DanhSachSanPhamKhuyenMai()
        {
            var model = new SanPhamDAO().DanhSachSanPhamKhuyenMai();
            return PartialView(model);
        }





        //DANH SÁCH TẤT CẢ SẢN PHẨM KHUYẾN MẠI
        public ActionResult DanhSachTatCaSanPhamKhuyenMai(int page = 1, int pageSize = 6)
        {
            var model = new SanPhamDAO().DanhSachTatCaSanPhamKhuyenMai(page, pageSize);
            return View(model);
        }




    }
}
