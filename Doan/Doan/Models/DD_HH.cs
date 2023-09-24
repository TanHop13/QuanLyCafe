namespace Doan.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class DD_HH
    {
        [Key]
        [Column(Order = 0)]
        [StringLength(10)]
        public string MaHH { get; set; }

        [Key]
        [Column(Order = 1)]
        [StringLength(10)]
        public string MaDD { get; set; }

        [Key]
        [Column(Order = 2)]
        [StringLength(10)]
        public string MaHH_DD { get; set; }

        public virtual DoDung DoDung { get; set; }

        public virtual HangHoa HangHoa { get; set; }
    }
}
