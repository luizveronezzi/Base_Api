using Data.Interface;
using Data.Model;
using System.Threading.Tasks;

namespace Data.Repository
{
    public class UnitOfWork : IUnitOfWork
    {
        private bool disposed = false; 
       
        private readonly securityContext _context;
        public IAcessos Acessos { get; private set; }

        public UnitOfWork(securityContext context)
        {
            _context = context;
            Acessos = new AcessosRepository(_context);
        }

        public async Task<int> SaveAsync()
        {
            return await _context.SaveChangesAsync();
        }

        protected virtual void Dispose(bool disposing)
        {
            if (!this.disposed)
            {
                if (disposing)
                {
                    _context.Dispose();
                }
            }
            this.disposed = true;
        }
        public void Dispose()
        {
            //Dispose(true);
            //GC.SuppressFinalize(this);
        }
    }
}
