using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Model.EF;
using PagedList;


namespace Model.DAO
{
    public class LienHeDAO
    {

        DoanTNDataContext db = null;
        public LienHeDAO()
        {
            db = new DoanTNDataContext();
        }


        public LIENHE ViewByID(long id)
        {
            return db.LIENHEs.Find(id);
        }

        public long ThemLienHe(LIENHE cs)
        {
            db.LIENHEs.Add(cs);
            db.SaveChanges();
            return cs.ID;
        }

        public IEnumerable<LIENHE> ListAll(string searchString, int page, int pageSize, int trangthai = -1)
        {
            IQueryable<LIENHE> model = db.LIENHEs.Where(x => x.Status == trangthai);
            //List<SLIDE> listodvm = new List<SLIDE>();
            if (!string.IsNullOrEmpty(searchString))
            {
                model = model.Where(x => x.Name.Contains(searchString));
            }

            //return listodvm.OrderByDescending(x => x.orderID).ToPagedList(page, pageSize);
            return model.OrderByDescending(x => x.ID).ToPagedList(page, pageSize);
        }

        public void UpdateTrangThai(long id, int trangthai)
        {
            var pr1 = db.LIENHEs.SingleOrDefault(x => x.ID == id);
            pr1.Status = trangthai;
            db.SaveChanges();
        }
    }
}
