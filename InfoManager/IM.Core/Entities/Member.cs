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
            MemberSkills = new List<MemberSkill>();
        }
        public string Name { get; set; } = string.Empty;
        public long CountryId { get; set; }
        public string Resume { get; set; } = string.Empty;
        public DateTime DateOfBirth { get; set; }
        public Country Country { get; set; }

        public ICollection<MemberSkill> MemberSkills { get; set; }
    }
}
