using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace IM.Core.Entities
{
    public class Member : BaseEntity
    {
        public Member()
        {
            Skills = new List<MemberSkill>();
        }
        public string Name { get; set; } = string.Empty;
        //public int CountryId { get; set; }
        //public int CityId { get; set; }
        public string Resume { get; set; } = string.Empty;
        public DateTime DateOfBirth { get; set; }

        //public virtual Country Country { get; set; }
        //public virtual City City { get; set; }
        public virtual List<MemberSkill> Skills { get; set; }
    }
}
