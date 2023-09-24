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
        [Key]
        [StringLength(10)]
        public string MaCLV { get; set; }

        [Column("CaLamViec")]
        [StringLength(50)]
        public string CaLamViec1 { get; set; }

        public TimeSpan? GioBD { get; set; }

        public TimeSpan? GioKT { get; set; }

        [Required]
        [StringLength(10)]
        public string MaUser { get; set; }

        public virtual User User { get; set; }
    }
}
