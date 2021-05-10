using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Model.EF;
using Model.DAO;
using PagedList;
using System.Web.Security;
using Model.ViewModel;
using System.Data.Entity.Migrations;
using System.Threading.Tasks;

namespace DoAnTotNghiepBanGiay.Controllers
{
    public class SanPhamController : Controller
    {

        DoanTNDataContext db = new DoanTNDataContext();
        //
        // GET: /SanPham/

        //public ActionResult Index(long id)
        //{
        //    SanPhamDAO pr = new SanPhamDAO();
        //    var model = pr.ChiTietByID(id);
        //    pr.ThemLuotView(id);
        //    //ViewBag.vb_relativeProduct = pr.relativeProduct(id);
        //    return View(model);
        //}



        [HttpGet]
        public ActionResult ChiTiet(long id)
        {
            SanPhamDAO pr = new SanPhamDAO();
            var model = pr.ChiTietByID(id);
            pr.ThemLuotView(id);
            ViewBag.vb_size = new CoDAO().ListSizeByIDProduct(id);
            ViewBag.vb_relative = new SanPhamDAO().SanPhamLienQuan(id);
            ViewBag.TaiKhoan = GetUser();

           var TaiKhoan = GetUser();
            if(TaiKhoan != null)
            {
                var rating = db.DANHGIASANPHAMs.SingleOrDefault(x => x.SanPhamId == id && x.TaiKhoanId == TaiKhoan.ID);
                if(rating != null)
                {
                    ViewBag.rate = rating.DanhGia;
                }

                var items = db.DANHGIASANPHAMs.Where(x => x.SanPhamId == id);
                if (items.Any())
                {
                    ViewBag.Quantity = items.Count();
                }
            }

            //ViewBag.vb_relativeProduct = pr.relativeProduct(id);
            return View(model);
        }

        [HttpPut]
        public async Task<ActionResult> RatingsProduct(long id, int rate)
        {
            var TaiKhoan = GetUser();
            if (TaiKhoan == null)
                return Json(new RatingViewModel() { IsSuccess = false, Message = "Bạn chưa đăng nhập!" }, JsonRequestBehavior.AllowGet);

            var sanPham = db.SANPHAMs.Find(id);
            if (sanPham == null)
                return Json(new RatingViewModel() { IsSuccess = false, Message = "Sản phẩm không tồn tại!" }, JsonRequestBehavior.AllowGet);

            var check = db.DANHGIASANPHAMs.SingleOrDefault(x => x.SanPhamId == id && x.TaiKhoanId == TaiKhoan.ID);
            if (check != null)
            {
                check.DanhGia = rate;
                db.DANHGIASANPHAMs.AddOrUpdate(check);
            }
            else
            {
                var rating = new DANHGIASANPHAM()
                {
                    DanhGia = rate,
                    SanPhamId = id,
                    TaiKhoanId = TaiKhoan.ID
                };
                db.DANHGIASANPHAMs.Add(rating);
            }

            //var items = db.DANHGIASANPHAMs.Where(x => x.SanPhamId == id).Average(x => x.DanhGia);
            //sanPham.DanhGia = items;
            //db.SANPHAMs.AddOrUpdate(sanPham);
            await db.SaveChangesAsync();
            return Json(new RatingViewModel() { IsSuccess = true, Message = "/SanPham/ChiTiet/" + id }, JsonRequestBehavior.AllowGet);

        }
        [HttpPut]
        public ActionResult  YeuThich(long id)
        {
            var taikhoan = GetUser();
            if (taikhoan == null)
                return Json(new RatingViewModel() { IsSuccess = false, Message = "Bạn chưa đăng nhập!" }, JsonRequestBehavior.AllowGet);
            else if (db.YeuThiches.FirstOrDefault(t => t.NguoiDungId == taikhoan.ID && t.SanPhamId == id) != null)
            {
                var removeItem = db.YeuThiches.FirstOrDefault(t => t.NguoiDungId == taikhoan.ID && t.SanPhamId == id);
                db.YeuThiches.Remove(removeItem);
            }
            else
            {
                db.YeuThiches.Add(new Model.EF.YeuThich()
                {
                    SanPhamId = id,
                    NguoiDungId = taikhoan.ID,
                    NgayThem = DateTime.Now
                });
            }
            db.SaveChanges();
            return Json(new RatingViewModel() { IsSuccess = true, Message = "/SanPham/ChiTiet/" + id }, JsonRequestBehavior.AllowGet);
        }

        public ActionResult DanhSachYeuThich()
        {
            var taikhoan = GetUser();
            if (taikhoan == null)
                return Json(new RatingViewModel() { IsSuccess = false, Message = "Bạn chưa đăng nhập!" }, JsonRequestBehavior.AllowGet);
            
            return View(db.YeuThiches.Where(t => t.NguoiDungId == taikhoan.ID).ToList());
        }

        public ActionResult DanhSachMuaHang()
        {
            var taikhoan = GetUser();
            if (taikhoan == null)
                return Json(new RatingViewModel() { IsSuccess = false, Message = "Bạn chưa đăng nhập!" }, JsonRequestBehavior.AllowGet);

            var list = from ctdh in db.CHITIETDONHANGs
                       from dh in db.DONHANGs
                       where dh.ID == ctdh.IDDonHang && dh.TaiKhoanId == taikhoan.ID
                       select ctdh;
            return View(list);
        }

        private TAIKHOAN GetUser()
        {
            var ticket = Request.Cookies[FormsAuthentication.FormsCookieName];
            if (ticket == null) return null;
            var authenTicket = FormsAuthentication.Decrypt(ticket.Value);
            TAIKHOAN UserRole = db.TAIKHOANs.Where(x => x.TenTaiKhoan == authenTicket.Name).FirstOrDefault();
            return UserRole;
        }
    }
}
