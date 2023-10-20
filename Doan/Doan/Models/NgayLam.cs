namespace Doan.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("NgayLam")]
    public partial class NgayLam
    {
        [Key]
        public int MaNL { get; set; }

        [Required]
        [StringLength(10)]
        public string MaCLV { get; set; }

        [Required]
        [StringLength(10)]
        public string MaUser { get; set; }

        [StringLength(50)]
        public string NgayLamViec { get; set; }

        public virtual CaLamViec CaLamViec { get; set; }

        public virtual User User { get; set; }
    }
}
