using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;

namespace DoAnTotNghiepBanGiay.Areas.Admin.Models
{
    public class LoginModel
    {
        [Required(ErrorMessage = "Nhập tên tài khoản!")]
        public string username { set; get; }
        [Required(ErrorMessage = "Nhập mật khẩu!")]
        public string password { set; get; }
        public bool remember { set; get; }
    }
    public class UserRegister
    {
        [Required(ErrorMessage = "Nhập tên tài khoản!")]
        public string UserName { get; set; }
        [Required(ErrorMessage = "Nhập mật khẩu!")]
        public string Password { get; set; }

        [Required(ErrorMessage = "Nhập lại mật khẩu")]
        public string ConfimPassword { get; set; }

        [Required(ErrorMessage = "Nhập họ tên")]
        public string FullName { get; set; }
        public string Address { get; set; }
        [EmailAddress(ErrorMessage ="Không đúng định dạng email")]
        public string Email { get; set; }
        [Phone(ErrorMessage ="Không đúng định dạng số điện thoại")]
        public string PhoneNumber { get; set; }
    }
}