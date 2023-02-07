using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace IM.Core.Entities
{
    public class Country:BaseEntity
    {
        public string Name { get; set; }
        public ICollection<City> Cities { get; set; }
        public ICollection<Member> Members { get; set; }
    }
}
