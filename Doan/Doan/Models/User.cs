namespace Doan.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("User")]
    public partial class User
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public User()
        {
            HoaDons = new HashSet<HoaDon>();
            NgayLams = new HashSet<NgayLam>();
            PhanHoiSuCoes = new HashSet<PhanHoiSuCo>();
        }

        [Key]
        [StringLength(10)]
        public string MaUser { get; set; }

        [StringLength(50)]
        public string TenUser { get; set; }

        [StringLength(50)]
        public string DiaChi { get; set; }

        [StringLength(15)]
        public string SDT { get; set; }

        public int PhanQuyen { get; set; }

        public string MatKhau { get; set; }

        [StringLength(50)]
        public string activate { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<HoaDon> HoaDons { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<NgayLam> NgayLams { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<PhanHoiSuCo> PhanHoiSuCoes { get; set; }
    }
}
