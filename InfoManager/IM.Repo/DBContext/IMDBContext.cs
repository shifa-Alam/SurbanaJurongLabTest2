using IM.Core.Entities;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
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

            //modelBuilder.Entity<Member>()
            //    .HasOne(a => a.Country);
            //modelBuilder.Entity<Member>()
            //    .HasMany(e => e.Skills).WithMany(d=>d.);
            //modelBuilder.Entity<Member>()
            //    .HasOne(a => a.City);
            //modelBuilder.Entity<Member>()
            //    .HasKey(a => a.Id);
            //modelBuilder.Entity<Skill>()
            //    .HasKey(e => e.Id);
            //modelBuilder.Entity<Country>()
            //    .HasKey(e => e.Id);
            //modelBuilder.Entity<MemberSkill>()
            //    .HasKey(e => e.Id);
        }
    }
}
