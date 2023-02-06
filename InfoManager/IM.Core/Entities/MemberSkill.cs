using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace IM.Core.Entities
{
    public class MemberSkill : BaseEntity
    {
        //public int MemberId { get; set; }
        //public int SkillId { get; set; }
        public virtual Member Member { get; set; }
        public virtual Skill Skill { get; set; }

    }
}
