using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Model.EF;
using PagedList;

namespace Model.DAO
{
    public class SliderDAO
    {
        DoanTNDataContext db = null;
        public SliderDAO()
        {
            db = new DoanTNDataContext();
        }

        public List<SLIDE> GetListActive()
        {
            return db.SLIDEs.Where(x => x.TrangThai == 2).OrderByDescending(x => x.ID).ToList();
        }

        public long AddSlide(SLIDE sl)
        {
            db.SLIDEs.Add(sl);
            db.SaveChanges();
            return sl.ID;
        }


        public IEnumerable<SLIDE> SlideDaDuyet(string searchString, int page, int pageSize)
        {
            IQueryable<SLIDE> model = db.SLIDEs.Where(x => x.TrangThai == 2);
            List<SLIDE> listodvm = new List<SLIDE>();
            if (!string.IsNullOrEmpty(searchString))
            {
                model = model.Where(x => x.TenSlide.Contains(searchString));
            }

            //return listodvm.OrderByDescending(x => x.orderID).ToPagedList(page, pageSize);
            return model.OrderByDescending(x => x.ID).ToPagedList(page, pageSize);
        }


        public IEnumerable<SLIDE> SlideChoDuyet(string searchString, int page, int pageSize)
        {
            IQueryable<SLIDE> model = db.SLIDEs.Where(x => x.TrangThai == 1);
            List<SLIDE> listodvm = new List<SLIDE>();
            if (!string.IsNullOrEmpty(searchString))
            {
                model = model.Where(x => x.TenSlide.Contains(searchString));
            }

            //return listodvm.OrderByDescending(x => x.orderID).ToPagedList(page, pageSize);
            return model.OrderByDescending(x => x.ID).ToPagedList(page, pageSize);
        }
        //Thay đổi trạng thái slide (QUẢN TRỊ)
        public void UpdateTrangThai(long id, int trangthai)
        {
            var pr1 = db.SLIDEs.SingleOrDefault(x => x.ID == id);
            pr1.TrangThai = trangthai;
            db.SaveChanges();
        }

        public void XoaSlide(long id, int trangthai)
        {
            var pr1 = db.SLIDEs.SingleOrDefault(x => x.ID == id);
            pr1.TrangThai = trangthai;
            db.SaveChanges();
        }


        public SLIDE GetValue(long id)
        {
            return db.SLIDEs.Find(id);
        }
    }
}
