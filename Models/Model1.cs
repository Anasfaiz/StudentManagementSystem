using System;
using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity;
using System.Linq;

namespace StudentManagementSystem.Models
{
    public partial class Model1 : DbContext
    {
        public Model1()
            : base("name=Model1")
        {
        }

        public virtual DbSet<Batch> Batches { get; set; }
        public virtual DbSet<Course> Courses { get; set; }
        public virtual DbSet<Registration> Registrations { get; set; }
        public virtual DbSet<User> User { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Batch>()
                .Property(e => e.Batch1)
                .IsUnicode(false);

            modelBuilder.Entity<Batch>()
                .Property(e => e.Year)
                .IsUnicode(false);

            modelBuilder.Entity<Batch>()
                .HasMany(e => e.Registrations)
                .WithOptional(e => e.Batch)
                .HasForeignKey(e => e.Batch_id);

            modelBuilder.Entity<Course>()
                .Property(e => e.Course1)
                .IsUnicode(false);

            modelBuilder.Entity<Course>()
                .HasMany(e => e.Registrations)
                .WithOptional(e => e.Course)
                .HasForeignKey(e => e.Course_id);

            modelBuilder.Entity<Registration>()
                .Property(e => e.FirstName)
                .IsUnicode(false);

            modelBuilder.Entity<Registration>()
                .Property(e => e.MiddleName)
                .IsUnicode(false);

            modelBuilder.Entity<Registration>()
                .Property(e => e.LastName)
                .IsUnicode(false);

            modelBuilder.Entity<User>()
                .Property(e => e.FirstName)
                .IsUnicode(false);

            modelBuilder.Entity<User>()
                .Property(e => e.MiddleName)
                .IsUnicode(false);

            modelBuilder.Entity<User>()
                .Property(e => e.LastName)
                .IsUnicode(false);

            modelBuilder.Entity<User>()
                .Property(e => e.UserName)
                .IsUnicode(false);

            modelBuilder.Entity<User>()
                .Property(e => e.Password)
                .IsUnicode(false);
        }
    }
}
