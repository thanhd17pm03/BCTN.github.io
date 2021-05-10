using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Model.DAO;
using Model.EF;
using System.Web.Script.Serialization;
using DoAnTotNghiepBanGiay.Models;
using Newtonsoft.Json.Linq;
using MoMo;
using System.Web.Security;

namespace DoAnTotNghiepBanGiay.Controllers
{
    public class GioHangController : Controller
    {
        //
        DoanTNDataContext _db = new DoanTNDataContext();

        // GET: /GioHang/
        private const string CartSession = "CartSession";
        int sum = 0;

        public ActionResult Index()
        {
            int tongtien = 0;
            var cart = Session[CartSession];
            var list = new List<CartItem>();
            if (cart != null)
            {
                list = (List<CartItem>)cart;
            }
            foreach (var item1 in list)
            {
                //Kiểm tra nếu có giá khuyến mãi
                if (item1.Product.GiaKhuyenMai != null)
                {
                    tongtien = tongtien + (int.Parse(item1.Product.GiaKhuyenMai.Value.ToString()) * item1.Quantity);
                }
                else
                {
                    tongtien = tongtien + (int.Parse(item1.Product.Gia.Value.ToString()) * item1.Quantity);
                }

                //Lay tong so luong sp cua moi sp de ham js chay
            }
            ViewBag.vb_tongtien = tongtien;
            return View(list);
        }
        public ActionResult AddToCart()
        {
            long productid = long.Parse(Request.QueryString["idproduct"]);
            int quantity = int.Parse(Request.QueryString["soluong"]);
            int cogiay = int.Parse(Request.QueryString["size"]);
            var product = new SanPhamDAO().ChiTietByID(productid);
            var cart = Session[CartSession];

            //Đã có sản phẩm trong giỏ
            if (cart != null)
            {
                var list = (List<CartItem>)cart;
                //Đã có sản phẩm vừa thêm
                if (list.Exists(x => x.Product.ID == productid))
                {
                    //--------------------KIỂM TRA SẢN PHẨM CÙNG TÊN NHƯNG KHÁC CỠ
                    List<CartItem> ListCungSP = new List<CartItem>();
                    foreach (var item in list)
                    {
                        if (item.Product.ID == productid)
                        {
                            ListCungSP.Add(item);
                        }
                    }
                    if (!ListCungSP.Exists(x => x.CoGiay == cogiay))
                    {
                        var item1 = new CartItem();
                        item1.Quantity = quantity;
                        item1.CoGiay = cogiay;
                        item1.Product = product;
                        list.Add(item1);
                    }
                    //---------------------END KIỂM TRA SẢN PHẨM CÙNG TÊN NHƯNG KHÁC CỠ


                    //Với mỗi sản phẩm trong list đó, sẽ cập nhật lại số lượng
                    foreach (var item in list)
                    {
                        //Nếu đã có sản phẩm đó và cỡ đó rồi
                        if (item.Product.ID == product.ID && item.CoGiay == cogiay)
                        {
                            item.Quantity = quantity;
                        }
                    }


                }
                else
                //Chưa có sản phẩm vừa thêm
                {
                    var item = new CartItem();
                    item.Product = product;
                    item.Quantity = quantity;
                    item.CoGiay = cogiay;
                    //Gán vào session
                    list.Add(item);
                }

                Session[CartSession] = list;

            }
            else
            //Chưa có sản phẩm trong giở hàng
            {
                //Tạo đối tượng cart item
                var item = new CartItem();
                item.Product = product;
                item.Quantity = quantity;
                item.CoGiay = cogiay;
                var list = new List<CartItem>();
                //Gán vào session
                list.Add(item);
                Session[CartSession] = list;
            }
            return RedirectToAction("Index", "GioHang");
        }

        private TAIKHOAN GetUser()
        {
            var ticket = Request.Cookies[FormsAuthentication.FormsCookieName];
            if (ticket == null) return null;
            var authenTicket = FormsAuthentication.Decrypt(ticket.Value);
            TAIKHOAN UserRole = _db.TAIKHOANs.Where(x => x.TenTaiKhoan == authenTicket.Name).FirstOrDefault();
            return UserRole;
        }

