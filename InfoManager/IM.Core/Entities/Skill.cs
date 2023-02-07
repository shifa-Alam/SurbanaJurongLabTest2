using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace IM.Core.Entities
{
    public class Skill:BaseEntity
    {
        public string Name { get; set; }

        public ICollection<MemberSkill> MemberSkills { get; set; }
    }
}
