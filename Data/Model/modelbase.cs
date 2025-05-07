using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Data.Model
{
    public abstract class modelbase
    {
        [Key]
        [Required]
        public int id { get; set; }
        
    }
}
