using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Model.DAO;
using DoAnTotNghiepBanGiay.Areas.Admin.Models;
using DoAnTotNghiepBanGiay.Common;
using Model.ViewModel;
using Model.EF;
using Helpers;
using System.Web.Security;
using System.Threading.Tasks;

namespace DoAnTotNghiepBanGiay.Areas.Admin.Controllers
{
    public class LoginController : Controller
    {
        DoanTNDataContext _db = new DoanTNDataContext();
        public ActionResult Index()
        {
            //var sesU = (UserInfoPublic)Session[CommonConstant.USER_SESSION];
            //if (sesU != null)
            //{
            //    return RedirectToAction("Index", "HomeAdmin");
            //}
            return View();
        }


        //public ActionResult Login(LoginModel model)
        //{
        //    if (ModelState.IsValid)
        //    {
        //        var dao = new AccountDAO();
        //        int result = dao.loginAccount(model.username, Encryptor.MD5Hash(model.password));
        //        switch (result)
        //        {
        //            //Đăng nhập quyền nhân viên (xem danh sách)
        //            case 11:
        //                {
        //                    var user = dao.GetByUserName(model.username);
        //                    var userSession = new UserInfoPublic();
        //                    userSession.Username = user.TenTaiKhoan;
        //                    userSession.UserID = user.ID;
        //                    userSession.Permision = user.QuyenHan;

        //                    UserInfo.UserID = user.ID;
        //                    UserInfo.Username = user.TenTaiKhoan;
        //                    UserInfo.Permision = user.QuyenHan;


        //                    Session.Add(Common.CommonConstant.USER_SESSION, userSession);
        //                    return RedirectToAction("Index", "HomeAdmin");
        //                    break;
        //                }
        //            //Đăng nhập quyền nhân viên (Thêm sửa xóa)
        //            case 12:
        //                {
        //                    var user = dao.GetByUserName(model.username);
        //                    var userSession = new UserInfoPublic();
        //                    userSession.Username = user.TenTaiKhoan;
        //                    userSession.UserID = user.ID;
        //                    userSession.Permision = user.QuyenHan;

        //                    UserInfo.UserID = user.ID;
        //                    UserInfo.Username = user.TenTaiKhoan;
        //                    UserInfo.Permision = user.QuyenHan;
        //                    Session.Add(Common.CommonConstant.USER_SESSION, userSession);
        //                    return RedirectToAction("Index", "HomeAdmin");
        //                    break;
        //                }

        //            case 0:
        //                {
        //                    ModelState.AddModelError("", "Tài khoản không có quyền truy cập!");
        //                    break;
        //                }



        //            //Đăng nhập trường hợp tài khoản bị khóa
        //            case -1:
        //                {
        //                    ModelState.AddModelError("", "Tài khoản này đã bị khóa!");
        //                    break;

        //                }

        //            //Đăng nhập trường hợp sai mật khẩu
        //            case -10:
        //                {
        //                    ModelState.AddModelError("", "Mật khẩu không đúng!");
        //                    break;
        //                }

        //            //Đăng nhập trường hợp sai tên tài khoản
        //            case -11:
        //                {
        //                    ModelState.AddModelError("", "Tài khoản không tồn tại.");
        //                    break;
        //                }
        //        }

        //    }
        //    return View("Index");
        //}

        
        [HttpPost]
        public ActionResult Login(LoginModel user)
        {
            if (ModelState.IsValid)
            {
                var res = _db.TAIKHOANs.FirstOrDefault(x => x.TenTaiKhoan == user.username);
                if (res == null)
                {
                    ModelState.AddModelError("", @"Sai tài khoản");
                    return View("Index",user);
                }
                if (res.TrangThai == -1)
                {
                    ModelState.AddModelError("", @"Tài khoản của bạn đã bị khóa!!");
                    return View("Index", user);
                }
                if (!HtmlHelpers.VerifyHash(user.password, "SHA256", res.MatKhau))
                {
                    ModelState.AddModelError("", @"Mật khẩu không chính xác.");
                    return View("Index",user);
                }
                FormsAuthentication.SetAuthCookie(user.username, true);
                if(user.username.ToUpper() == "ADMIN")
                {
                    return Content("<script>alert('Xin chào  " + res.HoTen + "');window.location.href = '/admin/homeAdmin';</script>");
                }
                return Content("<script>alert('Xin chào  "+ res.HoTen +"');window.location.href = '/';</script>");
            }
            return View("index", user);
        }


        [HttpGet]
        public ActionResult Register()
        {
            
            return View();
        }

        [HttpPost]
        public async Task<ActionResult> Register(UserRegister user)
        {
            if (ModelState.IsValid)
            {
                if (user.Password != user.ConfimPassword)
                {
                    ModelState.AddModelError("", @"Mật khẩu xác nhận không khớp nhau");
                    return View(user);
                }
                var check = _db.TAIKHOANs.FirstOrDefault(x => x.TenTaiKhoan.ToUpper() == user.UserName.ToUpper());
                if(check != null)
                {
                    ModelState.AddModelError("", @"Tài khoản đã tồn tại");
                    return View(user);
                }
                var TaiKhoan = new TAIKHOAN()
                {
                    TenTaiKhoan = user.UserName,
                    MatKhau = HtmlHelpers.ComputeHash(user.Password, "SHA256", null),
                    HoTen = user.FullName,
                    DiaChi = user.Address,
                    Email = user.Email,
                    NgayTao = DateTime.Now,
                    SoDienThoai = user.PhoneNumber,
                    TrangThai = 1
                };
                _db.TAIKHOANs.Add(TaiKhoan);
                await _db.SaveChangesAsync();
                return RedirectToAction("Index");
            }

            return View(user);
        }

        public ActionResult LogoutAdmin()
        {
            Session.Abandon();
            UserInfo.UserID = 0;
            UserInfo.Username = "";
            UserInfo.Permision = null;
            FormsAuthentication.SignOut();
            return RedirectToAction("Index", "Login");

        }

    }
}
