namespace Doan.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("PhanHoiSuCo")]
    public partial class PhanHoiSuCo
    {
        [Key]
        [StringLength(10)]
        public string MaPH { get; set; }

        [StringLength(50)]
        public string MoTa { get; set; }

        [StringLength(10)]
        public string MaUser { get; set; }

        public virtual User User { get; set; }
    }
}
