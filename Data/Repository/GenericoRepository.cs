using Data.Interface;
using Data.Model;
using Microsoft.EntityFrameworkCore;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace Data.Repository
{
    public class GenericoRepository<Tabela> : IGenericoCrud<Tabela> where Tabela : class
    {
        private readonly securityContext _context;
        private DbSet<Tabela> _dbset;

        public GenericoRepository(securityContext context)
        {
            _context = context;
            _dbset = context.Set<Tabela>();
        }

        public async Task AlterarAsync(Tabela tabela)
        {
            _context.Entry(tabela).State = EntityState.Modified;
        }

        public async Task ExcluirAsync(Tabela tabela)
        {
            _dbset.Remove(tabela);
        }

        public async Task InserirAsync(Tabela tabela)
        {
            await _dbset.AddAsync(tabela);
        }

        public async Task InserirVariosAsync(List<Tabela> tabela)
        {
            await _dbset.AddRangeAsync(tabela);
        }

        public async Task<Tabela> PesquisarAsync(int id)
        {
            return await _dbset.FindAsync(id);
        }

    }


}
