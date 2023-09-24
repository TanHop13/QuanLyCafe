namespace Doan.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("ChiTietHoaDon")]
    public partial class ChiTietHoaDon
    {
        [Key]
        [StringLength(10)]
        public string MaChiTiet { get; set; }

        public int? SoLuong { get; set; }

        [StringLength(10)]
        public string MaDD { get; set; }

        [StringLength(10)]
        public string MaHD { get; set; }

        public virtual DoDung DoDung { get; set; }

        public virtual HoaDon HoaDon { get; set; }
    }
}
