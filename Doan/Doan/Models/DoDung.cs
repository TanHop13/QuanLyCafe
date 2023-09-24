namespace Doan.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("DoDung")]
    public partial class DoDung
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public DoDung()
        {
            ChiTietHoaDons = new HashSet<ChiTietHoaDon>();
            DD_HH = new HashSet<DD_HH>();
        }

        [Key]
        [StringLength(10)]
        public string MaDD { get; set; }

        [StringLength(50)]
        public string TenDD { get; set; }

        [Column(TypeName = "money")]
        public decimal? Gia { get; set; }

        [StringLength(10)]
        public string MaLDD { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ChiTietHoaDon> ChiTietHoaDons { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<DD_HH> DD_HH { get; set; }

        public virtual LoaiDoDung LoaiDoDung { get; set; }
    }
}
