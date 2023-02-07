﻿using IM.Core.Entities;
using IM.Core.Infra.Repos;
using IM.Core.Services;
using System;
using System.Collections.Generic;
using System.Diagnostics.Metrics;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace IM.bll.Services
{
    public class MemberService : BaseService, IMemberService
    {
        private IUnitOfWork _repo;
        private IMemberSkillService _memberSkillService;
        public MemberService(IUnitOfWork repo, IMemberSkillService memberSkillService)
        {
            _repo = repo;
            _memberSkillService = memberSkillService;
        }

        public void Save(Member member)
        {
            member.Active = true;
            member.CreatedDate = DateTime.Now;

            _repo.MemberR.Add(member);
            _repo.Save();
        }
        public void SaveWithSkills(Member entity)
        {
            entity.Active = true;
            entity.CreatedDate = DateTime.Now;

            _memberSkillService.OnMemberSave(entity);

            _repo.MemberR.Add(entity);
            _repo.Save();
        }
        public void Update(Member member)
        {
            var existingEntity = _repo.MemberR.GetById(member.Id);

            //if (existingEntity != null)
            //{
            //    existingEntity.FirstName = member.FirstName;
            //    existingEntity.LastName = member.LastName;
            //    existingEntity.MobileNumber = member.MobileNumber;
            //    existingEntity.EmergencyContact = member.EmergencyContact;
            //    existingEntity.HomeDistrict = member.HomeDistrict;
            //    existingEntity.ModifiedDate = DateTime.Now;

            //    _repo.MemberR.Update(existingEntity);
            //    _repo.Save();
            //}


        }
        public void DeleteById(long id)
        {
            var member = _repo.MemberR.GetById(id);
            _repo.MemberR.Remove(member);
            _repo.Save();
        }
        public Member SoftDelete(Member member)
        {
            return member;
        }

        public Member FindById(long id)
        {
            return _repo.MemberR.GetById(id);
        }

        public IEnumerable<Member> Get()
        {
            return _repo.MemberR.GetAll();
        }



        public override void Dispose()
        {
            _repo?.Dispose();
        }


    }
}
