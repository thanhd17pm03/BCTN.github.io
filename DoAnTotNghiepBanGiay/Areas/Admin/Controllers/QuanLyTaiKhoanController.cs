using DoAnTotNghiepBanGiay.Common;
using Model.DAO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Model.EF;
using Model.DAO;
using System.Web.Mvc;

namespace DoAnTotNghiepBanGiay.Areas.Admin.Controllers
{
    [Authorize]
    public class QuanLyTaiKhoanController : BaseAdminController
    {
        //
        // GET: /Admin/QuanLyTaiKhoan/

        TaiKhoanDAO dao = new TaiKhoanDAO();

        long sesidtk = 0;
        public ActionResult Index(string searchString, int page = 1, int pageSize = 5)
        {

            //Lấy id của tài khoản hiện tại
            sesidtk = UserInfo.UserID;
            var model = dao.ListAllUser(searchString, page, pageSize, sesidtk);
            ViewBag.searchstring = searchString;
            return View(model);
        }

        //DANH SÁCH TÀI KHOẢN CHƯA DUYỆT
        [HttpGet]
        public ActionResult ListWaiting(string searchString, int page = 1, int pageSize = 5)
        {
            //Lấy id của tài khoản hiện tại
            sesidtk = UserInfo.UserID;
            var model = dao.ListAllUser(searchString, page, pageSize, sesidtk, 0);
            ViewBag.searchstring = searchString;
            return View(model);
        }

        //DANH SÁCH TÀI KHOẢN ĐÃ DUYỆT
        [HttpGet]
        public ActionResult ListApproval(string searchString, int page = 1, int pageSize = 5)
        {
            //Lấy id của tài khoản hiện tại
            sesidtk = UserInfo.UserID;
            var model = dao.ListAllUser(searchString, page, pageSize, sesidtk, 1);
            ViewBag.searchstring = searchString;
            return View(model);
        }
        //DANH SÁCH TÀI KHOẢN ĐÃ XÓA
        [HttpGet]
        public ActionResult ListLocked(string searchString, int page = 1, int pageSize = 5)
        {
            //Lấy id của tài khoản hiện tại
            sesidtk = UserInfo.UserID;
            var model = dao.ListAllUser(searchString, page, pageSize, sesidtk,-1);
            ViewBag.searchstring = searchString;
            return View(model);
        }

        [HttpGet]
        public ActionResult CreateAccount()
        {
            return View();
        }

        //Gửi thông tin về sever và chờ sử ý
        [HttpPost]
        public ActionResult CreateAccount(TAIKHOAN tk)
        {
            if (ModelState.IsValid)
            {

                if (dao.GetByUserName(tk.TenTaiKhoan) != null)
                {
                    SetAlert("Tài khoản đã tồn tại", "canhbao");
                    return RedirectToAction("CreateAccount");
                }
                else
                {
                    var passmd5 = Encryptor.MD5Hash(tk.MatKhau);
                    tk.MatKhau = passmd5;
                    tk.QuyenHan = 0;
                    tk.TrangThai = 0;
                    tk.NgayTao = DateTime.Now;
                    //tk.CreateBy = UserInfo.Username;

                    long id = dao.addAccount(tk);
                    if (id > 0)
                    {
                        return RedirectToAction("ListWaiting", "QuanLyTaiKhoan");
                    }
                    else
                    {
                        ModelState.AddModelError("", "Tạo tài khoản thất bại");
                    }
                }
            }
            return RedirectToAction("QuanLyTaiKhoan");
        }

        public ActionResult UpdateTrangThai(string username, int trangthai)
        {
            dao.updateTrangThai(username, trangthai);
            return View();
        }
    }
}
