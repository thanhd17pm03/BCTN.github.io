using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Model.EF;
using PagedList;

namespace Model.DAO
{
    public class TaiKhoanDAO
    {
        DoanTNDataContext db = null;

        public TaiKhoanDAO()
        {
            db = new DoanTNDataContext();
        }



        //Lấy thông tin tài khoản theo ID tài khoản
        public TAIKHOAN ViewDetailByID(long id)
        {
            return db.TAIKHOANs.Find(id);
        }

        //Thêm tài khoản
        public long addAccount(TAIKHOAN tk)
        {
            db.TAIKHOANs.Add(tk);
            db.SaveChanges();
            return tk.ID;
        }


        //Get infor Account by username
        public TAIKHOAN GetByUserName(string userName)
        {
            return db.TAIKHOANs.SingleOrDefault(u => u.TenTaiKhoan == userName);
        }

        public IEnumerable<TAIKHOAN> ListAllUser(string searchString, int page, int pageSize, long idtk, int trangthai = -1)
        {
            IQueryable<TAIKHOAN> model = db.TAIKHOANs.Where(x => x.ID != idtk);
            if (!string.IsNullOrEmpty(searchString))
            {
                model = model.Where(x => x.TenTaiKhoan.Contains(searchString) || x.HoTen.Contains(searchString));
            }
            return model.Where(x => x.TrangThai == trangthai).OrderByDescending(x => x.ID).ToPagedList(page, pageSize);
        }

        public bool updateTrangThai(string _username, int trangthai)
        {
            TAIKHOAN tk = new TAIKHOAN();
            tk = db.TAIKHOANs.SingleOrDefault(u => u.TenTaiKhoan == _username);
            if (tk != null)
            {
                tk.TrangThai = trangthai;
                db.SaveChanges();
            }
            else
                return false;
            return true;
        }
    }
}
