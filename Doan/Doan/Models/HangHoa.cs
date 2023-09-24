namespace Doan.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("HangHoa")]
    public partial class HangHoa
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public HangHoa()
        {
            DD_HH = new HashSet<DD_HH>();
            HH_NCC = new HashSet<HH_NCC>();
        }

        [Key]
        [StringLength(10)]
        public string MaHH { get; set; }

        [StringLength(50)]
        public string TenHH { get; set; }

        [Column(TypeName = "money")]
        public decimal? Gia { get; set; }

        [StringLength(20)]
        public string DonViTinh { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<DD_HH> DD_HH { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<HH_NCC> HH_NCC { get; set; }
    }
}
