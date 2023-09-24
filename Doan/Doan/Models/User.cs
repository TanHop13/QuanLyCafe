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
            CaLamViecs = new HashSet<CaLamViec>();
            HoaDons = new HashSet<HoaDon>();
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

        public bool? PhanQuyen { get; set; }

        [StringLength(30)]
        public string MatKhau { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<CaLamViec> CaLamViecs { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<HoaDon> HoaDons { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<PhanHoiSuCo> PhanHoiSuCoes { get; set; }
    }
}
