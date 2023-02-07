using IM.Core.Entities;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Reflection.Emit;
using System.Text;
using System.Threading.Tasks;

namespace IM.Repo.DBContext
{
    public class IMDBContext : DbContext
    {
        public IMDBContext(DbContextOptions options) : base(options) { }

        //entities
        public DbSet<Member>? Members { get; set; }
        public DbSet<Skill>? Skills { get; set; }
        public DbSet<Country>? Countries { get; set; }
        public DbSet<City>? Cities { get; set; }
        public DbSet<MemberSkill> MemberSkills { get; set; }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {

            modelBuilder.Entity<Member>().HasOne(s => s.Country).WithMany(g => g.Members).HasForeignKey(s => s.CountryId);
            modelBuilder.Entity<MemberSkill>().HasOne(s => s.Member).WithMany(g => g.MemberSkills).HasForeignKey(e => e.SkillId);
            modelBuilder.Entity<MemberSkill>().HasOne(s => s.Skill).WithMany(g => g.MemberSkills).HasForeignKey(e => e.SkillId);       
            modelBuilder.Entity<City>().HasOne(s => s.Country).WithMany(g => g.Cities).HasForeignKey(e => e.CountryId);

            modelBuilder.Entity<Member>().HasKey(e => e.Id);
            modelBuilder.Entity<MemberSkill>().HasKey(e => e.Id);
            modelBuilder.Entity<Country>().HasKey(e => e.Id);
            modelBuilder.Entity<City>().HasKey(e => e.Id);

            modelBuilder.Entity<Member>().Property(e => e.Active).HasDefaultValue(true);
            modelBuilder.Entity<MemberSkill>().Property(e => e.Active).HasDefaultValue(true);
            modelBuilder.Entity<Country>().Property(e => e.Active).HasDefaultValue(true);
            modelBuilder.Entity<City>().Property(e => e.Active).HasDefaultValue(true);
            modelBuilder.Entity<Skill>().Property(e => e.Active).HasDefaultValue(true);
        }
    }
}
