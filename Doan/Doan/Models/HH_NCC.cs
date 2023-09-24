namespace Doan.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class HH_NCC
    {
        [Key]
        [Column(Order = 0)]
        [StringLength(10)]
        public string MaHH { get; set; }

        [Key]
        [Column(Order = 1)]
        [StringLength(10)]
        public string MaNCC { get; set; }

        [Key]
        [Column(Order = 2)]
        [StringLength(10)]
        public string MaHH_NCC { get; set; }

        public int? SoLuong { get; set; }

        public virtual HangHoa HangHoa { get; set; }

        public virtual NhaCungCap NhaCungCap { get; set; }
    }
}
