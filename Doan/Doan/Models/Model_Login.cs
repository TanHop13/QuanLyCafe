using System;
using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity;
using System.Linq;

namespace Doan.Models
{
    public partial class Model_Login : DbContext
    {
        public Model_Login()
            : base("name=Model_Login")
        {
        }

        public virtual DbSet<CaLamViec> CaLamViecs { get; set; }
        public virtual DbSet<ChiTietHoaDon> ChiTietHoaDons { get; set; }
        public virtual DbSet<DD_HH> DD_HH { get; set; }
        public virtual DbSet<DoDung> DoDungs { get; set; }
        public virtual DbSet<HangHoa> HangHoas { get; set; }
        public virtual DbSet<HH_NCC> HH_NCC { get; set; }
        public virtual DbSet<HoaDon> HoaDons { get; set; }
        public virtual DbSet<KhachHang> KhachHangs { get; set; }
        public virtual DbSet<LoaiDoDung> LoaiDoDungs { get; set; }
        public virtual DbSet<LoaiKhachHang> LoaiKhachHangs { get; set; }
        public virtual DbSet<NhaCungCap> NhaCungCaps { get; set; }
        public virtual DbSet<PhanHoiSuCo> PhanHoiSuCoes { get; set; }
        public virtual DbSet<User> Users { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<DoDung>()
                .Property(e => e.Gia)
                .HasPrecision(19, 4);

            modelBuilder.Entity<DoDung>()
                .HasMany(e => e.DD_HH)
                .WithRequired(e => e.DoDung)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<HangHoa>()
                .Property(e => e.Gia)
                .HasPrecision(19, 4);

            modelBuilder.Entity<HangHoa>()
                .HasMany(e => e.DD_HH)
                .WithRequired(e => e.HangHoa)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<HangHoa>()
                .HasMany(e => e.HH_NCC)
                .WithRequired(e => e.HangHoa)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<HoaDon>()
                .Property(e => e.TongTien)
                .HasPrecision(19, 4);

            modelBuilder.Entity<KhachHang>()
                .Property(e => e.SDT)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<LoaiDoDung>()
                .HasMany(e => e.DoDungs)
                .WithOptional(e => e.LoaiDoDung)
                .HasForeignKey(e => e.MaLDD);

            modelBuilder.Entity<NhaCungCap>()
                .Property(e => e.SDT)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<NhaCungCap>()
                .HasMany(e => e.HH_NCC)
                .WithRequired(e => e.NhaCungCap)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<User>()
                .Property(e => e.SDT)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<User>()
                .HasMany(e => e.CaLamViecs)
                .WithRequired(e => e.User)
                .WillCascadeOnDelete(false);
        }
    }
}
