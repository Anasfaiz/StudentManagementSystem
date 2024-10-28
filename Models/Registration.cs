namespace StudentManagementSystem.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Registration")]
    public partial class Registration
    {
        public int id { get; set; }

        [StringLength(50)]
        public string FirstName { get; set; }

        [StringLength(50)]
        public string MiddleName { get; set; }

        [StringLength(50)]
        public string LastName { get; set; }

        public int? Course_id { get; set; }

        public int? Batch_id { get; set; }

        [Column("Mobile no.")]
        public int? Mobile_no_ { get; set; }

        public virtual Batch Batch { get; set; }

        public virtual Course Course { get; set; }
    }
}
