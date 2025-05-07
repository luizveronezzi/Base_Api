using Microsoft.EntityFrameworkCore;

namespace Data.Model
{
    public class securityContext : DbContext
    {
        public securityContext(DbContextOptions<securityContext> options) : base(options)
        {
        }

        public DbSet<acessos> acessos { get; set; }

    }
}
