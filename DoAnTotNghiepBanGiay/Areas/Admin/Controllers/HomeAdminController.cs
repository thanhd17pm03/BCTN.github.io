using Model.ViewModel;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace DoAnTotNghiepBanGiay.Areas.Admin.Controllers
{
    [Authorize]
    public class HomeAdminController : Controller
    {
        private string connectString = ConfigurationManager.ConnectionStrings["DoanTNDataContext"].ToString();
        public ActionResult Index()
        {
            var model = ThongKeDoanhThu();
            return View(model);
        }
        ThongKeDoanhThuViewModel ThongKeDoanhThu()
        {
            var data = SelectRows("EXEC sp_DonHang_ThongKeDoanhThuTheoThang");
            string thoiGian = "";
            string soLuong = "";
            string thanhTien = "";
            
            foreach (DataRow dr in data.Rows)
            {
                thoiGian += DateTime.Parse(dr["ThoiGian"].ToString()).ToString("MM/yyyy") + ",";
                soLuong += dr["SoLuongSanPham"].ToString() +",";
                thanhTien += dr["ThanhTien"].ToString() + ",";
            }
            var item = new ThongKeDoanhThuViewModel()
            {
                SoLuong = soLuong.Substring(0, soLuong.Length -1),
                ThoiGian = thoiGian.Substring(0, thoiGian.Length - 1),
                ThanhTien = thanhTien.Substring(0, thanhTien.Length - 1)
            };
            return item;
        }
        private DataTable SelectRows(string queryString)
        {
            using (SqlConnection connection = new SqlConnection(this.connectString))
            {
                DataTable dataset = new DataTable();
                SqlDataAdapter adapter = new SqlDataAdapter();
                adapter.SelectCommand = new SqlCommand(queryString, connection);
                adapter.Fill(dataset);
                return dataset;
            }
        }
    }
}
