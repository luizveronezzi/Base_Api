using Data.Interface;
using Data.Model;

namespace Data.Repository
{
    public class AcessosRepository :  GenericoRepository<acessos>, IAcessos
    {
        private readonly securityContext _context;
        public AcessosRepository(securityContext context) : base(context)
        {
            _context = context;
        }
    }
}
