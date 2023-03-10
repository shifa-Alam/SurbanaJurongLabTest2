using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace IM.Core.Entities
{
    public class City : BaseEntity
    {
        public string Name { get; set; }
        public long CountryId { get; set; }
        public virtual Country Country { get; set; }
        public ICollection<Member> Members { get; set; }
    }
}
