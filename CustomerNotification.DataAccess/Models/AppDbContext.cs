using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;

#nullable disable

namespace CustomerNotification.DataAccess.Models
{
    public partial class AppDbContext : DbContext
    {
        public AppDbContext()
        {
        }

        public AppDbContext(DbContextOptions<AppDbContext> options)
            : base(options)
        {
        }

        public virtual DbSet<BodyDataType> BodyDataTypes { get; set; }
        public virtual DbSet<Channel> Channels { get; set; }
        public virtual DbSet<Customer> Customers { get; set; }
        public virtual DbSet<FieldName> FieldNames { get; set; }
        public virtual DbSet<MessageType> MessageTypes { get; set; }
        public virtual DbSet<VGetCustomerDetail> VGetCustomerDetails { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see http://go.microsoft.com/fwlink/?LinkId=723263.
                optionsBuilder.UseSqlServer("Data Source=(localdb)\\mssqllocaldb;Initial Catalog=NHFIC;Integrated Security=True");
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.HasAnnotation("Relational:Collation", "SQL_Latin1_General_CP1_CI_AS");

            modelBuilder.Entity<BodyDataType>(entity =>
            {
                entity.Property(e => e.Id)
                    .ValueGeneratedNever()
                    .HasColumnName("id");

                entity.Property(e => e.BodyType)
                    .IsRequired()
                    .HasMaxLength(100)
                    .IsFixedLength(true);
            });

            modelBuilder.Entity<Channel>(entity =>
            {
                entity.Property(e => e.Id)
                    .ValueGeneratedNever()
                    .HasColumnName("id");

                entity.Property(e => e.Channel1)
                    .IsRequired()
                    .HasMaxLength(100)
                    .HasColumnName("Channel")
                    .IsFixedLength(true);

                entity.HasOne(d => d.BodyType)
                    .WithMany(p => p.Channels)
                    .HasForeignKey(d => d.BodyTypeId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Channels_BodyTypes");
            });

            modelBuilder.Entity<Customer>(entity =>
            {
                entity.Property(e => e.Id)
                    .ValueGeneratedNever()
                    .HasColumnName("id");

                entity.Property(e => e.CustomerId)
                    .IsRequired()
                    .HasMaxLength(100)
                    .IsFixedLength(true);

                entity.Property(e => e.Email)
                    .HasMaxLength(100)
                    .IsFixedLength(true);

                entity.Property(e => e.FirstName)
                    .IsRequired()
                    .HasMaxLength(100)
                    .IsFixedLength(true);

                entity.Property(e => e.LastName)
                    .IsRequired()
                    .HasMaxLength(100)
                    .IsFixedLength(true);

                entity.HasOne(d => d.IdNavigation)
                    .WithOne(p => p.Customer)
                    .HasForeignKey<Customer>(d => d.Id)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Customers_MessageTypes");

                entity.HasOne(d => d.MessageType)
                    .WithMany(p => p.Customers)
                    .HasForeignKey(d => d.MessageTypeId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Customers_Channels");
            });

            modelBuilder.Entity<FieldName>(entity =>
            {
                entity.Property(e => e.Id)
                    .ValueGeneratedNever()
                    .HasColumnName("id");

                entity.Property(e => e.FieldName1)
                    .IsRequired()
                    .HasMaxLength(100)
                    .HasColumnName("FieldName")
                    .IsFixedLength(true);

                entity.HasOne(d => d.MessageType)
                    .WithMany(p => p.FieldNames)
                    .HasForeignKey(d => d.MessageTypeId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_FieldNames_MessageTypes");
            });

            modelBuilder.Entity<MessageType>(entity =>
            {
                entity.Property(e => e.Id)
                    .ValueGeneratedNever()
                    .HasColumnName("id");

                entity.Property(e => e.MessageType1)
                    .IsRequired()
                    .HasMaxLength(100)
                    .HasColumnName("MessageType")
                    .IsFixedLength(true);
            });

            modelBuilder.Entity<VGetCustomerDetail>(entity =>
            {
                entity.HasNoKey();

                entity.ToView("vGetCustomerDetails");

                entity.Property(e => e.BodyType)
                    .IsRequired()
                    .HasMaxLength(100)
                    .IsFixedLength(true);

                entity.Property(e => e.CustomerId)
                    .IsRequired()
                    .HasMaxLength(100)
                    .IsFixedLength(true);

                entity.Property(e => e.Email)
                    .HasMaxLength(100)
                    .IsFixedLength(true);

                entity.Property(e => e.FieldName)
                    .IsRequired()
                    .HasMaxLength(100)
                    .IsFixedLength(true);

                entity.Property(e => e.FirstName)
                    .IsRequired()
                    .HasMaxLength(100)
                    .IsFixedLength(true);

                entity.Property(e => e.Id).HasColumnName("id");

                entity.Property(e => e.LastName)
                    .IsRequired()
                    .HasMaxLength(100)
                    .IsFixedLength(true);

                entity.Property(e => e.MessageType)
                    .IsRequired()
                    .HasMaxLength(100)
                    .IsFixedLength(true);
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
