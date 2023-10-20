namespace Doan.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("CaLamViec")]
    public partial class CaLamViec
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public CaLamViec()
        {
            NgayLams = new HashSet<NgayLam>();
        }

        [Key]
        [StringLength(10)]
        public string MaCLV { get; set; }

        [Column("CaLamViec")]
        [StringLength(50)]
        public string CaLamViec1 { get; set; }

        public TimeSpan? GioBD { get; set; }

        public TimeSpan? GioKT { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<NgayLam> NgayLams { get; set; }
    }
}