        [HttpGet]
        public ActionResult ThongTinKhachHang()
        {
            ViewBag.user = GetUser();
            var cart = Session[CartSession];
            var list = new List<CartItem>();
            if (cart != null)
            {
                list = (List<CartItem>)cart;
            }
            return View(list);
        }

        [HttpPost]
        public ActionResult ThongTinKhachHang(string txtName, string txtPhone, string txtAddress, string txtEmail)
        {
            //Tạo và lấy thông tin của order
            var od = new DONHANG();
            DonHangDAO ODAO = new DonHangDAO();
            var user = GetUser();
            long idorder = 0;

            od.NgayTao = DateTime.Now;
            od.TenKhachHang = txtName;
            od.DiaChiKhachHang = txtAddress;
            od.DienThoaiKhachHang = txtPhone;
            od.EmailKhachHang = txtEmail;
            od.TinhTrang = 0;
            od.TaiKhoanId = user.ID;
            try
            {
                idorder = ODAO.Insert(od);
                //Thêm order vào chi tiết
                var list = (List<CartItem>)Session[CartSession]; ;
                if (list != null)
                {
                    foreach (var item in list)
                    {
                        CHITIETDONHANG od1 = new CHITIETDONHANG();
                        CoDAO ccc = new CoDAO();
                        od1.IDDonHang = idorder;
                        od1.IDCo = ccc.LayIDCoGiayTheoIDSPVaCo(item.Product.ID, item.CoGiay);
                        od1.SoLuong = item.Quantity;
                        od1.IDSP = item.Product.ID;
                        int giatien = 0;
                        if (item.Product.GiaKhuyenMai != null && item.Product.GiaKhuyenMai > 0)
                        {
                            giatien = (int.Parse(item.Product.GiaKhuyenMai.Value.ToString()) * item.Quantity);
                        }
                        else
                        {
                            giatien = (int.Parse(item.Product.Gia.Value.ToString()) * item.Quantity);
                        }
                        od1.Gia = giatien;
                        ChiTietDonHangDAO ODDAO = new ChiTietDonHangDAO();
                        ODDAO.Add(od1);
                    }
                }
            }
            catch (Exception)
            {
                throw;
            }
            return Redirect("/GioHang/XemLaiDonHang?idorder=" + idorder + "");
        }



        public JsonResult Update(string cartModel)
        {

            var jsonCart = new JavaScriptSerializer().Deserialize<List<CartItem>>(cartModel);
            var sessionCart = (List<CartItem>)Session[CartSession];

            foreach (var item in sessionCart)
            {

                var jsonItem = jsonCart.SingleOrDefault(x => x.Product.ID == item.Product.ID);
                if (jsonItem != null)
                {
                    item.Quantity = jsonItem.Quantity;
                }
            }

            Session[CartSession] = sessionCart;
            return Json(new
            {
                status = true
            });
        }


        public JsonResult DeleteAll()
        {

            Session[CartSession] = null;
            return Json(new
            {
                status = true
            });

        }


        public JsonResult Delete(long id)
        {

            var sessionCart = (List<CartItem>)Session[CartSession];
            sessionCart.RemoveAll(x => x.Product.ID == id);
            Session[CartSession] = sessionCart;
            return Json(new
            {
                status = true
            });

        }


        [HttpGet]
        public ActionResult XemLaiDonHang()
        {
            long idorder = long.Parse(Request.QueryString["idorder"]);
            int tongtien = 0;
            var odao = new DonHangDAO();
            var model = odao.ViewByID(idorder);
            ViewBag.vbCustomer = model;

            var cart = Session[CartSession];
            var list = new List<CartItem>();
            if (cart != null)
            {
                list = (List<CartItem>)cart;
            }

            foreach (var item1 in list)
            {
                //Kiểm tra nếu có giá khuyến mãi
                if (item1.Product.GiaKhuyenMai != null)
                {
                    tongtien = tongtien + (int.Parse(item1.Product.GiaKhuyenMai.Value.ToString()) * item1.Quantity);
                }
                else
                {
                    tongtien = tongtien + (int.Parse(item1.Product.Gia.Value.ToString()) * item1.Quantity);
                }

                //Lay tong so luong sp cua moi sp de ham js chay
            }
            ViewBag.vb_tongtien = tongtien;
            return View(list);
        }

