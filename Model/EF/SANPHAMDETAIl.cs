namespace Model.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("SANPHAMDETAIl")]
    public partial class SANPHAMDETAIl
    {
        [Key]
        public int IDDetail { get; set; }

        public int IDSanPham { get; set; }

        public int? Size { get; set; }

        public int? Count { get; set; }

        [StringLength(50)]
        public string Color { get; set; }

        [StringLength(6)]
        public string ColorCode { get; set; }
    }
}
