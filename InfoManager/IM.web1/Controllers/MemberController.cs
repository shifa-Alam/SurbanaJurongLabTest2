
using IM.Core.Entities;
using IM.Core.Models.InputModel;
using IM.Core.Services;
using Microsoft.AspNetCore.Mvc;


namespace IM.web1.Controllers
{
    [ApiController]
    [Route("[controller]")]

    public class MemberController : BaseController
    {
        private readonly IMemberService _memberService;
        private readonly ISkillService _skillService;



        public MemberController(IMemberService memberService, ISkillService skillService)
        {

            _memberService = memberService;
            _skillService = skillService;

        }



        [HttpPost]
        [Route("SaveMember")]
        public IActionResult SaveMember(MemberInputModel memberIn)
        {

            //var mappedData = _mapper.Map<Member>(memberIn);

            //_memberService.Save(mappedData);
            var member = new Member
            {
                Name = memberIn.Name,
                //CountryId = memberIn.CountryId,
                //CityId = memberIn.CityId,
                DateOfBirth = memberIn.DateOfBirth,
                //Skills = memberIn.Skills
            };
            _memberService.Save(member);
            return Ok();
        }
        [HttpPost]
        [Route("UpdateMember")]
        public IActionResult UpdateMember(MemberInputModel memberIn)
        {

            //var mappedData = _mapper.Map<Member>(memberIn);

            //_memberService.Update(mappedData);
            return Ok();
        }
        [HttpDelete]
        [Route("DeleteMember")]
        public IActionResult DeleteMember(long id)
        {
            _memberService.DeleteById(id);

            return Ok();
        }



        [HttpGet]
        [Route("FindById")]
        public IActionResult FindById(long id)
        {

            var member = _memberService.FindById(id);

            //var mappedData = _mapper.Map<MemberViewModel>(member);
            //return Ok(mappedData);
            return Ok();

        }




        [HttpGet]
        [Route("getMembers")]
        public IActionResult GetMembers()
        {
            //var members = _memberService.Get();
            List<Member> members=new List<Member>();
            members.Add(new Member
            {
                Id=10,
                Name="Member 1"
            });
            members.Add(new Member
            {
                Id = 10,
                Name = "Member 2"
            });
            members.Add(new Member
            {
                Id = 10,
                Name = "Member 3"
            });

            return Ok(members);

        }


        public override void Dispose()
        {

            _memberService?.Dispose();
            _skillService?.Dispose();
        }
    }

}