        [HttpGet]
        public ActionResult ThanhCong()
        {
            var cart = Session[CartSession];
            var list = new List<CartItem>();
            if (cart != null)
            {
                list = (List<CartItem>)cart;
            }
            return View(list);
        }

        public ActionResult ThanhCong1()
        {
            Session.Abandon();
            return Redirect("/");
        }

        public ActionResult momo()
        {

            var taikHoan = GetUserRole();
            if (taikHoan == null) return RedirectToAction("Index", "Home");
            var cart = Session[CartSession];
            var list = new List<CartItem>();
            if (cart != null)
            {
                list = (List<CartItem>)cart;
            }

            decimal prices = 0;
            if(list.Count() > 0)
            {
                foreach(var item in list)
                {
                    if(item.Product.GiaKhuyenMai != null)
                    {
                        prices += item.Product.GiaKhuyenMai.Value;
                    }
                    else
                    {
                        prices += item.Product.Gia.Value;
                    }
                }
            }

            String maDH = Guid.NewGuid().ToString();
            String Endpoint = "https://test-payment.momo.vn/gw_payment/transactionProcessor";
            string endpoint = Endpoint.ToString().Equals("") ? "https://test-payment.momo.vn/gw_payment/transactionProcessor" : Endpoint.ToString();
            string partnerCode = "MOMO8FMY20210401";
            string accessKey = "TPw4ACUsbQwz4TjK";
            string serectkey = "JQL5Lw7u5Nf5GNVBGq0nmppYKMTO4hVc";
            string orderInfo = maDH;//"thong tin don hang tin";// chỗ này thông tin đơn hàng;
            string returnUrl = "https://localhost:44369/returnUrl";//"~/returnUrl.aspx";
            string notifyurl = "https://localhost:44369/notifyUrl";//"~/notifyUrl.aspx";

            string amount = prices.ToString(); //(string)ViewBag.vb_tongtien;   ;// sum.ToString();
            string orderid = maDH;
            string requestId = Guid.NewGuid().ToString();
            string extraData = "nhanpeo4619999@gmail.com";



            //Before sign HMAC SHA256 signature
            string rawHash = "partnerCode=" +
                partnerCode + "&accessKey=" +
                accessKey + "&requestId=" +
                requestId + "&amount=" +
                amount + "&orderId=" +
                orderid + "&orderInfo=" +
                orderInfo + "&returnUrl=" +
                returnUrl + "&notifyUrl=" +
                notifyurl + "&extraData=" +
                extraData;

            MoMoSecurity crypto = new MoMoSecurity();
            //sign signature SHA256
            string signature = crypto.signSHA256(rawHash, serectkey);

            //build body json request
            JObject message = new JObject
            {
                { "partnerCode", partnerCode },
                { "accessKey", accessKey },
                { "requestId", requestId },
                { "amount", amount },
                { "orderId", orderid },
                { "orderInfo", orderInfo },
                { "returnUrl", returnUrl },
                { "notifyUrl", notifyurl },
                { "extraData", extraData },
                { "requestType", "captureMoMoWallet" },
                { "signature", signature }
            };

            string responseFromMomo = PaymentRequest.sendPaymentRequest(endpoint, message.ToString());
            JObject jmessage = JObject.Parse(responseFromMomo);
            //  Response.Write(ViewBag.vb_tongtien.ToString());
            //  return Redirect("");
            return Redirect(jmessage.GetValue("payUrl").ToString());
        }

        private TAIKHOAN GetUserRole()
        {
            var ticket = Request.Cookies[FormsAuthentication.FormsCookieName];
            if (ticket == null) return null;
            var authenTicket = FormsAuthentication.Decrypt(ticket.Value);
            TAIKHOAN UserRole = _db.TAIKHOANs.Where(x => x.TenTaiKhoan == authenTicket.Name).FirstOrDefault();
            return UserRole;
        }
    }
}
