using System;
using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity;
using System.Linq;

namespace Model.EF
{
    public partial class DoanTNDataContext : DbContext
    {
        public DoanTNDataContext()
            : base("name=DoanTNDataContext")
        {
        }

        public virtual DbSet<CHITIETDONHANG> CHITIETDONHANGs { get; set; }
        public virtual DbSet<COGIAY> COGIAYs { get; set; }
        public virtual DbSet<DANHGIASANPHAM> DANHGIASANPHAMs { get; set; }
        public virtual DbSet<DANHMUCSANPHAM> DANHMUCSANPHAMs { get; set; }
        public virtual DbSet<DONHANG> DONHANGs { get; set; }
        public virtual DbSet<HANG> HANGs { get; set; }
        public virtual DbSet<LIENHE> LIENHEs { get; set; }
        public virtual DbSet<MENU> MENUs { get; set; }
        public virtual DbSet<SANPHAM> SANPHAMs { get; set; }
        public virtual DbSet<SANPHAMDETAIl> SANPHAMDETAIls { get; set; }
        public virtual DbSet<SLIDE> SLIDEs { get; set; }
        public virtual DbSet<TAIKHOAN> TAIKHOANs { get; set; }
        public virtual DbSet<YeuThich> YeuThiches { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<CHITIETDONHANG>()
                .Property(e => e.Gia)
                .HasPrecision(18, 0);

            modelBuilder.Entity<SANPHAM>()
                .Property(e => e.Code)
                .IsUnicode(false);

            modelBuilder.Entity<SANPHAM>()
                .Property(e => e.Gia)
                .HasPrecision(18, 0);

            modelBuilder.Entity<SANPHAM>()
                .Property(e => e.GiaKhuyenMai)
                .HasPrecision(18, 0);

            modelBuilder.Entity<SANPHAMDETAIl>()
                .Property(e => e.ColorCode)
                .IsFixedLength()
                .IsUnicode(false);
        }
    }
}
