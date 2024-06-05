using BooksAPI.Models;
using Microsoft.EntityFrameworkCore;

namespace BooksAPI.Data
{
    public partial class ApiContext: DbContext
    {
        public ApiContext(DbContextOptions<ApiContext> options)
        : base(options)
        {
        }
        public DbSet<Books> Books { get;set; }
        public DbSet<Login> Logins { get;set; }
        public DbSet<Response> Response { get; set; }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Books>().HasKey(books => books.Id);
            modelBuilder.Entity<Login>().HasKey(login => login.IdUsuario);

            modelBuilder.Entity<Response>(entity =>
            {
                entity.HasNoKey();
            });

            modelBuilder.Entity<Books>(entity =>
            {
                entity.Property(books => books.Id).HasColumnName("BooksId");
                entity.Property(books => books.Title).HasColumnName("Title");
                entity.Property(books => books.Author).HasColumnName("Author");
                entity.Property(books => books.Genre).HasColumnName("Genre");
                entity.Property(books => books.PublishDate).HasColumnName("PublishDate").HasColumnType("date");
            });

            modelBuilder.Entity<Login>(entity =>
            {
                entity.Property(login => login.IdUsuario).HasColumnName("IdUsuario");
                entity.Property(login => login.username).HasColumnName("username");
                entity.Property(login => login.password).HasColumnName("password");
            });
        }
    }
}
